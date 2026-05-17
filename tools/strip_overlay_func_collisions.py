#!/usr/bin/env python3

"""
strip_overlay_func_collisions.py — patch ELF .o files to break the
mwldarm overlay-swap-blind veneer-generation cascade (brief 132).

Context
-------

mwldarm 2.0/sp1p5 is overlay-blind when deciding whether to emit
ARM/Thumb interwork veneers. When ov004's `.rodata` contains a
pointer to VA X, AND ov002 defines `func_ov002_X` (kind:FUNC,
in `.text`) at the same VA, mwldarm:

1. Resolves ov004's `R_ARM_ABS32 data_ov004_X` to address X.
2. Scans the global symbol table for a FUNC at address X.
3. Finds `func_ov002_X` (or finds X inside `func_ov002_Y`'s range).
4. Decides "cross-section FUNC pointer needs interwork" → emits
   a veneer, rewrites the loaded value to the veneer's address.

The 1,024 bytes of veneer pool then displace ov004's `.data`,
`.bss`, and downstream pointers — cascading ~165 KB of byte-diff
(brief 129, brief 131).

This tool breaks the FUNC detection by changing the colliding
ov002 symbols' type from STT_FUNC (2) to STT_NOTYPE (0). The
symbols remain GLOBAL so intra-ov002 cross-`.o` references still
resolve. mwldarm's veneer scan should skip them because they're
no longer marked as functions.

What's a "collision"?
---------------------

For each overlay PAIR (A, B) sharing a VA range, find every FUNC
symbol in module B whose VA falls inside module A's data range.
That FUNC is a collision candidate.

For brief 132 the only known overlay pair triggering this is
(ov004, ov002). Other overlay pairs sharing VAs (e.g. ov000 +
ov001, ov005 + ov006) don't trigger because their layouts don't
produce the same address-aliased data/code overlap.

Usage
-----

    # Run as a post-delink ninja step (analogous to
    # patch_section_align.py).
    python tools/strip_overlay_func_collisions.py \\
        --config-dir config/eur/arm9 \\
        --delinks-dir build/eur/delinks

Idempotent — already-NOTYPE symbols are skipped silently.
"""

from __future__ import annotations

import argparse
import os
import re
import struct
import sys
from pathlib import Path

# ----- ELF32 constants ---------------------------------------------------

EI_MAG = b"\x7fELF"
ELFCLASS32 = 1

# Section types
SHT_SYMTAB = 2

# Symbol type/binding bit-packing in st_info
STT_NOTYPE = 0
STT_OBJECT = 1
STT_FUNC = 2

STB_LOCAL = 0
STB_GLOBAL = 1
STB_WEAK = 2

# ELF32_ST_INFO(binding, type) = (binding << 4) | (type & 0xf)
# ELF32_ST_TYPE(info) = info & 0xf
# ELF32_ST_BIND(info) = (info >> 4) & 0xf

# Elf32_Sym layout offsets (each entry is 16 bytes total)
SYM_ENTRY_SIZE = 16
SYM_ST_NAME = 0x00  # uint32: index into strtab
SYM_ST_VALUE = 0x04  # uint32: address / value
SYM_ST_SIZE = 0x08  # uint32: size
SYM_ST_INFO = 0x0c  # uint8: type|binding
SYM_ST_OTHER = 0x0d  # uint8: visibility (STV_*)
SYM_ST_SHNDX = 0x0e  # uint16: section index

# Elf32_Ehdr offsets
E_SHOFF = 0x20
E_SHENTSIZE = 0x2e
E_SHNUM = 0x30
E_SHSTRNDX = 0x32

# Elf32_Shdr offsets
SH_NAME = 0x00
SH_TYPE = 0x04
SH_OFFSET = 0x10
SH_SIZE = 0x14
SH_LINK = 0x18


class ELFParseError(Exception):
    """File is not a valid 32-bit little-endian ELF, or is truncated."""


# ----- ELF helpers --------------------------------------------------------


def _check_elf_magic(data: bytes) -> None:
    if len(data) < 0x34:
        raise ELFParseError(f"file too short ({len(data)} bytes)")
    if data[:4] != EI_MAG:
        raise ELFParseError("missing ELF magic")
    if data[4] != ELFCLASS32:
        raise ELFParseError("not a 32-bit ELF")


