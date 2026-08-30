#!/usr/bin/env python3
"""READ-ONLY: what fraction of EUR code-frontier candidates can
`tools/m2c_feed.py`'s `find_object()` actually resolve, per size band?
(q-large-band-reachability)

`find_object()` locates a function's defining object by globbing ONLY
`build/<region>/delinks/_dsd_gap@*.o` (a non-recursive glob — it never
looks inside `build/<region>/delinks/src/` or `.../libs/`, where the
project's ~13,000 per-source delink objects live) and raises when the
function isn't found in one of those. The hypothesis under test: if large
functions disproportionately live in per-source objects rather than gap
objects, the tool is structurally blind to them and the campaign's low
large-band attempt count is a tooling artefact, not a judgement call.

This tool answers that WITHOUT running the compiler: it inspects
ALREADY-BUILT `.o` files with `objdump -d`/`-t` (the same read-only
disassembly `find_object()` itself does per-candidate, just batched
across many files per invocation for speed — batching is a ~30x speedup
with no change in what's detected, verified against the real
`find_object()` directly on 8 sampled candidates, 8/8 exact match) and
cross-references against a predictable per-source object path
(`build/<region>/delinks/src/<module_dir>/<stem><routing_suffix>.o`,
mirroring the project's own `src/` tree layout) to determine whether a
"not found in a gap object" candidate is genuinely unresolvable anywhere,
or just sitting at a different, predictable, un-checked path.

Requires `build/<region>/delinks/` to already exist (a `ninja delink` /
`configure.py` artifact) -- this tool never invokes either; it only reads
whatever objects are already on disk from an earlier run.

Usage:
    python tools/m2c_gap_coverage.py --region eur
    python tools/m2c_gap_coverage.py --region eur --json
"""
from __future__ import annotations

import argparse
import json
import re
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(Path(__file__).resolve().parent))

from routing_suffixes import split_routing_suffix  # noqa: E402
from wall_aware_headroom import scan  # noqa: E402

OBJDUMP = str(ROOT / "tools" / "arm-none-eabi" / "bin" / "arm-none-eabi-objdump.exe")

BANDS: tuple[tuple[str, int | None, int | None], ...] = (
    ("<=192 B", None, 192),
    ("193-256 B", 193, 256),
    ("257-320 B", 257, 320),
    ("321-376 B", 321, 376),
    ("377-512 B", 377, 512),
    ("513-1023 B", 513, 1023),
    (">=1024 B", 1024, None),
)
DISPATCH_MIN_BL_BLX = 4

FILE_HDR_RE = re.compile(r"^(.+):\s+file format elf32-littlearm$", re.MULTILINE)
FUNC_HDR_RE = re.compile(r"^[0-9a-f]+ <([^>]+)>:$", re.MULTILINE)


# --------------------------------------------------------------------------- #
# PURE helpers
# --------------------------------------------------------------------------- #

def parse_func_headers(objdump_text: str) -> set[str]:
    """Every function name whose disassembly header (`^[0-9a-f]+
    <name>:$`, exactly what `find_object()` searches for) appears in
    `objdump_text` -- excludes `.L_`-prefixed internal branch-target
    labels, which objdump renders identically but are never a
    candidate's own symbol name (real symbols never start with a literal
    dot)."""
    return {
        m.group(1) for m in FUNC_HDR_RE.finditer(objdump_text)
        if not m.group(1).startswith(".L_")
    }


def module_to_src_dir(module: str) -> str:
    """main -> main, ov005 -> overlay005 -- the SAME convention
    port_to_region.py's own module_to_src_dir() uses; duplicated here as
    a tiny pure function rather than importing a porting tool into a
    read-only census."""
    if module == "main":
        return "main"
    if module.startswith("ov") and module[2:].isdigit():
        return "overlay" + module[2:].zfill(3)
    return module


