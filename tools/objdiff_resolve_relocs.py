#!/usr/bin/env python3

"""
objdiff_resolve_relocs.py — resolve relocations in ELF .o files to a
fixed fictional virtual base address, strip the relocation tables,
write `*.resolved.o` sidecars. Brief 206 workaround for objdiff's
`matched_functions` metric under-counting `.legacy.c` / `.legacy_sp3.c`
/ `.s` ship paths.

The problem
-----------

objdiff's `matched_functions` requires the unrelocated `.o` bytes
to match exactly — including the reloc records. dsd's delink
convention attaches external symbols to literal pool values that
mwcc emits as raw literals: where mwcc writes a raw word
`0x027e0000` into `.text`, dsd synthesises a `data_027e0000`
external + an `R_ARM_ABS32` reloc against it. The linker resolves
both shapes to the SAME final byte, but the unrelocated `.o` reloc
tables differ (one has the entry, the other doesn't), so objdiff's
strict byte-compare reports a mismatch even though the post-link
ROM is byte-identical (verified by `ninja sha1` PASS).

Per the brief 199 / 203 / 206 research (see
`docs/research/objdiff-fuzzy-vs-complete-metric.md`), every
`.legacy.c` ship, every `.legacy_sp3.c` ship, and every `.s`
worked-example ship typically under-ticks `matched_functions` even
when `complete_units` hits 100% and the SHA1 gate passes.
Reporting `matched_functions` as the headline metric makes the
post-pivot arc look like +11 functions when the real number is
+44. We need an accurate `matched_functions` so the metric can
re-take the headline.

The fix
-------

Apply both files' relocations to a fixed fictional virtual base
address, then strip the relocation tables. After this transform:

- `.text` bytes contain relocated values — the bytes the linker
  WOULD have written given the same symbol addresses.
- The relocation tables are empty, so objdiff sees no reloc
  differences.
- objdiff's `matched_functions` becomes accurate for all ship
  paths (`.c`, `.legacy.c`, `.legacy_sp3.c`, `.s`).

For external symbols (`st_shndx == SHN_UNDEF`), the "address" is
derived from the symbol name. dsd's naming convention embeds the
real address as 8 hex digits — `data_021a6354`, `func_020905dc`,
`switch_02087c10`, etc. — and that hex IS the address mwcc emits
as a raw literal for the same pool word. Using the embedded hex
guarantees that an mwcc-raw-literal slot and a dsd-promoted-reloc
slot resolve to identical bytes.

For named external symbols (e.g. `OSi_PostIrqEvent`,
`memcpy`), we fall back to a deterministic 24-bit name hash
clustered near a high fictional base — both `.o` files reference
the same name, so they get the same address.

For in-section symbols, the resolved address is
`section_base[section_name] + st_value`, keyed by section NAME
(not per-file section header index) so cross-file consistency
holds even when the section orderings differ.

Algorithm
---------

For each ELF .o file:

1. Parse the ELF header + section table.
2. Build a section-name → fictional-base mapping (`.text` →
   `0x02000000`, `.data` → `0x02100000`, ...).
3. For each RELA reloc section linked to an allocated PROGBITS /
   NOBITS section:
   a. For each `(r_offset, r_info, r_addend)` entry:
      - Look up the symbol's resolved address `S`.
      - **R_ARM_ABS32**: write `(S + A) & 0xffffffff` at
        `target[r_offset]`, 4 bytes little-endian.
      - **R_ARM_PC24**: compute
        `((S + A) - P) >> 2`, mask to 24 bits, OR into the
        instruction at `target[r_offset]` (preserving the
        condition+opcode bits in `[31:24]`). `P` =
        `section_base[target] + r_offset`.
   b. Zero out the reloc section header's `sh_size` (entries
      become invisible to readers).
4. Write the modified buffer to `<original>.resolved.o`.

For each pair `(target_path, base_path)` in `objdiff.json`:
- Run the algorithm above on both files.
- Rewrite `target_path` / `base_path` to point at the
  `<original>.resolved.o` sidecars.

Reloc-type corpus
-----------------

Corpus-wide scan of 500 `.o` files across all three regions: only
`R_ARM_ABS32` (type 2, ~7035 entries) and `R_ARM_PC24` (type 1,
~4332 entries) appear in `.rela.text` / `.rela.data`. No
`R_ARM_THM_CALL`, `R_ARM_CALL`, `R_ARM_THM_JUMP24`, etc. — the
ARM-only nature of the DS arm9 main + overlays plus dsd's specific
delink output keep the reloc-type set small. Anything else
encountered at runtime is an explicit error (so brief 206+
silently-broken regressions don't slip through).

Usage
-----

  python tools/objdiff_resolve_relocs.py --in objdiff.json
      [--project-root .]

Idempotent: re-running detects units whose `target_path` /
`base_path` already point at `.resolved.o` and leaves the JSON
unchanged. The sidecar files are always regenerated to track
upstream source changes.

References
----------

- `docs/research/objdiff-fuzzy-vs-complete-metric.md` — diagnosis
  + three paths forward. This tool implements option (3):
  post-build relocation harness.
- `tools/objdiff_filter_panic_units.py` — sibling tool, runs FIRST
  in the chain to drop crash-trigger units before this one
  resolves them.
- `tools/configure.py` — wires this tool into the `objdiff_report`
  ninja rule between the filter and `objdiff-cli report generate`.
"""

