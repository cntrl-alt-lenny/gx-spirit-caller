#!/usr/bin/env python3

"""
patch_section_align.py — rewrite `.text`'s sh_addralign on a
mwasmarm-emitted ELF .o.

Context: mwasmarm (the mwccarm-bundle assembler) emits Thumb `.text`
sections with `sh_addralign=4` regardless of source-level
`.thumb` / `.balign 2` / `.align 1` directives. Combined with
dsd's `ALIGNALL(4)` in the generated LCF, mwldarm inserts 2-byte
padding when a Thumb TU's end isn't 4-aligned — shifting every
byte downstream and breaking the final `dsd rom build` validator.

See docs/research/thumb-align-wall.md for the full background and
peer-project survey. This tool is the fallback that PR #100's
"Option C" of that doc proposed: post-compile ELF patching.

What it does: walk the section-header table, find any `.text*`
section with `sh_addralign > 2`, rewrite it to `2`. Idempotent —
running on an already-patched .o is a no-op.

Scope: we ONLY touch `.text*` sections. `.data` / `.bss` / `.rodata`
alignments are left untouched because they come from genuine data
alignment needs (u32 tables want align=4). Only `.text` has the
mismatch-with-source-intent problem.

Usage:

    python tools/patch_section_align.py src/main/bios_svc.o

Integration: the mwasm rule in tools/configure.py appends this as
a post-compile step, so every .s → .o build auto-patches.

Exit codes:
  0 — success (any .text patched, or already-2 idempotent)
  1 — file missing / not an ELF / parse error (logs to stderr)
"""

from __future__ import annotations

import argparse
import re
import struct
import sys
from pathlib import Path


# 32-bit ELF constants (we only target mwasmarm's ARM9 output which
# is always 32-bit LE; no need to generalise for 64-bit hosts).
EI_MAG0 = 0x7F
EI_MAG1 = ord("E")
EI_MAG2 = ord("L")
EI_MAG3 = ord("F")
ELFCLASS32 = 1
ELFDATA2LSB = 1  # little-endian; ARM9 .o files are always LE

# Offsets within the ELF32 ELF header (`Elf32_Ehdr`).
E_IDENT = 0x00
E_SHOFF = 0x20       # uint32: offset to section header table
E_SHENTSIZE = 0x2E   # uint16: size of each section header
E_SHNUM = 0x30       # uint16: count of section headers
E_SHSTRNDX = 0x32    # uint16: index of string-table section header

# Offsets within each Elf32_Shdr.
SH_NAME = 0x00           # uint32: byte offset into .shstrtab
SH_TYPE = 0x04
SH_FLAGS = 0x08          # uint32: section flags
SH_OFFSET = 0x10         # uint32: file offset of this section's bytes
SH_SIZE = 0x14           # uint32: byte length of the section
SH_LINK = 0x18           # uint32: section-specific link
SH_INFO = 0x1C           # uint32: section-specific info (rel: target section idx)
SH_ADDRALIGN = 0x20      # uint32: alignment constraint (what we rewrite)
SH_ENTSIZE = 0x24        # uint32: per-entry size for tables

# ELF section types we care about for the trim-protect path
SHT_REL = 9
SHT_RELA = 4

# ELF32 Rel entry layout (.rel.text):
REL_OFFSET = 0x00        # uint32: byte offset into the relocated section

# The target alignment we want `.text` sections to land at. mwasmarm
# emits 4; we rewrite to 2 so the linker lets Thumb TUs sit at the
# 2-aligned addresses the baserom uses.
TARGET_ALIGN = 2


class ELFParseError(Exception):
    """Raised for structural problems with the .o file — not-an-ELF,
    truncation, or a string-table index out of bounds. Caller turns
    this into stderr + exit 1."""


def _read_u16(data: bytes, offset: int) -> int:
    return struct.unpack_from("<H", data, offset)[0]


def _read_u32(data: bytes, offset: int) -> int:
    return struct.unpack_from("<I", data, offset)[0]


def _write_u32(data: bytearray, offset: int, value: int) -> None:
    struct.pack_into("<I", data, offset, value)