def _find_symtab(data: bytes) -> tuple[int, int, int]:
    """Return (symtab_offset, symtab_size, strtab_offset)."""
    e_shoff = struct.unpack_from("<I", data, E_SHOFF)[0]
    e_shentsize = struct.unpack_from("<H", data, E_SHENTSIZE)[0]
    e_shnum = struct.unpack_from("<H", data, E_SHNUM)[0]

    for i in range(e_shnum):
        sh_off = e_shoff + i * e_shentsize
        sh_type = struct.unpack_from("<I", data, sh_off + SH_TYPE)[0]
        if sh_type != SHT_SYMTAB:
            continue
        symtab_off = struct.unpack_from("<I", data, sh_off + SH_OFFSET)[0]
        symtab_size = struct.unpack_from("<I", data, sh_off + SH_SIZE)[0]
        sh_link = struct.unpack_from("<I", data, sh_off + SH_LINK)[0]
        strtab_hdr_off = e_shoff + sh_link * e_shentsize
        strtab_off = struct.unpack_from(
            "<I", data, strtab_hdr_off + SH_OFFSET,
        )[0]
        return (symtab_off, symtab_size, strtab_off)
    raise ELFParseError("no .symtab found")


def _read_strtab_string(data: bytes, strtab_off: int, idx: int) -> str:
    """Read the NUL-terminated C string at strtab_off + idx."""
    start = strtab_off + idx
    end = data.find(b"\x00", start)
    if end < 0:
        return data[start:].decode("utf-8", errors="replace")
    return data[start:end].decode("utf-8", errors="replace")


def patch_symbol_types(
    data: bytes | bytearray,
    *,
    symbol_names: set[str],
    new_type: int = STT_NOTYPE,
) -> tuple[bytearray, list[tuple[str, int, int]]]:
    """Patch each symbol in `symbol_names` to have `new_type`.

    Preserves binding (GLOBAL/LOCAL/WEAK) and all other fields.
    Returns (patched_bytes, changes) where each change is
    (name, old_type, new_type). Idempotent: symbols already at
    `new_type` are skipped.

    Pure function — tests can drive it with synthetic ELF blobs.
    """
    _check_elf_magic(data)
    buf = bytearray(data)
    symtab_off, symtab_size, strtab_off = _find_symtab(buf)

    changes: list[tuple[str, int, int]] = []
    n_syms = symtab_size // SYM_ENTRY_SIZE
    for i in range(n_syms):
        sym_off = symtab_off + i * SYM_ENTRY_SIZE
        st_name = struct.unpack_from("<I", buf, sym_off + SYM_ST_NAME)[0]
        st_info = buf[sym_off + SYM_ST_INFO]

        if st_name == 0:
            continue
        try:
            name = _read_strtab_string(buf, strtab_off, st_name)
        except UnicodeDecodeError:
            continue

        if name not in symbol_names:
            continue

        old_type = st_info & 0xf
        if old_type == new_type:
            continue
        binding = (st_info >> 4) & 0xf
        new_info = (binding << 4) | (new_type & 0xf)
        buf[sym_off + SYM_ST_INFO] = new_info
        changes.append((name, old_type, new_type))

    return buf, changes


# ----- Collision detection -----------------------------------------------


_SYM_RE = re.compile(
    r"(\S+) kind:(\w+)(?:\(([^)]+)\))? addr:0x([0-9a-f]+)",
)


def _load_symbols(path: Path) -> list[tuple[int, int, str, str, str]]:
    """Parse a dsd `symbols.txt`. Returns (addr, size, name, kind,
    info) tuples; size=0 for non-function symbols."""
    rows: list[tuple[int, int, str, str, str]] = []
    for line in path.read_text(encoding="utf-8").splitlines():
        m = _SYM_RE.match(line)
        if m is None:
            continue
        name = m.group(1)
        kind = m.group(2)
        info = m.group(3) or ""
        addr = int(m.group(4), 16)
        size = 0
        size_m = re.search(r"size=0x([0-9a-f]+)", info)
        if size_m:
            size = int(size_m.group(1), 16)
        rows.append((addr, size, name, kind, info))
    return rows


def _load_section_map(path: Path) -> list[tuple[str, int, int]]:
    """Parse the first stanza of `delinks.txt` to get section ranges.

    Returns list of (section_name, start_va, end_va) tuples. The
    first lines of delinks.txt look like::

        .text       start:0x021c9d60 end:0x021de638 kind:code ...
        .rodata     start:0x021de638 end:0x02209a5c kind:rodata ...
        ...
    """
    out: list[tuple[str, int, int]] = []
    pattern = re.compile(
        r"\.(\w+)\s+start:0x([0-9a-f]+)\s+end:0x([0-9a-f]+)",
    )
    for line in path.read_text(encoding="utf-8").splitlines():
        line = line.strip()
        if not line.startswith("."):
            break
        m = pattern.match(line)
        if m is None:
            continue
        out.append((
            "." + m.group(1),
            int(m.group(2), 16),
            int(m.group(3), 16),
        ))
    return out