from __future__ import annotations

import argparse
import json
import re
import struct
import sys
from pathlib import Path

# --------------------------------------------------------------------------- #
# ELF32 little-endian constants
# --------------------------------------------------------------------------- #

ELF_MAGIC = b"\x7fELF"
ELF_CLASS_32 = 1
ELF_DATA_2LSB = 1

ELF_HEADER_SIZE = 0x34
SH_ENTRY_SIZE = 40

# Section header field offsets (32-bit ELF).
SH_NAME = 0
SH_TYPE = 4
SH_FLAGS = 8
SH_OFFSET = 16
SH_SIZE = 20
SH_LINK = 24
SH_INFO = 28
SH_ENTSIZE = 36

# Section types we touch.
SHT_NULL = 0
SHT_PROGBITS = 1
SHT_SYMTAB = 2
SHT_STRTAB = 3
SHT_RELA = 4
SHT_NOBITS = 8
SHT_REL = 9

# Section flags.
SHF_ALLOC = 0x2
SHF_EXECINSTR = 0x4

# Symbol-table entry layout (16 bytes).
SYM_ENTRY_SIZE = 16
ST_NAME = 0
ST_VALUE = 4
ST_SIZE = 8
ST_INFO = 12
ST_OTHER = 13
ST_SHNDX = 14

SHN_UNDEF = 0
SHN_ABS = 0xfff1

# ARM relocation types we support.
R_ARM_NONE = 0
R_ARM_PC24 = 1
R_ARM_ABS32 = 2

# --------------------------------------------------------------------------- #
# Fictional base addresses
# --------------------------------------------------------------------------- #

# Each allocated section name gets a fixed fictional virtual base. The
# spacing (`0x100000` = 1 MiB) is generous: it dwarfs any real section
# size in this project, so per-section offsets never bleed across
# section boundaries. The total range stays well within R_ARM_PC24's
# ±32 MiB displacement limit.
DEFAULT_SECTION_BASES: dict[str, int] = {
    ".text": 0x02000000,
    ".data": 0x02100000,
    ".rodata": 0x02200000,
    ".bss": 0x02300000,
    ".init": 0x02400000,
    ".sbss": 0x02500000,
    ".sdata": 0x02600000,
    ".ctor": 0x02700000,
    ".dtor": 0x02800000,
}

