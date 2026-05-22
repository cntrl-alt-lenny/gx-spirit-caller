#!/usr/bin/env python3

"""
objdiff_filter_panic_units.py — filter objdiff.json to exclude
units that crash `objdiff-cli report generate` (brief 187).

Brief 187 Part 1 diagnosed `objdiff-cli report generate` panicking
on the spirit-caller project with:

    thread '<unnamed>' panicked at objdiff-core/src/arch/arm.rs:130:29:
    index out of bounds: the len is 0 but the index is 18446744073709551615

Two distinct failure modes contribute to the report being un-
generatable today:

  A. **ARM crash on code-less ELF objects.** objdiff-core's ARM
     processor calls `process_code` on every unit unconditionally
     (`objdiff-core/src/arch/arm.rs:130`). When the target `.o`
     has no `.text` section, an empty `.text`, or only data
     symbols, an internal length computation underflows (`0 - 1`
     cast to usize) → panic. Affects ~20 ov004 / main `_dsd_gap`
     TUs whose `.o` only carries data symbols (`D` flags under
     `nm`) — typically the placeholder pad regions between
     matched code blocks. The real fix is upstream
     (https://github.com/encounter/objdiff); brief 187 ships
     this workaround filter while that lands.

  B. **Missing .o files for unmatched `.legacy`/`.legacy_sp3`
     routing-tier functions.** dsd emits objdiff.json entries
     for every planned routing-tier compile (the `*.legacy` and
     `*.legacy_sp3` suffix variants for Style A epilogue +
     `1.2/sp3` per-TU routing). Until those functions get C
     source, no `.o` is produced and `objdiff-cli` fails to
     open the missing target with `No such file or directory`
     — also blocking report generation. These will resolve as
     the code-decomp wave (brief 188+) ships the matching `.c`
     files; the filter skips them cleanly in the meantime.

Without either filter, `ninja report` exits non-zero and
`build/<region>/report.json` never gets written — which means
the canonical objdiff-verified code-match metric is
unmeasurable. Brief 187's queue + workflow refresh both depend
on this metric being available.

Algorithm
---------

For each unit in `objdiff.json`:

1. Resolve `target_path` to an absolute filesystem path. If the
   file is missing → drop the unit (case B).
2. Open the ELF, scan section headers for `.text`. If absent
   or `sh_size == 0` → drop the unit (case A — code-less).
3. Otherwise keep the unit.

Write the filtered list back to `objdiff.json` (in-place, with
the same surrounding metadata fields). The report generator
then succeeds end-to-end on the survivors.

Usage
-----

  python tools/objdiff_filter_panic_units.py --in objdiff.json

Idempotent: re-running on an already-filtered file is a no-op.
Run as a post-step on the `objdiff` ninja rule (after `dsd
objdiff` emits the file and before `objdiff_report` consumes
it).

References
----------

- Upstream issue (filed in this brief): see
  `docs/research/objdiff-arm-crash-workaround.md` for the link
  + minimal reproducer.
- `tools/configure.py` — wires the filter into the `objdiff`
  ninja rule.
"""

from __future__ import annotations

import argparse
import json
import struct
import sys
from pathlib import Path


# ELF32 little-endian header / section header constants we need.
ELF_MAGIC = b"\x7fELF"
ELF_CLASS_32 = 1
ELF_DATA_2LSB = 1

# Section header fields (32-bit ELF, little-endian) — offsets in
# the section header structure (40 bytes total).
SH_NAME_OFFSET = 0     # uint32: index into section name table
SH_TYPE_OFFSET = 4     # uint32: section type (SHT_PROGBITS for .text)
SH_OFFSET_OFFSET = 16  # uint32: file offset of section data
SH_SIZE_OFFSET = 20    # uint32: section size in bytes
SH_LINK_OFFSET = 24    # uint32: section link (symtab → strtab)
SH_ENTSIZE_OFFSET = 36 # uint32: per-entry size for tables
SH_ENTRY_SIZE = 40     # bytes per section header

SHT_PROGBITS = 1
SHT_SYMTAB = 2
SHT_STRTAB = 3

# ELF32 symbol-table entry layout (16 bytes).
SYMBOL_ENTRY_SIZE = 16
ST_NAME_OFFSET = 0     # uint32: index into the linked strtab
ST_VALUE_OFFSET = 4    # uint32: symbol value (in-section offset for STB_LOCAL)
ST_SIZE_OFFSET = 8     # uint32: symbol size
ST_INFO_OFFSET = 12    # uint8: (bind << 4) | type
ST_SHNDX_OFFSET = 14   # uint16: section header index