def find_collisions(
    config_dir: Path,
    *,
    sink_overlay: str,
    sink_section: str,
    source_overlays: tuple[str, ...],
) -> set[str]:
    """Find FUNC symbols in `source_overlays` whose VA falls inside
    `sink_overlay`'s `sink_section` range.

    These are the "colliding" symbols whose FUNC-typed presence in
    the global link namespace triggers mwldarm's veneer-gen for any
    `sink_overlay` data load that resolves to those addresses.

    Returns the set of colliding FUNC symbol names (any one of
    which mwldarm will treat as a veneer target).
    """
    sink_dir = config_dir / "overlays" / sink_overlay
    sink_sections = _load_section_map(sink_dir / "delinks.txt")
    sink_range = None
    for name, start, end in sink_sections:
        if name == sink_section:
            sink_range = (start, end)
            break
    if sink_range is None:
        raise ValueError(
            f"section {sink_section!r} not found in "
            f"{sink_dir / 'delinks.txt'}"
        )

    colliding: set[str] = set()
    for src_ovl in source_overlays:
        src_dir = config_dir / "overlays" / src_ovl
        for addr, size, name, kind, _info in _load_symbols(
            src_dir / "symbols.txt"
        ):
            if kind != "function":
                continue
            # FUNC's body range:
            func_end = addr + size if size else addr + 4
            # Treat as colliding if any byte of the func body is
            # inside the sink section's VA range. mwldarm's
            # containment check is range-based, not exact-VA.
            if func_end <= sink_range[0]:
                continue
            if addr >= sink_range[1]:
                continue
            colliding.add(name)
    return colliding


# ----- File patching driver ---------------------------------------------


def clear_text_exec_flag(
    data: bytes | bytearray,
) -> tuple[bytearray, list[tuple[str, int, int]]]:
    """Clear SHF_EXECINSTR (0x4) on every `.text*` section.

    Brief 132 hypothesis (under test): mwldarm's veneer decision
    is gated by SHF_EXECINSTR on the symbol's containing section,
    not the symbol's STT_FUNC type. Clearing the exec bit on a
    section whose symbols are referenced (but never actually
    executed at runtime — since ov002 is mutually-exclusive with
    ov004 at runtime) may suppress veneer generation.

    Returns (patched_bytes, changes) where each change is
    (section_name, old_flags, new_flags). Idempotent: sections
    already lacking SHF_EXECINSTR are skipped.

    NOTE: This is BROAD — it clears exec on the WHOLE section,
    not per-symbol. Use with care: if non-colliding functions in
    the same section need interwork support, they may break.
    """
    _check_elf_magic(data)
    buf = bytearray(data)

    e_shoff = struct.unpack_from("<I", buf, E_SHOFF)[0]
    e_shentsize = struct.unpack_from("<H", buf, E_SHENTSIZE)[0]
    e_shnum = struct.unpack_from("<H", buf, E_SHNUM)[0]
    e_shstrndx = struct.unpack_from("<H", buf, E_SHSTRNDX)[0]

    shstr_hdr_off = e_shoff + e_shstrndx * e_shentsize
    shstr_off = struct.unpack_from(
        "<I", buf, shstr_hdr_off + SH_OFFSET,
    )[0]

    changes: list[tuple[str, int, int]] = []
    for i in range(e_shnum):
        sh_off = e_shoff + i * e_shentsize
        sh_name = struct.unpack_from("<I", buf, sh_off + SH_NAME)[0]
        sh_flags_off = sh_off + 0x08
        sh_flags = struct.unpack_from("<I", buf, sh_flags_off)[0]
        try:
            name_end = buf.index(0, shstr_off + sh_name)
            name = buf[shstr_off + sh_name:name_end].decode(
                "utf-8", errors="replace",
            )
        except (ValueError, UnicodeDecodeError):
            continue
        if not name.startswith(".text"):
            continue
        if not (sh_flags & 0x4):  # SHF_EXECINSTR
            continue
        new_flags = sh_flags & ~0x4
        struct.pack_into("<I", buf, sh_flags_off, new_flags)
        changes.append((name, sh_flags, new_flags))
    return buf, changes