# Base for the FNV-1a 24-bit name-hash fallback (for symbols whose
# names don't carry an embedded address). Clustered near 0x04000000
# so it's far enough from real section bases to be visually distinct
# in any diff, but still inside R_ARM_PC24's ±32 MiB envelope of the
# `.text` base.
NAME_HASH_BASE = 0x04000000
NAME_HASH_MASK = 0x00ffffff

# Sub-section prefix-base lookup for fallback (e.g. `.rodata.str1.1`,
# `.text.unlikely`). Picked off the leading well-known prefix in
# `DEFAULT_SECTION_BASES`. The bottom 12 bits encode a per-suffix
# offset (deterministic via a name hash) so distinct sub-sections of
# the same parent don't alias each other's addresses.
def section_base_for(name: str, bases: dict[str, int] | None = None) -> int:
    """Return the fictional virtual base address for `name`.

    Exact match in `bases` (or `DEFAULT_SECTION_BASES`) wins. For
    sub-sections like `.rodata.str1.1`, fall back to the parent
    prefix's base + a small per-suffix offset (so distinct
    sub-sections don't collide). Unknown allocated section names get
    `NAME_HASH_BASE` plus a 24-bit name hash.
    """
    table = bases if bases is not None else DEFAULT_SECTION_BASES
    if name in table:
        return table[name]
    # Sub-section: look for a known prefix.
    for prefix, base in table.items():
        if name.startswith(prefix + "."):
            suffix_hash = _fnv1a_24(name[len(prefix) + 1:])
            return base + (suffix_hash & 0xffff) * 0x10
    return NAME_HASH_BASE | (_fnv1a_24(name) & NAME_HASH_MASK)


# --------------------------------------------------------------------------- #
# Symbol-name → address resolver
# --------------------------------------------------------------------------- #

# dsd's delink names external data / func / switch / jump_table symbols
# with the embedded address as 8 hex digits, prefixed by the kind
# (`data_`, `func_`, `switch_`, `jumptable_`, `unk_`, etc.) and
# optionally the overlay tag (`data_ov006_021ceae4` — observed in the
# wild). Capture group 1 is the trailing 8 hex; we use that as the
# address.
_NAME_ADDR_RE = re.compile(r"_([0-9a-fA-F]{8})$")


def _fnv1a_24(name: str) -> int:
    """Compute a 24-bit FNV-1a hash of `name`.

    Used as the deterministic fallback address for named externals
    (e.g. `memcpy`, `OSi_PostIrqEvent`) which don't carry an embedded
    address in their name. Both `.o` files reference the symbol by
    the same name, so the same hash → the same fictional address →
    the same post-relocation bytes.

    24 bits keeps the value compact enough that the cluster (when
    OR'd onto `NAME_HASH_BASE`) stays inside R_ARM_PC24's ±32 MiB
    range relative to `.text`'s fictional base.
    """
    h = 0x811c9dc5
    for c in name.encode("utf-8"):
        h = ((h ^ c) * 0x01000193) & 0xffffffff
    return h & 0x00ffffff


def resolve_symbol_address(
    name: str,
    st_value: int,
    st_shndx: int,
    section_bases_by_idx: dict[int, int],
) -> int:
    """Return the fictional virtual address for this symbol.

    Resolution priority:
      1. `SHN_ABS` — `st_value` is the absolute address.
      2. `SHN_UNDEF` (external) — name-based:
         - 8-hex-digit suffix in the name → use that hex.
         - Otherwise → `NAME_HASH_BASE | FNV-1a(name)`.
      3. In-section symbol — `section_bases_by_idx[st_shndx] +
         st_value` (where the per-file section index has been
         mapped to a section-name-keyed canonical base).
      4. Anything else — name-hash fallback (defensive).
    """
    if st_shndx == SHN_ABS:
        return st_value & 0xffffffff
    if st_shndx == SHN_UNDEF:
        m = _NAME_ADDR_RE.search(name)
        if m:
            return int(m.group(1), 16)
        return NAME_HASH_BASE | _fnv1a_24(name)
    if st_shndx in section_bases_by_idx:
        return (section_bases_by_idx[st_shndx] + st_value) & 0xffffffff
    # Defensive fallback — shouldn't trigger for well-formed dsd /
    # mwcc output, but don't crash on unfamiliar shapes.
    return NAME_HASH_BASE | _fnv1a_24(name)


