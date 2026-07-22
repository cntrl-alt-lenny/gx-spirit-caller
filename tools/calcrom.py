#!/usr/bin/env python3

"""
Per-overlay code/data/pointer breakdown for Yu-Gi-Oh! GX Spirit Caller.

Ported from pret/pokeplatinum's `.github/calcrom/calcrom.py` (MIT-ish
"unlicense", per pokeplatinum's LICENSE — no header carried upstream),
re-targeted at this project's directory layout:

  - report.json lives at build/<region>/report.json (objdiff v2.7.1)
  - per-module reloc inventory lives at config/<region>/.../relocs.txt
  - per-module TU map lives at config/<region>/.../delinks.txt

Two deliberate deviations from upstream:

  1. No Discord webhook. Local stdout only.
  2. No pyelftools dependency. The upstream tool parses every built .o
     for SHT_REL / SHT_RELA sections (counts ELF relocations directly)
     and scans symbol payloads for pointer-shaped words. Our adapter
     reaches the same "properly-linked vs hard-coded pointers" split
     a different way: dsd already emits an authoritative relocation
     inventory per module in `relocs.txt`, with byte-precise `from:`
     addresses. We classify each relocation by which TU its `from:`
     address falls into — a reloc inside a `complete`-marked TU is
     "properly-linked", a reloc inside a gap or incomplete TU is
     "hard-coded" (i.e., it should be a relocatable pointer once the
     surrounding bytes are decompiled, but right now lives in a raw
     blob). This adaptation is what gives us a direct read on the
     reloc-record divergence behind the matched_functions vs
     complete_units gap (see memory/reference_metric_canon.md).

Usage:
    python3.13 tools/calcrom.py eur

Read-only. Requires `ninja report` to have been run first
(build/<region>/report.json must exist) — fails loud otherwise.
"""

from __future__ import annotations

import argparse
import json
import re
import sys
from collections import defaultdict
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent

try:  # package import when invoked from the repository root
    from tools.parsers import parse_delinks_file
except ImportError:  # direct ``python tools/calcrom.py`` invocation
    from parsers import parse_delinks_file

CODE_SECTIONS = {".text", ".init", ".itcm"}
DATA_SECTIONS = {".rodata", ".ctor", ".dtor", ".data"}

# Pretty bucket key → display name. Buckets:
#   main                   — ARM9 main (src/main + libs/*)
#   itcm / dtcm            — autoloads
#   ov000 … ov023          — overlays
BUCKET_MAIN = "main"
BUCKET_ITCM = "itcm"
BUCKET_DTCM = "dtcm"


# --------------------------------------------------------------------------- #
# delinks.txt + relocs.txt parsing (pure stdlib)
# --------------------------------------------------------------------------- #

_RELOC_RE = re.compile(
    r"from:0x([0-9a-fA-F]+)\s+kind:(\S+)\s+to:0x([0-9a-fA-F]+)"
)


def parse_relocs(path: Path) -> list[tuple[int, str, int]]:
    """Parse a dsd relocs.txt file.

    Returns a list of (from_addr, kind, to_addr) tuples. Comments and
    blank lines are skipped. Unrecognised lines are silently dropped.
    """
    out: list[tuple[int, str, int]] = []
    if not path.is_file():
        return out
    with path.open() as f:
        for line in f:
            s = line.strip()
            if not s or s.startswith("#"):
                continue
            m = _RELOC_RE.match(s)
            if m:
                out.append((int(m.group(1), 16), m.group(2), int(m.group(3), 16)))
    return out


def parse_delinks(path: Path):
    """Return the legacy calcrom view from the canonical parser.

    ``calcrom`` historically called TU ranges ``ranges`` while the shared
    parser calls them ``sections``. Keep that small compatibility adapter so
    its callers and output remain unchanged.
    """
    module_sections, parsed_tus = parse_delinks_file(path)
    tus = [
        {
            "source": tu["source"],
            "status": tu.get("status"),
            "ranges": tu.get("sections", []),
        }
        for tu in parsed_tus
    ]
    return module_sections, tus


# --------------------------------------------------------------------------- #
# Pointer classification
# --------------------------------------------------------------------------- #

def _build_tu_lookup(tus: list[dict]) -> list[tuple[int, int, dict]]:
    """Flatten TUs into a sorted (start, end, tu) list for fast lookup."""
    flat: list[tuple[int, int, dict]] = []
    for tu in tus:
        for _name, start, end in tu["ranges"]:
            if end > start:
                flat.append((start, end, tu))
    flat.sort(key=lambda t: t[0])
    return flat