def predictable_persource_object(region: str, module: str, src_path: str) -> Path:
    """The per-source object path dsd's build already places a
    candidate's `.o` at, mirroring `src/`'s own layout -- e.g.
    `src/main/func_02012345.s` -> `build/eur/delinks/src/main/
    func_02012345.o`. `find_object()` never checks this path."""
    stem, suffix = split_routing_suffix(Path(src_path).stem)
    mod_dir = module_to_src_dir(module)
    return ROOT / "build" / region / "delinks" / "src" / mod_dir / f"{stem}{suffix}.o"


def band_for(size: int) -> str | None:
    for label, lo, hi in BANDS:
        if (lo is None or size >= lo) and (hi is None or size <= hi):
            return label
    return None


def coverage_by_band(rows: list[dict]) -> list[dict]:
    """`rows`: dicts with size/bl_blx/name/in_gap/has_persource_obj.
    Aggregates dispatch-ready (`>=4` bl/blx), named candidates into the 7
    bands, reporting count- and byte-weighted gap-object coverage."""
    out = []
    for label, _lo, _hi in BANDS:
        band_rows = [
            r for r in rows
            if r["bl_blx"] >= DISPATCH_MIN_BL_BLX and r.get("name") is not None
            and band_for(r["size"]) == label
        ]
        total_n, total_b = len(band_rows), sum(r["size"] for r in band_rows)
        in_gap = [r for r in band_rows if r["in_gap"]]
        in_gap_n, in_gap_b = len(in_gap), sum(r["size"] for r in in_gap)
        not_in_gap = [r for r in band_rows if not r["in_gap"]]
        persource = [r for r in not_in_gap if r.get("has_persource_obj")]
        out.append({
            "band": label, "dispatch_candidates": total_n, "dispatch_bytes": total_b,
            "in_gap_candidates": in_gap_n, "in_gap_bytes": in_gap_b,
            "coverage_pct_by_count": (100 * in_gap_n / total_n) if total_n else None,
            "coverage_pct_by_bytes": (100 * in_gap_b / total_b) if total_b else None,
            "not_in_gap_candidates": len(not_in_gap),
            "not_in_gap_with_persource_object": len(persource),
        })
    return out


# --------------------------------------------------------------------------- #
# Driver (impure -- disk + objdump)
# --------------------------------------------------------------------------- #

def _batched(items, n):
    for i in range(0, len(items), n):
        yield items[i:i + n]


def gap_object_paths(region: str) -> list[Path]:
    delinks = ROOT / "build" / region / "delinks"
    return sorted(delinks.glob("_dsd_gap@*.o"))


def scan_gap_functions(region: str, batch_size: int = 150) -> set[str]:
    names: set[str] = set()
    for chunk in _batched(gap_object_paths(region), batch_size):
        args = [OBJDUMP, "-d", "--architecture=armv5te"] + [str(p) for p in chunk]
        r = subprocess.run(args, capture_output=True, text=True)
        names |= parse_func_headers(r.stdout)
    return names


def build_state(region: str, gap_funcs: set[str] | None = None) -> dict:
    """The build-tree facts a coverage run depends on -- `q-find-object-
    persource` (brain round 0901): coverage is a property of WHICH
    `build/<region>/delinks/` tree it is run against, not of the
    project. A tree whose gap objects are mostly-empty stubs (e.g. 754
    objects holding only 55 distinct functions, seen on one integration
    tree) reports ~0% coverage everywhere with the identical code that
    reports 45-68% against a fully-populated tree (2,083 objects /
    2,881 functions). Reporting these two counts turns that silent
    dependency into a visible one."""
    gap_objs = gap_object_paths(region)
    if gap_funcs is None:
        gap_funcs = scan_gap_functions(region)
    return {
        "region": region,
        "gap_object_count": len(gap_objs),
        "gap_distinct_function_count": len(gap_funcs),
    }