# --------------------------------------------------------------------------- #
# Custom exceptions
# --------------------------------------------------------------------------- #


class ResolveRelocsError(RuntimeError):
    """Raised for unsupported reloc types or malformed ELF inputs.

    Caught by `main()` and reported per-file so a single bad unit
    doesn't sink the whole report generation. The brief mandates
    "fail loudly" on unknown reloc types so silent regressions
    can't slip in — that's enforced inside `resolve_elf_relocs`
    via this exception.
    """


# --------------------------------------------------------------------------- #
# ELF parsing helpers
# --------------------------------------------------------------------------- #


def _parse_elf_header(buf: bytes) -> tuple[int, int]:
    """Return (e_shoff, e_shnum). Raises on invalid ELF32-LE input.

    Also validates that `e_shentsize` matches our hardcoded 40 and
    that `e_shstrndx` is in-range. Callers can then trust the
    section-table walk.
    """
    if len(buf) < ELF_HEADER_SIZE or buf[:4] != ELF_MAGIC:
        raise ResolveRelocsError("not an ELF file")
    if buf[4] != ELF_CLASS_32 or buf[5] != ELF_DATA_2LSB:
        raise ResolveRelocsError("not 32-bit little-endian ELF")
    e_shoff = struct.unpack_from("<I", buf, 0x20)[0]
    e_shentsize = struct.unpack_from("<H", buf, 0x2e)[0]
    e_shnum = struct.unpack_from("<H", buf, 0x30)[0]
    e_shstrndx = struct.unpack_from("<H", buf, 0x32)[0]
    if e_shentsize != SH_ENTRY_SIZE:
        raise ResolveRelocsError(
            f"unexpected e_shentsize {e_shentsize} (want {SH_ENTRY_SIZE})"
        )
    if e_shstrndx >= e_shnum:
        raise ResolveRelocsError(
            f"e_shstrndx {e_shstrndx} >= e_shnum {e_shnum}"
        )
    return e_shoff, e_shnum


def _read_shstrtab(buf: bytes, e_shoff: int) -> bytes:
    """Read the section-name string table given the ELF header's
    `e_shstrndx`. Returns the raw bytes for index/find lookups.
    """
    e_shstrndx = struct.unpack_from("<H", buf, 0x32)[0]
    sh_base = e_shoff + e_shstrndx * SH_ENTRY_SIZE
    off = struct.unpack_from("<I", buf, sh_base + SH_OFFSET)[0]
    size = struct.unpack_from("<I", buf, sh_base + SH_SIZE)[0]
    if off + size > len(buf):
        raise ResolveRelocsError("shstrtab section out of bounds")
    return buf[off:off + size]


def _read_cstring(strtab: bytes, idx: int) -> str:
    """Read a NUL-terminated string from `strtab` at offset `idx`."""
    end = strtab.find(b"\x00", idx)
    if end < 0:
        return ""
    return strtab[idx:end].decode("ascii", errors="replace")