# Symbol type — only STT_FUNC (= 2) tells the ARM arch processor
# this is real disassemblable code. STT_OBJECT (= 1) typed
# objects landing in `.text` (e.g. `BuildInfo` data blobs
# mwldarm relocates there) trigger the same crash, so they
# don't count as "addressable code" for the filter's purposes.
STT_NOTYPE = 0
STT_OBJECT = 1
STT_FUNC = 2
STT_SECTION = 3


def has_addressable_text_code(elf_path: Path) -> bool:
    """Return True iff `elf_path` is a 32-bit ELF whose `.text`
    section is non-empty AND has at least one symbol whose
    `st_shndx` points at `.text` with `st_size > 0`.

    Brief 187 Part 1 diagnosis: the upstream `objdiff-core` ARM
    arch processor's `process_code` panics with `index out of
    bounds: len 0, index usize::MAX` when handed an ELF that has
    `.text` content but no T-typed symbol covering it. The
    "len 0" length is the iteration over symbols-in-section,
    which is empty; the usize::MAX is `0 - 1` cast. Real
    examples in this project: ~20 `_dsd_gap@main_*` TUs where
    dsd's delink emits `.text` bytes for unmatched-but-known
    code blocks WITHOUT emitting a symbol for the code (only
    the `.data` symbols inside the same TU are named, while the
    `.text` carries content addressable only through external
    references).

    Returns False for:
      - non-existent files (missing .o for unmatched routing-tier units)
      - non-ELF or non-32-bit-LE ELF inputs
      - ELFs whose `.text` section is absent or zero-size
      - ELFs whose `.text` exists but no symtab entry covers it
        (the actual upstream-crash trigger)
      - any I/O / parse error (treated as "filter out")
    """
    try:
        with elf_path.open("rb") as f:
            buf = f.read()
    except OSError:
        return False

    if len(buf) < 0x34 or buf[:4] != ELF_MAGIC:
        return False
    if buf[4] != ELF_CLASS_32 or buf[5] != ELF_DATA_2LSB:
        return False

    # ELF32 header — relevant fields at fixed offsets:
    #   e_shoff   uint32 @ 0x20
    #   e_shentsize uint16 @ 0x2e
    #   e_shnum   uint16 @ 0x30
    #   e_shstrndx uint16 @ 0x32
    e_shoff = struct.unpack_from("<I", buf, 0x20)[0]
    e_shentsize = struct.unpack_from("<H", buf, 0x2e)[0]
    e_shnum = struct.unpack_from("<H", buf, 0x30)[0]
    e_shstrndx = struct.unpack_from("<H", buf, 0x32)[0]
    if e_shentsize != SH_ENTRY_SIZE:
        return False
    if e_shstrndx >= e_shnum:
        return False

    # Read the section name string table.
    shstrtab_sh_off = e_shoff + e_shstrndx * SH_ENTRY_SIZE
    if shstrtab_sh_off + SH_ENTRY_SIZE > len(buf):
        return False
    shstrtab_off = struct.unpack_from(
        "<I", buf, shstrtab_sh_off + SH_OFFSET_OFFSET,
    )[0]
    shstrtab_size = struct.unpack_from(
        "<I", buf, shstrtab_sh_off + SH_SIZE_OFFSET,
    )[0]
    if shstrtab_off + shstrtab_size > len(buf):
        return False
    shstrtab = buf[shstrtab_off:shstrtab_off + shstrtab_size]

    # Walk the section table once, recording:
    #   - the `.text` section's index + size
    #   - the `.symtab` section's offset / size / linked strtab index
    text_section_idx: int | None = None
    text_size = 0
    symtab_off: int | None = None
    symtab_size: int | None = None
    for i in range(e_shnum):
        sh_base = e_shoff + i * SH_ENTRY_SIZE
        if sh_base + SH_ENTRY_SIZE > len(buf):
            return False
        sh_name_idx = struct.unpack_from(
            "<I", buf, sh_base + SH_NAME_OFFSET,
        )[0]
        sh_type = struct.unpack_from(
            "<I", buf, sh_base + SH_TYPE_OFFSET,
        )[0]
        end = shstrtab.find(b"\x00", sh_name_idx)
        if end < 0:
            continue
        name = shstrtab[sh_name_idx:end]
        if name == b".text":
            text_section_idx = i
            text_size = struct.unpack_from(
                "<I", buf, sh_base + SH_SIZE_OFFSET,
            )[0]
        elif sh_type == SHT_SYMTAB:
            symtab_off = struct.unpack_from(
                "<I", buf, sh_base + SH_OFFSET_OFFSET,
            )[0]
            symtab_size = struct.unpack_from(
                "<I", buf, sh_base + SH_SIZE_OFFSET,
            )[0]
            # symtab_link points to the string table for symbol
            # names; we don't need names for the panic-filter
            # heuristic (we only inspect st_type / st_shndx /
            # st_size), so skip the field.
    if text_section_idx is None or text_size == 0:
        return False
    if symtab_off is None or symtab_size is None:
        return False

    # Walk symtab; bail as soon as we see a `.text`-pointing symbol
    # whose type is STT_FUNC with non-zero size. STT_OBJECT symbols
    # in `.text` (data blobs mwldarm relocates there — `BuildInfo`
    # is the canonical example) trigger the same upstream crash
    # even though `.text` is non-empty, so they don't qualify the
    # unit as having addressable code.
    if symtab_size % SYMBOL_ENTRY_SIZE != 0:
        return False
    for s_off in range(
        symtab_off, symtab_off + symtab_size, SYMBOL_ENTRY_SIZE,
    ):
        if s_off + SYMBOL_ENTRY_SIZE > len(buf):
            return False
        st_size = struct.unpack_from(
            "<I", buf, s_off + ST_SIZE_OFFSET,
        )[0]
        st_info = buf[s_off + ST_INFO_OFFSET]
        st_type = st_info & 0xf
        st_shndx = struct.unpack_from(
            "<H", buf, s_off + ST_SHNDX_OFFSET,
        )[0]
        if (
            st_shndx == text_section_idx
            and st_size > 0
            and st_type == STT_FUNC
        ):
            return True
    return False


