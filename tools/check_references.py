#!/usr/bin/env python3
"""
check_references.py — a match must reference the right things.

The ROM's SHA-1 proves the final bytes; it does not prove a function
references the right symbols. The linker resolves a relocation to an address,
so two different sources can link to the same bytes:

  * the original loads a symbol's address (dsd records `R_ARM_ABS32` against
    `data_027e0000`), but the C writes the raw number `0x027e0000`;
  * the original calls or loads one symbol and the C names another at the
    same address (an alias), or the same symbol at a different offset.

This check compares relocation tables. For every unit in a region's
`delinks.txt` whose source was built, it reads the original object dsd
delinked (`build/<ver>/delinks/<source>.o`) and the object the compiler or
assembler produced from the source (`build/<ver>/<source>.o`), and compares
each allocated section's relocations at each offset:

  missing-reloc     the original has a relocation, the build has none (a raw
                    number stands where the original referenced a symbol)
  extra-reloc       the build has a relocation the original does not
  wrong-target      both relocate the offset, to a different symbol, offset
                    or relocation type

A relocation's target is the symbol's name when it is undefined in the unit
(an external reference) and `<section>+<offset>` when it is defined in the
unit, so a local label and a section symbol that land on the same place
compare equal. Debug sections are ignored.

Existing differences are listed in `tools/reference_baseline.txt`, one
`region<TAB>unit<TAB>kind<TAB>count` line each. The check fails when a count
exceeds its baseline or a baseline entry is stale, exactly like
`check_fake_matches.py`. It needs a built tree: run it after `ninja` (the gate
builds every region) for each region you built.

Usage:
    python tools/check_references.py --version eur [--version usa ...]
    python tools/check_references.py --version eur --list
    python tools/check_references.py --version eur --write-baseline

Exit codes: 0 clean against the baseline, 1 new or stale differences,
2 missing inputs (no build for the region, or a delinked object missing).
"""
from __future__ import annotations

import argparse
import struct
import sys
from collections import Counter
from dataclasses import dataclass
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from progress import parse_delinks_file  # noqa: E402

ROOT = Path(__file__).resolve().parent.parent
BASELINE = Path("tools") / "reference_baseline.txt"
REGIONS = ("eur", "usa", "jpn")
KINDS = ("missing-reloc", "extra-reloc", "wrong-target")
SOURCE_SUFFIXES = (".c", ".cpp", ".s")

SHT_SYMTAB, SHT_RELA, SHT_REL = 2, 4, 9
SHF_ALLOC = 0x2
SHN_UNDEF, SHN_ABS = 0, 0xFFF1
R_ARM_ABS32 = 2
RELOC_NAMES = {1: "PC24", 2: "ABS32", 10: "THM_CALL", 28: "CALL", 29: "JUMP24", 30: "THM_JUMP24"}


class ElfError(ValueError):
    pass


@dataclass(frozen=True)
class Reloc:
    type: int
    target: str
    addend: int

    def describe(self) -> str:
        sign = "+" if self.addend >= 0 else "-"
        kind = RELOC_NAMES.get(self.type, str(self.type))
        return f"{kind} {self.target}{sign}0x{abs(self.addend):x}"


@dataclass(frozen=True)
class Difference:
    region: str
    unit: str
    kind: str
    section: str
    offset: int
    function: str
    original: Reloc | None
    built: Reloc | None

    def describe(self) -> str:
        where = f"{self.section}+0x{self.offset:x}" + (f" in {self.function}" if self.function else "")
        orig = self.original.describe() if self.original else "no relocation"
        built = self.built.describe() if self.built else "no relocation"
        return f"[{self.region}] {self.unit}: {self.kind} at {where}: original {orig}, built {built}"


@dataclass
class ObjectRelocs:
    relocs: dict[str, dict[int, Reloc]]         # section name -> offset -> reloc
    functions: dict[str, list[tuple[int, int, str]]]  # section name -> (start, end, name)