def _iter_sections(buf: bytes, e_shoff: int, e_shnum: int):
    """Yield (idx, name_idx, sh_type, sh_flags, sh_offset, sh_size,
    sh_link, sh_info, sh_entsize) for every section. Pure tuple
    output so callers don't need to know the header offsets.
    """
    for i in range(e_shnum):
        base = e_shoff + i * SH_ENTRY_SIZE
        sh_name = struct.unpack_from("<I", buf, base + SH_NAME)[0]
        sh_type = struct.unpack_from("<I", buf, base + SH_TYPE)[0]
        sh_flags = struct.unpack_from("<I", buf, base + SH_FLAGS)[0]
        sh_offset = struct.unpack_from("<I", buf, base + SH_OFFSET)[0]
        sh_size = struct.unpack_from("<I", buf, base + SH_SIZE)[0]
        sh_link = struct.unpack_from("<I", buf, base + SH_LINK)[0]
        sh_info = struct.unpack_from("<I", buf, base + SH_INFO)[0]
        sh_entsize = struct.unpack_from("<I", buf, base + SH_ENTSIZE)[0]
        yield (
            i, sh_name, sh_type, sh_flags,
            sh_offset, sh_size, sh_link, sh_info, sh_entsize,
        )


# --------------------------------------------------------------------------- #
# Reloc application
# --------------------------------------------------------------------------- #


def _apply_abs32(
    out: bytearray, target_off: int, r_offset: int, sym_addr: int, addend: int,
) -> None:
    """Apply R_ARM_ABS32: write `(S + A) & 0xffffffff` at
    `target[r_offset]` (4 bytes, little-endian).
    """
    abs_off = target_off + r_offset
    if abs_off + 4 > len(out):
        raise ResolveRelocsError(
            f"R_ARM_ABS32 target offset {abs_off:#x} out of bounds"
        )
    struct.pack_into(
        "<I", out, abs_off, (sym_addr + addend) & 0xffffffff,
    )


def _apply_pc24(
    out: bytearray,
    target_off: int,
    target_base_va: int,
    r_offset: int,
    sym_addr: int,
    addend: int,
) -> None:
    """Apply R_ARM_PC24: write `((S + A) - P) >> 2` into bits
    `[23:0]` of the 32-bit instruction at `target[r_offset]`,
    preserving the condition+opcode in bits `[31:24]`.

    `P` is the virtual address of the relocated field —
    `target_base_va + r_offset`.

    The displacement is sign-extended on the wire (24-bit signed,
    shifted left by 2). For our fictional base addresses it almost
    certainly fits, but if it overflows ±32 MiB we still write the
    truncated low 24 bits — that matches what a tolerant linker
    does and keeps the two files in sync (both will overflow
    identically given identical symbol addresses).
    """
    abs_off = target_off + r_offset
    if abs_off + 4 > len(out):
        raise ResolveRelocsError(
            f"R_ARM_PC24 target offset {abs_off:#x} out of bounds"
        )
    P = target_base_va + r_offset
    displacement = (sym_addr + addend - P) >> 2
    instr = struct.unpack_from("<I", out, abs_off)[0]
    new_instr = (instr & 0xff000000) | (displacement & 0x00ffffff)
    struct.pack_into("<I", out, abs_off, new_instr)


# --------------------------------------------------------------------------- #
# Main per-file driver
# --------------------------------------------------------------------------- #


