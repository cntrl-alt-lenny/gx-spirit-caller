#!/usr/bin/env python3

"""
Reports decomp progress for Yu-Gi-Oh! GX Spirit Caller.

Two sources, in order of preference:

  1. build/<version>/report.json produced by `ninja report`
     (i.e. `objdiff-cli report generate`). Post-decomp, this is the source
     of truth — it reports matched code %, matched data %, complete-unit
     counts, etc.

  2. config/<version>/**/symbols.txt — the list of every known symbol,
     produced by `dsd init`. Pre-decomp (before anything compiles), we
     just count function entries here so the denominator is non-zero.

When neither exists yet, we print a friendly hint and exit 0. This script
is stubbed for the 0% state; expand the report.json parser once decomp
actually begins.
"""

import argparse
import json
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parent.parent


def count_functions_in_symbols(symbols_file: Path) -> int:
    """Count how many symbols in a dsd symbols.txt file are functions.

    ds-decomp's symbols.txt uses a 'kind:function' field per line; if the
    schema changes this heuristic will under/over-count, which is fine for
    a 0% stub — replace with the real parser when it matters.
    """
    count = 0
    try:
        with symbols_file.open() as f:
            for line in f:
                line = line.strip()
                if not line or line.startswith("#"):
                    continue
                # Match both "kind:function" and "function" as token.
                if "kind:function" in line or " function " in f" {line} ":
                    count += 1
    except OSError:
        pass
    return count


def count_total_functions(config_dir: Path) -> int:
    total = 0
    for symbols in config_dir.rglob("symbols.txt"):
        total += count_functions_in_symbols(symbols)
    return total


def print_stub(version: str, total: int) -> None:
    if total == 0:
        print(f"{version}: no symbols.txt files found yet.")
        print("  run: python tools/configure.py <version> && ninja delink")
        return
    pct = 0.0
    print(f"Yu-Gi-Oh! GX Spirit Caller ({version}) — decomp progress")
    print()
    print(f"  functions matched:  0 / {total}  ({pct:5.2f}%)")
    print(f"  data matched:       (no report yet)")
    print()
    print("  Run `ninja report` after compiling any source to produce a real report.")


def print_report(version: str, report: dict) -> None:
    print(f"Yu-Gi-Oh! GX Spirit Caller ({version}) — decomp progress")
    print()
    measures = report.get("measures", {})

    def pct(matched, total):
        return (matched / total * 100.0) if total else 0.0

    # objdiff v2.7+ emits byte totals as strings (values exceed JS safe-int range).
    def as_int(v) -> int:
        return int(v) if v is not None else 0

    code_matched = as_int(measures.get("matched_code"))
    code_total   = as_int(measures.get("total_code"))
    data_matched = as_int(measures.get("matched_data"))
    data_total   = as_int(measures.get("total_data"))
    units_done   = as_int(measures.get("complete_code"))
    units_total  = as_int(measures.get("total_units"))

    print(f"  code:   {code_matched:>10} / {code_total:<10} bytes  ({pct(code_matched, code_total):5.2f}%)")
    print(f"  data:   {data_matched:>10} / {data_total:<10} bytes  ({pct(data_matched, data_total):5.2f}%)")
    print(f"  units:  {units_done:>10} / {units_total:<10}        ({pct(units_done, units_total):5.2f}%)")
    print()

    if report.get("categories"):
        print("  by category:")
        for cat in report["categories"]:
            name = cat.get("name", "?")
            m = cat.get("measures", {})
            print(f"    {name:<20} code {pct(as_int(m.get('matched_code')), as_int(m.get('total_code'))):5.2f}%   "
                  f"data {pct(as_int(m.get('matched_data')), as_int(m.get('total_data'))):5.2f}%")


def main() -> int:
    ap = argparse.ArgumentParser(description="Report decomp progress")
    ap.add_argument("--version", default="usa", help='Game version (default: "usa")')
    ap.add_argument("--json", action="store_true", help="Emit machine-readable JSON")
    args = ap.parse_args()

    report_path = ROOT / "build" / args.version / "report.json"
    config_dir  = ROOT / "config" / args.version

    if report_path.is_file():
        with report_path.open() as f:
            report = json.load(f)
        if args.json:
            json.dump(report, sys.stdout, indent=2)
            print()
        else:
            print_report(args.version, report)
        return 0

    total = count_total_functions(config_dir)
    if args.json:
        json.dump({
            "version": args.version,
            "state": "stub",
            "total_functions": total,
            "matched_functions": 0,
        }, sys.stdout, indent=2)
        print()
    else:
        print_stub(args.version, total)
    return 0


if __name__ == "__main__":
    sys.exit(main())