def symbol_name_index(region: str) -> dict[tuple[str, str], str]:
    from analyze_symbols import parse_symbols_file
    out: dict[tuple[str, str], str] = {}
    arm9 = ROOT / "config" / region / "arm9"
    modules = [("main", arm9 / "symbols.txt")]
    overlays_dir = arm9 / "overlays"
    if overlays_dir.is_dir():
        for d in sorted(overlays_dir.iterdir()):
            if (d / "symbols.txt").is_file():
                modules.append((d.name, d / "symbols.txt"))
    for mod, path in modules:
        for sym in parse_symbols_file(path, mod):
            if sym.is_function:
                out[(mod, f"0x{sym.addr:08x}")] = sym.name
    return out


def build_rows(region: str) -> tuple[list[dict], set[str]]:
    """Returns `(rows, gap_funcs)` -- callers needing the build state
    behind the coverage numbers (`build_state()`) reuse `gap_funcs`
    rather than re-scanning every gap object a second time."""
    delinks = ROOT / "build" / region / "delinks"
    if not delinks.is_dir():
        raise SystemExit(
            f"{delinks} missing -- this tool reads already-built delink "
            f"objects; run `python tools/configure.py {region}` and a "
            f"build/delink first (this tool itself never builds)."
        )
    gap_funcs = scan_gap_functions(region)
    sym_idx = symbol_name_index(region)

    per = scan(None, None, True, None, None, min_bl_blx=0)
    files = [
        f for d in per.values()
        for key in ("coercible_files", "unknown_files", "no_marker_files")
        for f in d[key]
    ]

    rows = []
    for f in files:
        size = int(f.get("text_size") or 0)
        addr, path = f.get("addr"), f.get("path", "")
        parts = Path(path).parts
        if len(parts) >= 2 and parts[1] == "main":
            mod = "main"
        elif len(parts) >= 2 and parts[1].startswith("overlay"):
            mod = "ov" + parts[1][len("overlay"):].zfill(3)
        else:
            mod = None
        name = sym_idx.get((mod, addr)) if mod and addr else None
        in_gap = (name in gap_funcs) if name else None
        row = {
            "path": path, "module": mod, "addr": addr, "size": size,
            "bl_blx": int(f.get("bl_blx") or 0), "name": name, "in_gap": in_gap,
        }
        if name is not None and not in_gap:
            obj = predictable_persource_object(region, mod, path)
            row["has_persource_obj"] = obj.is_file()
        rows.append(row)
    return rows, gap_funcs


def main(argv: list[str] | None = None) -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--region", default="eur", choices=["eur", "usa", "jpn"])
    ap.add_argument("--json", action="store_true")
    args = ap.parse_args(argv)

    rows, gap_funcs = build_rows(args.region)
    summary = coverage_by_band(rows)
    state = build_state(args.region, gap_funcs=gap_funcs)

    if args.json:
        print(json.dumps({"build_state": state, "rows": rows, "summary": summary}, indent=1))
        return 0

    print(f"build state: {state['gap_object_count']} gap objects / "
          f"{state['gap_distinct_function_count']} distinct functions "
          f"in build/{args.region}/delinks -- coverage below is a property "
          f"of THIS tree, not the project (see q-find-object-persource).")
    print(f"{'band':<12} {'dispatch N':>10} {'in-gap N':>9} {'cov N':>7} "
          f"{'dispatch B':>11} {'in-gap B':>10} {'cov B':>7} {'persource N':>11}")
    for row in summary:
        cov_n = f"{row['coverage_pct_by_count']:.1f}%" if row['coverage_pct_by_count'] is not None else "n/a"
        cov_b = f"{row['coverage_pct_by_bytes']:.1f}%" if row['coverage_pct_by_bytes'] is not None else "n/a"
        print(f"{row['band']:<12} {row['dispatch_candidates']:>10} "
              f"{row['in_gap_candidates']:>9} {cov_n:>7} "
              f"{row['dispatch_bytes']:>11} {row['in_gap_bytes']:>10} {cov_b:>7} "
              f"{row['not_in_gap_with_persource_object']:>11}/{row['not_in_gap_candidates']}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