def _check_elf_magic(data: bytes) -> None:
    if len(data) < 0x34:
        raise ELFParseError(
            f"file too short to be a 32-bit ELF (got {len(data)} bytes)"
        )
    if (data[0] != EI_MAG0 or data[1] != EI_MAG1
            or data[2] != EI_MAG2 or data[3] != EI_MAG3):
        raise ELFParseError("file does not begin with ELF magic")
    if data[4] != ELFCLASS32:
        raise ELFParseError(
            "not a 32-bit ELF (EI_CLASS != ELFCLASS32)"
        )
    if data[5] != ELFDATA2LSB:
        raise ELFParseError(
            "not little-endian (EI_DATA != ELFDATA2LSB); mwasmarm "
            "should always emit LE on ARM9"
        )


def _read_shstrtab(data: bytes) -> tuple[bytes, int, int, int]:
    """Pull header-table metadata + the string-table bytes.

    Returns (shstrtab_bytes, e_shoff, e_shentsize, e_shnum).
    """
    e_shoff = _read_u32(data, E_SHOFF)
    e_shentsize = _read_u16(data, E_SHENTSIZE)
    e_shnum = _read_u16(data, E_SHNUM)
    e_shstrndx = _read_u16(data, E_SHSTRNDX)

    if e_shoff == 0 or e_shnum == 0:
        raise ELFParseError("ELF has no section header table")
    if e_shstrndx >= e_shnum:
        raise ELFParseError(
            f"e_shstrndx ({e_shstrndx}) >= e_shnum ({e_shnum})"
        )

    # Locate the shstrtab section header, then its content bytes.
    shstr_hdr_off = e_shoff + e_shstrndx * e_shentsize
    shstr_off = _read_u32(data, shstr_hdr_off + SH_OFFSET)
    shstr_size = _read_u32(data, shstr_hdr_off + SH_SIZE)
    if shstr_off + shstr_size > len(data):
        raise ELFParseError(
            "shstrtab extends past end of file; .o is truncated"
        )
    return (data[shstr_off:shstr_off + shstr_size],
            e_shoff, e_shentsize, e_shnum)


def _read_cstring(buf: bytes, offset: int) -> str:
    end = buf.find(b"\0", offset)
    if end < 0:
        return buf[offset:].decode("utf-8", errors="replace")
    return buf[offset:end].decode("utf-8", errors="replace")


def patch_text_sections(
    data: bytes | bytearray,
    *,
    target_align: int = TARGET_ALIGN,
) -> tuple[bytearray, list[tuple[str, int, int]]]:
    """Return (patched_bytes, changes) where `changes` is a list of
    (section_name, old_addralign, new_addralign) tuples for every
    `.text*` section whose `sh_addralign` was rewritten.

    Pure function (no I/O) so tests can drive it with synthetic ELF
    blobs. Raises ELFParseError on structural problems.
    """
    _check_elf_magic(data)
    buf = bytearray(data)
    shstrtab, e_shoff, e_shentsize, e_shnum = _read_shstrtab(buf)

    changes: list[tuple[str, int, int]] = []
    for i in range(e_shnum):
        sh_off = e_shoff + i * e_shentsize
        name_off = _read_u32(buf, sh_off + SH_NAME)
        if name_off >= len(shstrtab):
            continue  # corrupt name offset — skip defensively
        name = _read_cstring(shstrtab, name_off)
        # We target `.text`, `.text.*` (ELF Section Group / lto
        # naming), and the common suffixed variants. Anything not
        # starting with `.text` is skipped — alignment of `.data`,
        # `.rodata`, `.bss`, etc. reflects real data constraints.
        if not name.startswith(".text"):
            continue
        cur = _read_u32(buf, sh_off + SH_ADDRALIGN)
        if cur <= target_align:
            continue  # idempotent: already 2 (or the unusual 1)
        _write_u32(buf, sh_off + SH_ADDRALIGN, target_align)
        changes.append((name, cur, target_align))
    return buf, changes