def resolve_elf_relocs(
    buf: bytes,
    *,
    section_bases: dict[str, int] | None = None,
) -> bytes:
    """Apply R_ARM_ABS32 + R_ARM_PC24 relocations targeting allocated
    `SHF_ALLOC` sections to fictional virtual base addresses, strip
    the reloc tables (by zeroing their `sh_size`), return the
    modified ELF bytes.

    `section_bases` overrides the default name → fictional-base
    mapping (`.text` → `0x02000000`, etc.). Tests use it to pin
    bases to known values for assertion; production callers pass
    `None` to accept the defaults.

    Raises `ResolveRelocsError` on:
      - non-ELF / non-ARM-LE inputs
      - unsupported reloc types
      - malformed reloc / symbol-table entries

    The relocation table itself is left in the file (offset and
    header stay valid) — only `sh_size` is set to 0, so any
    downstream reader sees an empty table. We don't compact the
    file or renumber sections, since that would change every
    section header in ways objdiff might trip over.
    """
    out = bytearray(buf)
    e_shoff, e_shnum = _parse_elf_header(out)
    shstrtab = _read_shstrtab(out, e_shoff)

    # First pass: build a section-index → fictional-base map for
    # allocated (`SHF_ALLOC`) PROGBITS / NOBITS sections, plus the
    # symtab location and the linked strtab.
    section_bases_by_idx: dict[int, int] = {}
    section_offsets_by_idx: dict[int, int] = {}  # for reloc apply targeting
    symtab_off = symtab_link = 0
    found_symtab = False
    for (i, sh_name, sh_type, sh_flags,
         sh_offset, _sh_size, sh_link, _sh_info, _sh_entsize
         ) in _iter_sections(out, e_shoff, e_shnum):
        name = _read_cstring(shstrtab, sh_name)
        if sh_type in (SHT_PROGBITS, SHT_NOBITS) and (sh_flags & SHF_ALLOC):
            section_bases_by_idx[i] = section_base_for(name, section_bases)
            section_offsets_by_idx[i] = sh_offset
        elif sh_type == SHT_SYMTAB:
            symtab_off = sh_offset
            symtab_link = sh_link
            found_symtab = True

    if not found_symtab:
        # No symtab → no symbols → nothing to resolve. Pass-through.
        return bytes(out)

    # Linked string table for symbol names.
    strtab_sh_base = e_shoff + symtab_link * SH_ENTRY_SIZE
    strtab_off = struct.unpack_from(
        "<I", out, strtab_sh_base + SH_OFFSET,
    )[0]
    strtab_size = struct.unpack_from(
        "<I", out, strtab_sh_base + SH_SIZE,
    )[0]
    if strtab_off + strtab_size > len(out):
        raise ResolveRelocsError("symtab strtab out of bounds")
    strtab = bytes(out[strtab_off:strtab_off + strtab_size])

    # Second pass: process every relocation section whose target
    # is an allocated section we just mapped.
    for (i, _sh_name, sh_type, _sh_flags,
         sh_offset, sh_size, _sh_link, sh_info, sh_entsize
         ) in _iter_sections(out, e_shoff, e_shnum):
        if sh_type not in (SHT_REL, SHT_RELA):
            continue
        target_idx = sh_info
        if target_idx not in section_bases_by_idx:
            # Reloc section targets something we don't relocate
            # (e.g. `.rel.debug_info`). Leave it alone — objdiff
            # doesn't look at debug sections, and stripping debug
            # relocs would change the file shape in ways that
            # could surprise downstream tools.
            continue
        target_off = section_offsets_by_idx[target_idx]
        target_base_va = section_bases_by_idx[target_idx]
        entry_size = sh_entsize or (12 if sh_type == SHT_RELA else 8)
        if entry_size not in (8, 12):
            raise ResolveRelocsError(
                f"unexpected reloc entsize {entry_size}"
            )
        if sh_size % entry_size != 0:
            raise ResolveRelocsError(
                f"reloc section size {sh_size} not a multiple of "
                f"entry size {entry_size}"
            )
        for ent_off in range(sh_offset, sh_offset + sh_size, entry_size):
            r_offset = struct.unpack_from("<I", out, ent_off)[0]
            r_info = struct.unpack_from("<I", out, ent_off + 4)[0]
            if entry_size == 12:
                r_addend = struct.unpack_from("<i", out, ent_off + 8)[0]
            else:
                r_addend = 0
            r_type = r_info & 0xff
            r_sym = r_info >> 8
            if r_type == R_ARM_NONE:
                continue
            # Look up the symbol entry.
            sym_ent_off = symtab_off + r_sym * SYM_ENTRY_SIZE
            if sym_ent_off + SYM_ENTRY_SIZE > len(out):
                raise ResolveRelocsError(
                    f"symbol index {r_sym} out of bounds"
                )
            st_name = struct.unpack_from(
                "<I", out, sym_ent_off + ST_NAME,
            )[0]
            st_value = struct.unpack_from(
                "<I", out, sym_ent_off + ST_VALUE,
            )[0]
            st_shndx = struct.unpack_from(
                "<H", out, sym_ent_off + ST_SHNDX,
            )[0]
            sym_name = _read_cstring(strtab, st_name)
            sym_addr = resolve_symbol_address(
                sym_name, st_value, st_shndx, section_bases_by_idx,
            )
            # For REL (no explicit addend), the addend lives in
            # the relocated field. For R_ARM_ABS32 REL: read the
            # current word as the addend. For R_ARM_PC24 REL:
            # sign-extend the bottom 24 bits × 4. RELA passes the
            # explicit addend through.
            if entry_size == 8:
                cur_word = struct.unpack_from(
                    "<I", out, target_off + r_offset,
                )[0]
                if r_type == R_ARM_ABS32:
                    r_addend = cur_word
                elif r_type == R_ARM_PC24:
                    imm24 = cur_word & 0x00ffffff
                    # sign-extend 24 bits, then × 4
                    if imm24 & 0x00800000:
                        imm24 |= 0xff000000
                    r_addend = struct.unpack(
                        "<i", struct.pack("<I", imm24 & 0xffffffff),
                    )[0] << 2
            if r_type == R_ARM_ABS32:
                _apply_abs32(
                    out, target_off, r_offset, sym_addr, r_addend,
                )
            elif r_type == R_ARM_PC24:
                _apply_pc24(
                    out, target_off, target_base_va, r_offset,
                    sym_addr, r_addend,
                )
            else:
                raise ResolveRelocsError(
                    f"unsupported reloc type {r_type} on symbol "
                    f"{sym_name!r} at offset {r_offset:#x} "
                    "(only R_ARM_ABS32 / R_ARM_PC24 / R_ARM_NONE "
                    "appear in the project corpus — see brief 206 "
                    "research note)"
                )
        # Zero the reloc section's size in its header so any reader
        # sees an empty table after our pass. We leave the file
        # offset + reloc data bytes in place — compacting the file
        # would shift every following section and create more diff
        # surface than it removes.
        sh_header_off = e_shoff + i * SH_ENTRY_SIZE
        struct.pack_into("<I", out, sh_header_off + SH_SIZE, 0)

    return bytes(out)