def _find_tu(addr: int, flat: list[tuple[int, int, dict]]) -> dict | None:
    """Binary search for the TU containing addr. None if not found."""
    lo, hi = 0, len(flat)
    while lo < hi:
        mid = (lo + hi) // 2
        start, end, _tu = flat[mid]
        if addr < start:
            hi = mid
        elif addr >= end:
            lo = mid + 1
        else:
            return flat[mid][2]
    return None


def classify_pointers(
    relocs: list[tuple[int, str, int]],
    tus: list[dict],
) -> tuple[int, int]:
    """Split relocs into (properly_linked, hard_coded) counts.

    Properly-linked: `from:` address is inside a TU marked `complete`
      — the bytes around this pointer have been decompiled and the
      reloc is emitted naturally by the compiler.

    Hard-coded: `from:` address is in a gap (no TU covers it) or in a
      TU that's not yet `complete` — the pointer currently lives in a
      raw delink blob; once decompiled, it becomes properly-linked.
    """
    flat = _build_tu_lookup(tus)
    linked = 0
    hardcoded = 0
    for from_addr, _kind, _to in relocs:
        tu = _find_tu(from_addr, flat)
        if tu is not None and tu.get("status") == "complete":
            linked += 1
        else:
            hardcoded += 1
    return linked, hardcoded


# --------------------------------------------------------------------------- #
# Report.json bucketing
# --------------------------------------------------------------------------- #

_GAP_RE = re.compile(r"_dsd_gap@(\w+?)(?:_\d+)?$")


def bucket_of(unit_name: str) -> str | None:
    """Map an objdiff unit name to a module bucket key.

    Returns BUCKET_MAIN, BUCKET_ITCM, BUCKET_DTCM, or "ovNNN", or None
    if the unit can't be classified (shouldn't happen for our project).
    """
    if unit_name.startswith("libs/"):
        return BUCKET_MAIN
    if unit_name.startswith("src/main"):
        return BUCKET_MAIN
    if unit_name.startswith("src/overlay"):
        rest = unit_name[len("src/"):]
        ov = rest.split("/", 1)[0]  # overlayNNN
        if ov.startswith("overlay") and ov[len("overlay"):].isdigit():
            return f"ov{int(ov[len('overlay'):]):03d}"
        return None
    if unit_name.startswith("_dsd_gap@"):
        # `_dsd_gap@main_200`, `_dsd_gap@ov002_5`, `_dsd_gap@itcm_0`
        token = unit_name[len("_dsd_gap@"):].rsplit("_", 1)[0]
        if token == "main":
            return BUCKET_MAIN
        if token == "itcm":
            return BUCKET_ITCM
        if token == "dtcm":
            return BUCKET_DTCM
        if token.startswith("ov") and token[2:].isdigit():
            return f"ov{int(token[2:]):03d}"
        return None
    return None


def _as_int(v) -> int:
    """Coerce objdiff's stringy byte counts to int."""
    if v is None:
        return 0
    if isinstance(v, str):
        try:
            return int(v)
        except ValueError:
            return 0
    return int(v)


def bucket_units(units: list[dict]) -> dict[str, dict]:
    """Aggregate objdiff units into per-bucket totals."""
    buckets: dict[str, dict] = defaultdict(lambda: {
        "code_total": 0, "code_matched": 0, "code_complete": 0,
        "data_total": 0,
        "fn_total": 0, "fn_matched": 0,
        "units_total": 0, "units_complete": 0,
    })
    for u in units:
        b = bucket_of(u.get("name", ""))
        if b is None:
            continue
        m = u.get("measures", {})
        d = buckets[b]
        d["code_total"]     += _as_int(m.get("total_code"))
        d["code_matched"]   += _as_int(m.get("matched_code"))
        d["code_complete"]  += _as_int(m.get("complete_code"))
        d["data_total"]     += _as_int(m.get("total_data"))
        d["fn_total"]       += _as_int(m.get("total_functions"))
        d["fn_matched"]     += _as_int(m.get("matched_functions"))
        d["units_total"]    += _as_int(m.get("total_units"))
        d["units_complete"] += _as_int(m.get("complete_units"))
    return dict(buckets)


# --------------------------------------------------------------------------- #
# Discover module → bucket → relocs/delinks paths
# --------------------------------------------------------------------------- #