def _section_index_by_name(
    buf: bytes | bytearray, shstrtab: bytes,
    e_shoff: int, e_shentsize: int, e_shnum: int,
    target_name: str,
) -> int | None:
    """Return the ELF section header index for `target_name`, or None."""
    for i in range(e_shnum):
        sh_off = e_shoff + i * e_shentsize
        name_off = _read_u32(buf, sh_off + SH_NAME)
        if name_off >= len(shstrtab):
            continue
        if _read_cstring(shstrtab, name_off) == target_name:
            return i
    return None


def _rel_offsets_targeting_section(
    buf: bytes | bytearray, shstrtab: bytes,
    e_shoff: int, e_shentsize: int, e_shnum: int,
    target_section_idx: int,
) -> set[int]:
    """Brief 204: collect every relocation `r_offset` that targets a
    given section. Used to protect legitimate trailing pool-word
    relocation placeholders from the mwasm-padding trim heuristic.

    A `.rel.<name>` section has `sh_info == target_section_idx` and
    `sh_entsize == 8` (Rel) or 12 (Rela). Each entry's first u32 is
    `r_offset` — the byte offset INSIDE the target section that the
    relocation patches.

    Returns a set of `r_offset` values. Empty set if no `.rel.<name>`
    section exists (e.g. fully-resolved .o or unrelocatable .text).
    """
    out: set[int] = set()
    for i in range(e_shnum):
        sh_off = e_shoff + i * e_shentsize
        sh_type = _read_u32(buf, sh_off + SH_TYPE)
        if sh_type not in (SHT_REL, SHT_RELA):
            continue
        if _read_u32(buf, sh_off + SH_INFO) != target_section_idx:
            continue
        sh_offset = _read_u32(buf, sh_off + SH_OFFSET)
        sh_size = _read_u32(buf, sh_off + SH_SIZE)
        ent_size = _read_u32(buf, sh_off + SH_ENTSIZE)
        if ent_size == 0:
            continue
        for ent_off in range(sh_offset, sh_offset + sh_size, ent_size):
            if ent_off + 4 > len(buf):
                break
            out.add(_read_u32(buf, ent_off + REL_OFFSET))
    return out