# --------------------------------------------------------------------------- #
# objdiff.json integration
# --------------------------------------------------------------------------- #


def _resolved_path(path: Path) -> Path:
    """Return the `<name>.resolved.o` sidecar path for `path`."""
    return path.with_suffix(path.suffix + ".resolved")


def _is_resolved(rel_path: str) -> bool:
    """True if `rel_path` already points at a `.resolved.o` sidecar.

    Used for idempotency: a re-run shouldn't re-rewrite the JSON or
    re-resolve already-resolved files.
    """
    return rel_path.endswith(".o.resolved")


def _resolve_one(
    src: Path,
    *,
    section_bases: dict[str, int] | None = None,
) -> Path:
    """Read `src`, resolve relocations, write `<src>.resolved` and
    return the sidecar path.

    The output filename is `<src.name>.resolved` — adding `.resolved`
    as an extra suffix on top of the existing `.o`. That keeps the
    `.o` suffix recognizable while making the resolved-ness
    explicit. Ninja can map the original `.o` rule to depend on
    the resolved sidecar (or vice versa) without filename clashes.
    """
    buf = src.read_bytes()
    out = resolve_elf_relocs(buf, section_bases=section_bases)
    dst = _resolved_path(src)
    dst.write_bytes(out)
    return dst


def process_objdiff_json(
    path: Path,
    *,
    project_root: Path | None = None,
    section_bases: dict[str, int] | None = None,
) -> tuple[int, int, list[tuple[str, str]]]:
    """Walk every unit in `path`, resolve relocs for its target +
    base `.o` files, rewrite the JSON paths to point at the
    sidecars.

    Returns `(processed, skipped, failures)` where `failures` is a
    list of `(unit_name, message)` tuples for units we couldn't
    resolve (logged but not raised — we keep going so a single
    bad unit doesn't sink the whole report).

    Idempotency: if BOTH paths in a unit already end in
    `.o.resolved`, the unit is left untouched (counted as skipped).
    Otherwise both files are re-resolved (so source-`.o` changes
    propagate even when the JSON already points at sidecars).
    """
    project_root = (project_root or path.parent).resolve()
    with path.open("r", encoding="utf-8") as f:
        data = json.load(f)
    units = data.get("units", [])
    processed = 0
    skipped = 0
    failures: list[tuple[str, str]] = []
    for unit in units:
        target_rel = unit.get("target_path", "")
        base_rel = unit.get("base_path", "")
        if not target_rel or not base_rel:
            continue
        if _is_resolved(target_rel) and _is_resolved(base_rel):
            skipped += 1
            continue
        target_path = (project_root / target_rel).resolve()
        base_path = (project_root / base_rel).resolve()
        # Both files must exist; the filter step running before us
        # guarantees this for well-formed units, but we re-check
        # defensively.
        if not target_path.is_file() or not base_path.is_file():
            failures.append((
                unit.get("name", "?"),
                f"target or base file missing — "
                f"target={target_path}, base={base_path}",
            ))
            continue
        try:
            resolved_target = _resolve_one(
                target_path, section_bases=section_bases,
            )
            resolved_base = _resolve_one(
                base_path, section_bases=section_bases,
            )
        except ResolveRelocsError as e:
            failures.append((unit.get("name", "?"), str(e)))
            continue
        # objdiff.json is a portable artifact: keep repository-relative
        # paths POSIX-shaped even when generated on Windows.
        unit["target_path"] = resolved_target.relative_to(
            project_root
        ).as_posix() if resolved_target.is_relative_to(project_root) else (
            resolved_target.as_posix()
        )
        unit["base_path"] = resolved_base.relative_to(
            project_root
        ).as_posix() if resolved_base.is_relative_to(project_root) else (
            resolved_base.as_posix()
        )
        processed += 1
    data["units"] = units
    with path.open("w", encoding="utf-8") as f:
        json.dump(data, f, indent=2)
        f.write("\n")
    return processed, skipped, failures