def discover_module_paths(config_dir: Path) -> dict[str, tuple[Path, Path]]:
    """Walk config/<region>/arm9/ and return {bucket_key: (delinks, relocs)}.

    Buckets follow the same naming as bucket_of() so they line up with
    report.json aggregation.
    """
    out: dict[str, tuple[Path, Path]] = {}
    arm9 = config_dir / "arm9"
    if not arm9.is_dir():
        return out

    # main module: arm9/delinks.txt + arm9/relocs.txt
    d, r = arm9 / "delinks.txt", arm9 / "relocs.txt"
    if d.is_file() and r.is_file():
        out[BUCKET_MAIN] = (d, r)

    # autoloads: arm9/itcm/, arm9/dtcm/
    for name, key in (("itcm", BUCKET_ITCM), ("dtcm", BUCKET_DTCM)):
        sub = arm9 / name
        d, r = sub / "delinks.txt", sub / "relocs.txt"
        if d.is_file() and r.is_file():
            out[key] = (d, r)

    # overlays: arm9/overlays/ovNNN/
    ov_root = arm9 / "overlays"
    if ov_root.is_dir():
        for sub in sorted(ov_root.iterdir()):
            if not sub.is_dir() or not sub.name.startswith("ov"):
                continue
            d, r = sub / "delinks.txt", sub / "relocs.txt"
            if d.is_file() and r.is_file():
                out[sub.name] = (d, r)

    return out


# --------------------------------------------------------------------------- #
# Output
# --------------------------------------------------------------------------- #

def pct(num: int, den: int) -> float:
    return (num * 100.0 / den) if den else 0.0


def print_table(rows: list[dict]) -> None:
    """Render the per-overlay table to stdout."""
    headers = [
        ("module",   "<14"),
        ("code-bytes",  ">11"),
        ("matched",     ">10"),
        ("matched%",    ">8"),
        ("data-bytes",  ">10"),
        ("fn m/T",      ">11"),
        ("unit c/T",    ">11"),
        ("link-ptr",    ">8"),
        ("hard-ptr",    ">8"),
        ("link%",       ">6"),
    ]
    header_line = " ".join(f"{h:{fmt}}" for h, fmt in headers)
    print(header_line)
    print("-" * len(header_line))
    for r in rows:
        ptr_total = r["ptr_linked"] + r["ptr_hardcoded"]
        link_pct = pct(r["ptr_linked"], ptr_total)
        cells = [
            (r["bucket"],                             "<14"),
            (f'{r["code_total"]}',                    ">11"),
            (f'{r["code_matched"]}',                  ">10"),
            (f'{pct(r["code_matched"], r["code_total"]):.2f}', ">8"),
            (f'{r["data_total"]}',                    ">10"),
            (f'{r["fn_matched"]}/{r["fn_total"]}',    ">11"),
            (f'{r["units_complete"]}/{r["units_total"]}', ">11"),
            (f'{r["ptr_linked"]}',                    ">8"),
            (f'{r["ptr_hardcoded"]}',                 ">8"),
            (f'{link_pct:.1f}',                       ">6"),
        ]
        print(" ".join(f"{val:{fmt}}" for val, fmt in cells))


def print_summary(region: str, report_measures: dict, totals: dict) -> None:
    """Emit the docs/state.md "Current metrics" block format."""
    m = report_measures
    mc = _as_int(m.get("matched_code"))
    tc = _as_int(m.get("total_code"))
    mf = _as_int(m.get("matched_functions"))
    tf = _as_int(m.get("total_functions"))
    cu = _as_int(m.get("complete_units"))
    tu = _as_int(m.get("total_units"))
    cc = _as_int(m.get("complete_code"))
    fm = m.get("fuzzy_match_percent", 0.0)
    mcp = (mc * 100.0 / tc) if tc else 0.0
    ccp = (cc * 100.0 / tc) if tc else 0.0

    print()
    print(f"Current metrics ({region.upper()}):")
    print(f"  matched_functions    {mf} / {tf}  ({pct(mf, tf):.2f}%)")
    print(f"  matched_code_percent {mcp:.4f}%")
    print(f"  fuzzy_match_percent  {fm:.4f}%")
    print(f"  complete_units       {cu} / {tu}  ({pct(cu, tu):.2f}%)")
    print(f"  complete_code        {cc} / {tc}  ({ccp:.4f}%)")
    print()
    print("  Note: matched_functions > complete_units is NATURAL — mf counts")
    print("  per function while cu counts per TU. Multi-fn-per-TU shipping")
    print("  contributes N to mf and 1 to cu. The delta is NOT a 'missing")
    print("  complete marker' indicator (see brief 239 (D) for the empirical")
    print("  audit: 0 incomplete entries across all 9 overlays where mf > cu).")
    print()
    ptr_total = totals["ptr_linked"] + totals["ptr_hardcoded"]
    print("Pointer inventory (from config/<region>/**/relocs.txt + delinks.txt):")
    print(f"  total relocations     {ptr_total}")
    print(f"  properly-linked       {totals['ptr_linked']:>7}  ({pct(totals['ptr_linked'], ptr_total):.2f}%)")
    print(f"  hard-coded            {totals['ptr_hardcoded']:>7}  ({pct(totals['ptr_hardcoded'], ptr_total):.2f}%)")
    print()
    print("  Properly-linked pointers live inside complete TUs (the")
    print("  surrounding bytes are decompiled). Hard-coded pointers live")
    print("  inside gaps or incomplete TUs — they should be properly-")
    print("  linked once those bytes get carved into matching source.")