def patch_o_file(
    path: Path,
    *,
    symbol_names: set[str],
    new_type: int = STT_NOTYPE,
    clear_text_exec: bool = False,
) -> int:
    """In-place patch of `path`. Returns count of changes made
    (symbol-type retypes + optional section-flag clears).
    Errors are logged to stderr and return code is the count
    so far (or 0 on early failure)."""
    try:
        original = path.read_bytes()
    except OSError as e:
        print(f"error: read {path}: {e}", file=sys.stderr)
        return 0
    try:
        patched, type_changes = patch_symbol_types(
            original,
            symbol_names=symbol_names,
            new_type=new_type,
        )
    except ELFParseError as e:
        print(f"error: {path}: {e}", file=sys.stderr)
        return 0
    if not type_changes:
        # No colliding symbols in this file → skip the exec-strip
        # too (we only want to suppress exec on files that
        # contain at least one colliding symbol).
        return 0

    flag_changes: list[tuple[str, int, int]] = []
    if clear_text_exec:
        try:
            patched, flag_changes = clear_text_exec_flag(patched)
        except ELFParseError as e:
            print(f"error: {path}: {e}", file=sys.stderr)
            return 0

    try:
        path.write_bytes(patched)
    except OSError as e:
        print(f"error: write {path}: {e}", file=sys.stderr)
        return 0
    for name, old, new in type_changes:
        print(
            f"strip-collision: {path}: {name} "
            f"type {old} -> {new}",
            file=sys.stderr,
        )
    for name, old, new in flag_changes:
        print(
            f"strip-collision: {path}: {name} "
            f"flags 0x{old:x} -> 0x{new:x} (cleared SHF_EXECINSTR)",
            file=sys.stderr,
        )
    return len(type_changes) + len(flag_changes)


def main() -> int:
    ap = argparse.ArgumentParser(
        description=(
            "Patch ELF .o files to strip the FUNC type from "
            "ov002 symbols colliding with ov004's .rodata, "
            "breaking mwldarm's overlay-blind veneer trigger."
        ),
    )
    ap.add_argument(
        "--config-dir", type=Path, required=True,
        help="Path to config/<ver>/arm9 directory.",
    )
    ap.add_argument(
        "--delinks-dir", type=Path, required=True,
        help="Path to build/<ver>/delinks directory containing the "
             ".o files to patch (dsd-emitted gap objects).",
    )
    ap.add_argument(
        "--sink-overlay", default="ov004",
        help="The overlay whose .rodata loads are mis-vectored to "
             "veneers (default: ov004).",
    )
    ap.add_argument(
        "--sink-section", default=".rodata",
        help="The sink overlay's section whose addresses are at "
             "risk of FUNC collision (default: .rodata).",
    )
    ap.add_argument(
        "--source-overlays", nargs="*",
        default=["ov002"],
        help="Overlays whose FUNC symbols may collide with the "
             "sink overlay's section (default: ov002 — the only "
             "known case as of brief 132).",
    )
    ap.add_argument(
        "--clear-text-exec", action="store_true",
        help="In addition to STT_FUNC→STT_NOTYPE, also clear "
             "SHF_EXECINSTR on .text sections of files that "
             "contain at least one colliding symbol. Brief 132 "
             "hypothesis under test — mwldarm's veneer trigger "
             "may use section exec-flag rather than symbol type.",
    )
    args = ap.parse_args()

    if not args.config_dir.is_dir():
        print(
            f"error: --config-dir {args.config_dir} is not a directory",
            file=sys.stderr,
        )
        return 1
    if not args.delinks_dir.is_dir():
        print(
            f"error: --delinks-dir {args.delinks_dir} is not a directory",
            file=sys.stderr,
        )
        return 1

    colliding = find_collisions(
        args.config_dir,
        sink_overlay=args.sink_overlay,
        sink_section=args.sink_section,
        source_overlays=tuple(args.source_overlays),
    )
    if not colliding:
        # Nothing to do — overlay structure changed, or no collisions.
        # Silent success.
        return 0

    total_changed = 0
    n_files_touched = 0
    for o_path in sorted(args.delinks_dir.rglob("*.o")):
        n = patch_o_file(
            o_path,
            symbol_names=colliding,
            clear_text_exec=args.clear_text_exec,
        )
        total_changed += n
        if n:
            n_files_touched += 1

    if total_changed:
        print(
            f"strip-collision: patched {total_changed} symbol(s) "
            f"in {n_files_touched} file(s) "
            f"(collision set size: {len(colliding)})",
            file=sys.stderr,
        )
    return 0


if __name__ == "__main__":
    sys.exit(main())