def trim_text_section_padding(
    data: bytes | bytearray,
    *,
    delinks_slot_size: int | None = None,
) -> tuple[bytearray, list[tuple[str, int, int]]]:
    """Reverse mwasmarm's automatic 4-byte-size `.text` padding.

    Context: PR #115's regression bisect showed that mwasmarm pads
    the emitted `.text` section's `sh_size` up to the next multiple
    of 4, trailing the function content with `0x00 0x00` bytes. A
    6-byte Thumb thunk (e.g. VBlankIntrWait: `swi 0x05; bx lr` + a
    2-byte exit) becomes an 8-byte section. Even with our
    `sh_addralign=2` patch in place, that 8-byte size cascade-shifts
    every downstream byte at link time and breaks the module
    checksum.

    This function walks section headers. For each `.text*` section
    where:
      - `sh_size % 4 == 0` (mwasm padding lands on a 4-multiple), AND
      - the last 2 bytes of the section's content are `0x00 0x00`,
      - AND NO relocation patches the last 4 bytes (brief 204 fix:
        otherwise a legit reloc-placeholder pool word's trailing
        zeros look like mwasm padding to the heuristic),
      - AND `delinks_slot_size` either is `None` or differs from
        `sh_size` (brief 208 fix: if delinks declares the TU's
        intended `.text` size and mwasm emitted exactly that many
        bytes, the trailing zeros are real literal content, not
        padding — don't trim).
    …it trims `sh_size` by 2. Returns (patched_bytes, changes) where
    each change is `(name, old_size, new_size)`.

    The trim-trigger is deliberately narrow: only even-sized `.text`
    sections with trailing NULs AND no protecting reloc AND no
    delinks-size match qualify. Legit 8-byte Thumb functions that
    happen to end in `bx lr; nop` have the `nop` encoded as
    `0xBF00` (or `0x46C0`), not `0x0000`, so they don't match the
    byte-pattern trigger. `0x0000` is not a valid Thumb instruction
    in the ARMv5TE ISA — it's mwasm's pad byte, period.

    Brief 204's `.s` files (e.g. `func_02021b38.s`) end in a `.word
    data_sym` pool slot which appears as `0x00 0x00 0x00 0x00` in
    the .o (the linker fills these via the reloc). Without the
    reloc-protection check, the trim heuristic would shave 2 bytes
    off legitimate function content and cascade-shift the next TU.

    Brief 208 adds a complementary safety net for cases brief 204
    can't cover: a `.s` file whose last pool entry is a LITERAL
    `.word 0x7fff` (or any value < 0x01000000) has NO relocation
    on its last 4 bytes — but its trailing 2 bytes ARE
    `0x00 0x00`. The reloc-protection check passes (no protecting
    reloc exists) so brief 204 would still trim. The delinks-
    slot-size check catches this: delinks.txt declares the TU's
    `.text` slot as exactly N bytes (`end - start`); if mwasm
    emitted exactly N bytes, those trailing zeros are part of the
    literal payload, not padding. See `docs/research/
    first-wave-wall-literal-tail-trim.md`.
    """
    _check_elf_magic(data)
    buf = bytearray(data)
    shstrtab, e_shoff, e_shentsize, e_shnum = _read_shstrtab(buf)

    changes: list[tuple[str, int, int]] = []
    for i in range(e_shnum):
        sh_off = e_shoff + i * e_shentsize
        name_off = _read_u32(buf, sh_off + SH_NAME)
        if name_off >= len(shstrtab):
            continue
        name = _read_cstring(shstrtab, name_off)
        if not name.startswith(".text"):
            continue
        cur_size = _read_u32(buf, sh_off + SH_SIZE)
        if cur_size == 0 or cur_size % 4 != 0 or cur_size < 2:
            continue
        content_off = _read_u32(buf, sh_off + SH_OFFSET)
        if content_off + cur_size > len(buf):
            continue  # truncated file; skip defensively
        last_two = bytes(buf[
            content_off + cur_size - 2:content_off + cur_size
        ])
        if last_two != b"\x00\x00":
            continue
        # Brief 208: delinks-slot-size match. If delinks declares
        # the TU's `.text` slot as exactly `cur_size` bytes, mwasm
        # emitted a literal trailing pool word and the trailing
        # zeros are real content (e.g. `.word 0x7fff` → bytes
        # `ff 7f 00 00`). Don't trim.
        if (
            delinks_slot_size is not None
            and cur_size == delinks_slot_size
        ):
            continue
        # Brief 204: reloc-protection. If the .o has a relocation
        # whose r_offset is within the last 4 bytes of this .text
        # section, those zeros are a reloc placeholder (pool word
        # to be patched at link time), NOT mwasm padding. Don't
        # trim.
        reloc_offsets = _rel_offsets_targeting_section(
            buf, shstrtab, e_shoff, e_shentsize, e_shnum, i,
        )
        protect_start = cur_size - 4
        if any(
            protect_start <= ro < cur_size for ro in reloc_offsets
        ):
            continue
        new_size = cur_size - 2
        _write_u32(buf, sh_off + SH_SIZE, new_size)
        changes.append((name, cur_size, new_size))
    return buf, changes


# --------------------------------------------------------------------------- #
# Delinks-aware slot-size lookup (brief 208)
# --------------------------------------------------------------------------- #

# Match a TU declaration header in delinks.txt. The format is a
# source-path line ending in `:` followed by indented attributes.
# Example matching shape:
#
#     src/main/func_02023478.s:
#         complete
#         .text start:0x02023478 end:0x020234f8
#
# We capture the source path so we can map it back to the input .s
# file the patcher was just invoked on. The trailing colon is
# required to distinguish a TU header from a comment line.
_DELINKS_TU_HEADER_RE = re.compile(
    r"^(?P<path>[^\s:#][^\s:]*\.[csS](?:pp)?):\s*$",
)
# Match the `.text start:0xXXXX end:0xYYYY` line under a TU header.
# Brief 208's slot size = end - start. Allow either lower or upper
# hex case to match the rest of dsd's mixed-case output.
_DELINKS_TEXT_RANGE_RE = re.compile(
    r"^\s+\.text\s+start:0x(?P<start>[0-9a-fA-F]+)\s+"
    r"end:0x(?P<end>[0-9a-fA-F]+)\s*$",
)