# Backwards-compat alias — the original brief 187 v1 filter used a
# narrower check (just .text size > 0) which under-matched the
# real upstream crash. Keep the old name working in case
# downstream tooling imports it; both names resolve to the
# correct v2 heuristic now.
has_nonempty_text_section = has_addressable_text_code


def filter_objdiff_json(
    path: Path,
    *,
    project_root: Path | None = None,
) -> tuple[int, int, list[tuple[str, str]]]:
    """Filter `path` (objdiff.json) in place to drop units that
    would crash `objdiff-cli report generate`.

    Returns `(kept, dropped, reasons)` where `reasons` lists the
    `(unit_name, reason)` tuples for the dropped units. Useful
    for the operator log + the research note's "what got
    filtered" appendix.
    """
    project_root = project_root or path.resolve().parent
    with path.open("r", encoding="utf-8") as f:
        data = json.load(f)
    units = data.get("units", [])
    kept_units: list[dict] = []
    reasons: list[tuple[str, str]] = []
    for unit in units:
        target_path_rel = unit.get("target_path", "")
        target_path = (project_root / target_path_rel).resolve()
        if not target_path.is_file():
            reasons.append((
                unit.get("name", "?"),
                "target_path missing — unmatched routing-tier unit",
            ))
            continue
        if not has_addressable_text_code(target_path):
            reasons.append((
                unit.get("name", "?"),
                ".text exists but no symbol covers it — "
                "upstream objdiff-cli ARM crash trigger "
                "(see docs/research/objdiff-arm-crash-workaround.md)",
            ))
            continue
        kept_units.append(unit)
    data["units"] = kept_units
    with path.open("w", encoding="utf-8") as f:
        json.dump(data, f, indent=2)
        f.write("\n")
    return len(kept_units), len(reasons), reasons


def main(argv: list[str] | None = None) -> int:
    ap = argparse.ArgumentParser(
        description=(
            "Filter objdiff.json to drop units that crash "
            "`objdiff-cli report generate`. Brief 187 Part 1 "
            "workaround for the upstream objdiff-core ARM crash "
            "on code-less ELF objects + missing-file errors on "
            "unmatched routing-tier units. Idempotent."
        ),
    )
    ap.add_argument(
        "--in", dest="in_path", type=Path, required=True,
        help="Path to objdiff.json (filtered in place).",
    )
    ap.add_argument(
        "--project-root", type=Path, default=None,
        help="Project root for resolving relative target_path "
             "values. Defaults to the directory of --in.",
    )
    ap.add_argument(
        "--verbose", "-v", action="store_true",
        help="Print the full drop list (default just prints the "
             "summary line). Useful for diagnostics.",
    )
    args = ap.parse_args(argv)
    if not args.in_path.is_file():
        print(f"error: {args.in_path} not found", file=sys.stderr)
        return 1
    kept, dropped, reasons = filter_objdiff_json(
        args.in_path, project_root=args.project_root,
    )
    print(
        f"objdiff_filter: kept {kept}, dropped {dropped} units "
        f"(see brief 187 research note for the filter rationale).",
        file=sys.stderr,
    )
    if args.verbose:
        # Group by reason so the operator sees the breakdown.
        from collections import Counter
        by_reason = Counter(r for _, r in reasons)
        for reason, count in by_reason.most_common():
            print(f"  {count:4d} × {reason}", file=sys.stderr)
    return 0


if __name__ == "__main__":
    sys.exit(main())
