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
SH_OFFSET = 0x10         # uint32: file offset of this section's bytes
SH_SIZE = 0x14           # uint32: byte length of the section
SH_ADDRALIGN = 0x20      # uint32: alignment constraint (what we rewrite)

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


def patch_file(path: Path, *, target_align: int = TARGET_ALIGN) -> int:
    """Patch `path` in-place. Returns exit code: 0 = success,
    1 = parse error (stderr-logged)."""
    try:
        original = path.read_bytes()
    except OSError as e:
        print(f"error: could not read {path}: {e}", file=sys.stderr)
        return 1
    try:
        patched, changes = patch_text_sections(
            original, target_align=target_align,
        )
    except ELFParseError as e:
        print(f"error: {path}: {e}", file=sys.stderr)
        return 1

    if not changes:
        # Nothing to do — either already 2-aligned, or no .text
        # sections at all. Both are fine; stay silent.
        return 0

    try:
        path.write_bytes(patched)
    except OSError as e:
        print(f"error: could not write {path}: {e}", file=sys.stderr)
        return 1

    # Success — one informational line per patched section.
    for name, old, new in changes:
        print(f"patched {path}: {name} sh_addralign {old} -> {new}",
              file=sys.stderr)
    return 0


def main() -> int:
    ap = argparse.ArgumentParser(
        description="Rewrite `.text*` sh_addralign on a "
                    "mwasmarm-emitted .o file. Idempotent.",
    )
    ap.add_argument("path", type=Path, help="Path to the .o file")
    ap.add_argument(
        "--target-align", type=int, default=TARGET_ALIGN,
        help=f"Alignment to rewrite to (default: {TARGET_ALIGN}). "
             "Only rewrites sections whose current align is higher.",
    )
    args = ap.parse_args()
    return patch_file(args.path, target_align=args.target_align)


if __name__ == "__main__":
    sys.exit(main())