def _lookup_delinks_slot_size(
    delinks_paths: list[Path],
    source_path: str,
) -> int | None:
    """Scan `delinks_paths` for the TU whose header matches
    `source_path`, return its `.text` slot size (`end - start`),
    or `None` when no match.

    `source_path` is matched against the captured TU header path
    using two normalisations:
      1. Exact string equality after normalising both to forward
         slashes (handles Windows backslashes in `ninja`'s `$in`).
      2. Suffix match: a TU header `src/main/foo.s` matches a
         caller-side `/abs/build/dir/src/main/foo.s` so the
         lookup works regardless of whether `$in` is the relative
         or absolute path. Brief 208's mwasm rule passes `$in`
         which is the source-relative path, but the helper is
         designed to be robust to either.

    Multiple delinks files are scanned in order; the first match
    wins. Brief 208 expects one match across the entire project
    (each `.s` file is referenced exactly once in exactly one
    delinks.txt).

    Pure function — does its own I/O on `delinks_paths`. Returns
    `None` for any of:
      - empty `delinks_paths` list
      - `source_path` not found in any file
      - matched TU header has no `.text start:... end:...` line
        (defensive; shouldn't happen for well-formed delinks)
    """
    norm_source = source_path.replace("\\", "/")
    for path in delinks_paths:
        try:
            text = path.read_text(encoding="utf-8")
        except OSError:
            continue
        # Walk line by line; when we see a TU header that matches
        # `source_path`, the NEXT line beginning with whitespace +
        # `.text` is the one whose `end - start` is the slot size.
        # `complete` / `incomplete` / other attribute lines under
        # the same TU header are skipped via the loop continuing
        # until we hit a `.text` line OR a new (unindented) line
        # that signals we left the TU.
        in_match = False
        for line in text.splitlines():
            if not in_match:
                m = _DELINKS_TU_HEADER_RE.match(line)
                if not m:
                    continue
                tu_path = m.group("path").replace("\\", "/")
                if tu_path == norm_source or norm_source.endswith(
                    "/" + tu_path,
                ):
                    in_match = True
                continue
            # In-match state: look for the .text range or a new TU
            # header (which would end the search without a match).
            range_m = _DELINKS_TEXT_RANGE_RE.match(line)
            if range_m:
                start = int(range_m.group("start"), 16)
                end = int(range_m.group("end"), 16)
                if end >= start:
                    return end - start
                return None
            # A blank line or a new TU header ends the in-match
            # window without finding a `.text` line — defensive
            # only; well-formed delinks always have one.
            if _DELINKS_TU_HEADER_RE.match(line):
                in_match = False
                # Re-check this line in case the new header
                # also matches (very unlikely but cheap).
                continue
    return None


def patch_file(
    path: Path, *,
    target_align: int = TARGET_ALIGN,
    trim_padding: bool = False,
    delinks_slot_size: int | None = None,
) -> int:
    """Patch `path` in-place. Returns exit code: 0 = success,
    1 = parse error (stderr-logged).

    With `trim_padding=True`, also runs `trim_text_section_padding`
    — needed for mwasm's 4-byte size-pad artifact (PR #115).

    Brief 208: `delinks_slot_size`, when not `None`, is the
    expected `.text` byte count from delinks.txt's `end - start`
    for this TU. Used to suppress false-positive trims when mwasm
    emitted exactly the intended number of bytes (literal-tail
    case). See `trim_text_section_padding` docstring.
    """
    try:
        original = path.read_bytes()
    except OSError as e:
        print(f"error: could not read {path}: {e}", file=sys.stderr)
        return 1
    try:
        patched, align_changes = patch_text_sections(
            original, target_align=target_align,
        )
        size_changes: list[tuple[str, int, int]] = []
        if trim_padding:
            patched, size_changes = trim_text_section_padding(
                patched, delinks_slot_size=delinks_slot_size,
            )
    except ELFParseError as e:
        print(f"error: {path}: {e}", file=sys.stderr)
        return 1

    if not align_changes and not size_changes:
        # Nothing to do — either already 2-aligned / no .text
        # sections / no trailing padding. Silent success.
        return 0

    try:
        path.write_bytes(patched)
    except OSError as e:
        print(f"error: could not write {path}: {e}", file=sys.stderr)
        return 1

    for name, old, new in align_changes:
        print(f"patched {path}: {name} sh_addralign {old} -> {new}",
              file=sys.stderr)
    for name, old, new in size_changes:
        print(f"patched {path}: {name} sh_size {old} -> {new} "
              "(trimmed mwasm padding)",
              file=sys.stderr)
    return 0