def main(argv: list[str] | None = None) -> int:
    ap = argparse.ArgumentParser(
        description=(
            "Resolve relocations in objdiff.json's referenced .o "
            "files to a fictional base address, strip reloc "
            "tables, write *.resolved sidecars and rewrite the "
            "JSON to point at them. Brief 206 workaround for "
            "objdiff matched_functions under-counting. Idempotent."
        ),
    )
    ap.add_argument(
        "--in", dest="in_path", type=Path, required=True,
        help="Path to objdiff.json (rewritten in place).",
    )
    ap.add_argument(
        "--project-root", type=Path, default=None,
        help="Project root for resolving relative paths. "
             "Defaults to the directory of --in.",
    )
    ap.add_argument(
        "--verbose", "-v", action="store_true",
        help="Print the full failure list (default just summary).",
    )
    args = ap.parse_args(argv)
    if not args.in_path.is_file():
        print(f"error: {args.in_path} not found", file=sys.stderr)
        return 1
    processed, skipped, failures = process_objdiff_json(
        args.in_path, project_root=args.project_root,
    )
    print(
        f"objdiff_resolve_relocs: processed {processed}, "
        f"skipped {skipped} (already resolved), "
        f"failed {len(failures)} "
        "(see brief 206 research note for the resolver rationale).",
        file=sys.stderr,
    )
    if args.verbose and failures:
        for name, reason in failures:
            print(f"  {name}: {reason}", file=sys.stderr)
    return 0


if __name__ == "__main__":
    sys.exit(main())