# --------------------------------------------------------------------------- #
# Main
# --------------------------------------------------------------------------- #

def main() -> int:
    ap = argparse.ArgumentParser(
        description="Per-overlay code/data/pointer breakdown",
    )
    ap.add_argument(
        "region",
        nargs="?",
        default="usa",
        help='Game version (default: "usa"; one of usa / eur / jpn)',
    )
    ap.add_argument(
        "--json",
        action="store_true",
        help="Emit machine-readable JSON instead of the table",
    )
    args = ap.parse_args()
    region = args.region

    report_path = ROOT / "build" / region / "report.json"
    config_dir = ROOT / "config" / region

    if not report_path.is_file():
        print(
            f"calcrom: build/{region}/report.json not found — "
            "run `ninja report` first.",
            file=sys.stderr,
        )
        return 2

    with report_path.open() as f:
        report = json.load(f)
    units = report.get("units", [])
    measures = report.get("measures", {})

    # Aggregate objdiff measures per bucket.
    bucket_data = bucket_units(units)

    # Classify pointers via dsd's relocs.txt + delinks.txt per module.
    module_paths = discover_module_paths(config_dir)
    pointer_data: dict[str, tuple[int, int]] = {}
    for bucket_key, (delinks_path, relocs_path) in module_paths.items():
        _ms, tus = parse_delinks(delinks_path)
        relocs = parse_relocs(relocs_path)
        pointer_data[bucket_key] = classify_pointers(relocs, tus)

    # Merge into a sorted row list. Order: main, itcm, dtcm, ov000…ovNNN.
    def _row_key(b: str) -> tuple:
        order = {BUCKET_MAIN: 0, BUCKET_ITCM: 1, BUCKET_DTCM: 2}
        return (order.get(b, 3), b)

    all_buckets = sorted(
        set(bucket_data.keys()) | set(pointer_data.keys()),
        key=_row_key,
    )

    rows: list[dict] = []
    totals = {
        "code_total": 0, "code_matched": 0, "data_total": 0,
        "fn_total": 0, "fn_matched": 0,
        "units_total": 0, "units_complete": 0,
        "ptr_linked": 0, "ptr_hardcoded": 0,
    }
    for b in all_buckets:
        bd = bucket_data.get(b, {
            "code_total": 0, "code_matched": 0, "code_complete": 0,
            "data_total": 0,
            "fn_total": 0, "fn_matched": 0,
            "units_total": 0, "units_complete": 0,
        })
        pl, hc = pointer_data.get(b, (0, 0))
        row = {
            "bucket": b,
            "code_total": bd["code_total"],
            "code_matched": bd["code_matched"],
            "code_complete": bd["code_complete"],
            "data_total": bd["data_total"],
            "fn_total": bd["fn_total"],
            "fn_matched": bd["fn_matched"],
            "units_total": bd["units_total"],
            "units_complete": bd["units_complete"],
            "ptr_linked": pl,
            "ptr_hardcoded": hc,
        }
        rows.append(row)
        for k in ("code_total", "code_matched", "data_total",
                  "fn_total", "fn_matched",
                  "units_total", "units_complete",
                  "ptr_linked", "ptr_hardcoded"):
            totals[k] += row[k]

    if args.json:
        payload = {
            "region": region,
            "measures": measures,
            "buckets": rows,
            "totals": totals,
        }
        json.dump(payload, sys.stdout, indent=2)
        sys.stdout.write("\n")
        return 0

    print(f"Yu-Gi-Oh! GX Spirit Caller ({region}) — per-overlay breakdown")
    print()
    print_table(rows)
    print_summary(region, measures, totals)
    return 0


if __name__ == "__main__":
    sys.exit(main())