def read_object(path: Path) -> ObjectRelocs:
    """Parse the allocated-section relocations of a 32-bit little-endian ELF."""
    buf = path.read_bytes()
    if buf[:4] != b"\x7fELF" or buf[4] != 1 or buf[5] != 1:
        raise ElfError(f"{path}: not a 32-bit little-endian ELF")
    e_shoff, = struct.unpack_from("<I", buf, 0x20)
    e_shentsize, e_shnum, e_shstrndx = struct.unpack_from("<HHH", buf, 0x2E)
    sections = []
    for i in range(e_shnum):
        sections.append(struct.unpack_from("<IIIIIIIIII", buf, e_shoff + i * e_shentsize))

    def strtab(index: int) -> bytes:
        s = sections[index]
        return buf[s[4]:s[4] + s[5]]

    def cstr(table: bytes, offset: int) -> str:
        end = table.find(b"\0", offset)
        return table[offset:end if end >= 0 else None].decode("utf-8", "replace")

    shstr = strtab(e_shstrndx)
    names = [cstr(shstr, s[0]) for s in sections]

    symbols: list[tuple[str, int, int, int, int]] = []  # name, value, size, info, shndx
    for s in sections:
        if s[1] == SHT_SYMTAB:
            table = strtab(s[6])
            for off in range(s[4], s[4] + s[5], 16):
                st_name, st_value, st_size, st_info, _other, st_shndx = struct.unpack_from(
                    "<IIIBBH", buf, off)
                symbols.append((cstr(table, st_name), st_value, st_size, st_info, st_shndx))
            break

    functions: dict[str, list[tuple[int, int, str]]] = {}
    for name, value, size, info, shndx in symbols:
        if info & 0xF == 2 and 0 < shndx < len(sections) and size:  # STT_FUNC
            functions.setdefault(names[shndx], []).append((value, value + size, name))

    relocs: dict[str, dict[int, Reloc]] = {}
    for s in sections:
        if s[1] not in (SHT_REL, SHT_RELA):
            continue
        target_index = s[7]
        if not (0 < target_index < len(sections)) or not sections[target_index][2] & SHF_ALLOC:
            continue  # debug and other non-loaded sections
        target_name = names[target_index]
        target_sec = sections[target_index]
        entsize = 12 if s[1] == SHT_RELA else 8
        table = relocs.setdefault(target_name, {})
        for off in range(s[4], s[4] + s[5], entsize):
            if s[1] == SHT_RELA:
                r_offset, r_info, r_addend = struct.unpack_from("<IIi", buf, off)
            else:
                r_offset, r_info = struct.unpack_from("<II", buf, off)
                r_addend = 0
                if r_info & 0xFF == R_ARM_ABS32:
                    r_addend, = struct.unpack_from("<i", buf, target_sec[4] + r_offset)
            sym_index, r_type = r_info >> 8, r_info & 0xFF
            name, value, _size, info, shndx = symbols[sym_index]
            if shndx == SHN_UNDEF:
                target, addend = name, r_addend
            elif shndx == SHN_ABS:
                target, addend = "*ABS*", value + r_addend
            else:
                # Defined in this unit: compare on the place it names, since a
                # local label, a section symbol and a named symbol may all
                # denote it.
                target, addend = names[shndx], value + r_addend
            table[r_offset] = Reloc(r_type, target, addend)
    return ObjectRelocs(relocs, functions)


def _function_at(obj: ObjectRelocs, section: str, offset: int) -> str:
    for start, end, name in obj.functions.get(section, ()):
        if start <= offset < end:
            return name
    return ""


def compare_objects(region: str, unit: str, original: ObjectRelocs,
                    built: ObjectRelocs) -> list[Difference]:
    diffs: list[Difference] = []
    for section in sorted(set(original.relocs) | set(built.relocs)):
        orig = original.relocs.get(section, {})
        new = built.relocs.get(section, {})
        for offset in sorted(set(orig) | set(new)):
            a, b = orig.get(offset), new.get(offset)
            if a == b:
                continue
            kind = "missing-reloc" if b is None else "extra-reloc" if a is None else "wrong-target"
            diffs.append(Difference(region, unit, kind, section, offset,
                                    _function_at(original, section, offset), a, b))
    return diffs


def built_units(root: Path, region: str) -> list[str]:
    units: list[str] = []
    for delinks in sorted((root / "config" / region).rglob("delinks.txt")):
        _module, tus = parse_delinks_file(delinks)
        units += [tu["source"] for tu in tus if tu["source"].endswith(SOURCE_SUFFIXES)]
    return sorted(set(units))