def main() -> int:
    ap = argparse.ArgumentParser(
        description="Rewrite `.text*` sh_addralign on a "
                    "mwasmarm-emitted .o file. Idempotent.",
    )
    ap.add_argument(
        "paths", type=Path, nargs="*",
        help="Path(s) to .o file(s). Accepts one or many. Mutually "
             "exclusive with --dir (use one or the other).",
    )
    ap.add_argument(
        "--dir", type=Path, default=None,
        help="Directory to walk recursively for *.o files. Used by "
             "the 'delink' ninja rule to batch-patch every "
             "dsd-produced gap .o cross-platform (find/xargs don't "
             "work on Windows cmd.exe). See PR #115.",
    )
    ap.add_argument(
        "--target-align", type=int, default=TARGET_ALIGN,
        help=f"Alignment to rewrite to (default: {TARGET_ALIGN}). "
             "Only rewrites sections whose current align is higher.",
    )
    ap.add_argument(
        "--trim-padding", action="store_true",
        help="Also trim mwasm's trailing 0x0000 size-padding from "
             "`.text` sections (required for mwasmarm .s → .o where "
             "the source is not a 4-byte multiple). See PR #115. "
             "Does NOT apply to dsd delink outputs — those don't "
             "have the padding artifact; alignment patching alone "
             "suffices for them.",
    )
    ap.add_argument(
        "--delinks", type=Path, action="append", default=None,
        help="Brief 208: path to a delinks.txt file. Pass once per "
             "module's delinks.txt (project usually has one for "
             "arm9 main + one per overlay). Combined with "
             "--source-path, the patcher looks up the intended "
             "`.text` slot size for the TU and suppresses "
             "false-positive trims when mwasm emitted exactly that "
             "many bytes (literal-tail case — see "
             "docs/research/first-wave-wall-literal-tail-trim.md).",
    )
    ap.add_argument(
        "--source-path", type=str, default=None,
        help="Brief 208: path of the `.s` source file the input "
             "`.o` was compiled from. Required when --delinks is "
             "provided. Used as the TU-header lookup key in "
             "delinks.txt.",
    )
    args = ap.parse_args()
    if args.dir is not None and args.paths:
        print("error: --dir and positional paths are mutually exclusive",
              file=sys.stderr)
        return 2
    if args.dir is not None:
        if not args.dir.is_dir():
            print(f"error: --dir {args.dir} is not a directory",
                  file=sys.stderr)
            return 1
        targets = sorted(args.dir.rglob("*.o"))
    else:
        targets = args.paths
    if not targets:
        # No .o files found — silent success. `dsd delink` may
        # legitimately produce zero gaps on a fully-carved module.
        return 0

    # Brief 208: look up the delinks slot size once per invocation.
    # The mwasm rule passes a single source-path + delinks-list per
    # .o; in --dir mode the lookup is skipped (delinks-slot-size
    # protection is per-TU and --dir is meant for bulk dsd gap-
    # object patching where the slot size doesn't apply anyway).
    delinks_slot_size: int | None = None
    if args.delinks and args.source_path:
        delinks_slot_size = _lookup_delinks_slot_size(
            args.delinks, args.source_path,
        )

    rc = 0
    for p in targets:
        result = patch_file(
            p,
            target_align=args.target_align,
            trim_padding=args.trim_padding,
            delinks_slot_size=delinks_slot_size,
        )
        if result != 0:
            rc = result
    return rc


if __name__ == "__main__":
    sys.exit(main())