def check_region(root: Path, region: str) -> tuple[list[Difference], list[str]]:
    """Return the differences and the input problems for one built region."""
    build = root / "build" / region
    diffs: list[Difference] = []
    problems: list[str] = []
    for unit in built_units(root, region):
        rel = Path(unit).with_suffix(".o")
        original_path, built_path = build / "delinks" / rel, build / rel
        if not original_path.is_file() or not built_path.is_file():
            missing = [str(p.relative_to(root)) for p in (original_path, built_path) if not p.is_file()]
            problems.append(f"[{region}] {unit}: missing {', '.join(missing)}")
            continue
        try:
            diffs += compare_objects(region, unit, read_object(original_path), read_object(built_path))
        except (ElfError, struct.error, IndexError) as exc:
            problems.append(f"[{region}] {unit}: unreadable object ({exc})")
    return diffs, problems


def load_baseline(path: Path, regions: tuple[str, ...]) -> Counter:
    counts: Counter = Counter()
    if path.is_file():
        for raw in path.read_text(encoding="utf-8").splitlines():
            line = raw.strip()
            if line and not line.startswith("#"):
                region, unit, kind, count = line.split("\t")
                if region in regions:
                    counts[(region, unit, kind)] = int(count)
    return counts


def write_baseline(path: Path, counts: Counter, regions: tuple[str, ...]) -> None:
    """Rewrite the entries for `regions`, keeping the other regions' entries."""
    kept = Counter({k: v for k, v in load_baseline(path, REGIONS).items() if k[0] not in regions})
    kept.update(counts)
    path.parent.mkdir(parents=True, exist_ok=True)
    lines = [
        "# Reference-check baseline: relocation differences on main that CI tolerates.",
        "# Written only by `tools/check_references.py --write-baseline`.",
        "# region<TAB>unit<TAB>kind<TAB>count. It may shrink; growth is a review finding.",
    ]
    lines += [f"{r}\t{u}\t{k}\t{n}" for (r, u, k), n in sorted(kept.items())]
    path.write_text("\n".join(lines) + "\n", encoding="utf-8")


def main(argv: list[str] | None = None) -> int:
    ap = argparse.ArgumentParser(description=__doc__.split("\n\n")[0])
    ap.add_argument("--version", action="append", choices=REGIONS, required=True,
                    help="region to check (repeatable); it must be built")
    ap.add_argument("--root", type=Path, default=ROOT)
    ap.add_argument("--baseline", type=Path)
    ap.add_argument("--list", action="store_true", help="print every difference")
    ap.add_argument("--write-baseline", action="store_true")
    args = ap.parse_args(argv)

    root = args.root.resolve()
    regions = tuple(dict.fromkeys(args.version))
    baseline_path = args.baseline or root / BASELINE
    diffs: list[Difference] = []
    problems: list[str] = []
    for region in regions:
        if not (root / "build" / region / "delinks").is_dir():
            problems.append(f"[{region}] no build/{region}/delinks: build the region first")
            continue
        region_diffs, region_problems = check_region(root, region)
        diffs += region_diffs
        problems += region_problems

    if args.list:
        for d in diffs:
            print(d.describe())
    for p in problems:
        print(f"  INPUT: {p}")
    if problems:
        print("check_references: INPUT ERROR - no verdict")
        return 2

    found = Counter((d.region, d.unit, d.kind) for d in diffs)
    if args.write_baseline:
        write_baseline(baseline_path, found, regions)
        print(f"check_references: wrote {len(found)} baseline entries for {', '.join(regions)}")
        return 0
    baseline = load_baseline(baseline_path, regions)
    grown = [key for key, n in sorted(found.items()) if n > baseline.get(key, 0)]
    stale = [f"{r} {u} {k}: baseline {n}, found {found.get((r, u, k), 0)}"
             for (r, u, k), n in sorted(baseline.items()) if found.get((r, u, k), 0) < n]
    per_kind = Counter(d.kind for d in diffs)
    units = {(r, u) for r in regions for u in built_units(root, r)}
    print(f"check_references: {', '.join(regions)}: {len(units)} units compared; "
          + ", ".join(f"{k} {per_kind.get(k, 0)}" for k in KINDS)
          + f" (baseline entries {len(baseline)})")
    for key in grown:
        r, u, k = key
        print(f"  NEW: {r} {u} {k}: {found[key]} found, baseline {baseline.get(key, 0)}")
        for d in diffs:
            if (d.region, d.unit, d.kind) == key:
                print(f"    {d.describe()}")
    for line in stale:
        print(f"  STALE: {line} - shrink the baseline with --write-baseline")
    if grown or stale:
        print("check_references: FAIL")
        return 1
    print("check_references: OK")
    return 0


if __name__ == "__main__":
    sys.exit(main())
