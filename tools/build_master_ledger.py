#!/usr/bin/env python3
"""Build the committed, unmatched-function master candidate ledger."""
from __future__ import annotations

import argparse
import json
import re
from collections import defaultdict
from pathlib import Path

from size_census import (
    VALID_REGIONS,
    _module_paths,
    bucket_of,
    is_claimed,
    parse_claimed_text,
    parse_functions,
)

ROOT = Path(__file__).resolve().parent.parent
DEFAULT_OUTPUT = ROOT / "tools/corpus/master-ledger.jsonl"
DEFAULT_INDEX = ROOT / "docs/research/c-match-prep/INDEX.json"
DEFAULT_SIG = ROOT / "docs/research/sig-census-results.json"
MODE_RE = re.compile(
    r"^(\S+) kind:function\((arm|thumb),size=0x[0-9a-f]+\) addr:0x([0-9a-f]+)"
)


def symbol_modes(text: str) -> dict[tuple[str, int], str]:
    return {
        (m.group(1), int(m.group(3), 16)): m.group(2)
        for line in text.splitlines()
        if (m := MODE_RE.match(line))
    }


def normalize_module(value: str) -> str:
    value = value.strip().lower().replace("arm9 ", "")
    if value == "main":
        return "main"
    if value.startswith("overlay"):
        digits = re.sub(r"\D", "", value)
        return f"ov{int(digits):03d}"
    return value


def parse_addr(value: str | int) -> int:
    return int(value, 16) if isinstance(value, str) else value


def load_dossiers(path: Path = DEFAULT_INDEX) -> set[tuple[str, int]]:
    if not path.is_file():
        return set()
    data = json.loads(path.read_text())
    return {
        (normalize_module(row["module"]), parse_addr(row["addr"]))
        for row in data.get("candidates", [])
        if "module" in row and "addr" in row
    }


def load_twins(path: Path = DEFAULT_SIG) -> dict[tuple[str, str, int], str]:
    if not path.is_file():
        return {}
    data = json.loads(path.read_text())
    twins = {}
    for row in data.get("results", []):
        for region, entry in row.get("region_twins", {}).items():
            if entry.get("kind") != "applied_rename":
                continue
            if "twin_addr" not in entry or "twin_module" not in entry:
                continue
            twins[(region, normalize_module(entry["twin_module"]),
                   parse_addr(entry["twin_addr"]))] = row["name"]
    return twins


def build_region_rows(
    region: str,
    modules: list[tuple[str, Path, Path]] | None = None,
    dossiers: set[tuple[str, int]] | None = None,
    twins: dict[tuple[str, str, int], str] | None = None,
) -> list[dict]:
    dossiers = dossiers or set()
    twins = twins or {}
    rows = []
    for module, symbols_path, delinks_path in modules or _module_paths(region):
        if not symbols_path.is_file():
            continue
        symbols = symbols_path.read_text()
        intervals = parse_claimed_text(delinks_path.read_text()) if delinks_path.is_file() else []
        modes = symbol_modes(symbols)
        for name, addr, size in parse_functions(symbols):
            if is_claimed(addr, intervals):
                continue
            rows.append({
                "region": region,
                "module": module,
                "name": name,
                "addr": f"0x{addr:08x}",
                "size": size,
                "bucket": bucket_of(size),
                "mode": modes[(name, addr)],
                "has_dossier": (module, addr) in dossiers,
                "twin": twins.get((region, module, addr)),
            })
    return sorted(rows, key=lambda row: (row["module"], parse_addr(row["addr"]), row["name"]))


def write_ledger(regions: list[str], output: Path) -> dict[str, list[dict]]:
    dossiers = load_dossiers()
    twins = load_twins()
    rows_by_region = {region: build_region_rows(region, dossiers=dossiers, twins=twins)
                      for region in regions}
    output.parent.mkdir(parents=True, exist_ok=True)
    with output.open("w") as handle:
        for region in regions:
            for row in rows_by_region[region]:
                handle.write(json.dumps(row, sort_keys=True) + "\n")
    return rows_by_region


def read_ledger(path: Path) -> list[dict]:
    return [json.loads(line) for line in path.read_text().splitlines() if line.strip()]


ENDGAME_BYTES = {
    "eur": {"ov004": 5902, "main": 2270, "itcm": 1940, "ov019": 912, "ov014": 816,
             "ov003": 872, "ov001": 452, "ov006": 0, "ov020": 0, "ov015": 180,
             "ov010": 0, "ov018": 0, "ov002": 0, "ov017": 0, "ov005": 0, "ov016": 0,
             "ov007": 88, "ov022": 0, "ov009": 0, "ov008": 0, "ov023": 0, "ov021": 0,
             "ov011": 0, "ov013": 0},
    "usa": {"ov004": 7104, "main": 4660, "itcm": 2156, "ov019": 1044, "ov014": 948,
             "ov003": 916, "ov001": 452, "ov006": 484, "ov020": 476, "ov015": 284,
             "ov010": 368, "ov018": 348, "ov002": 304, "ov017": 284, "ov005": 224,
             "ov016": 220, "ov007": 176, "ov022": 160, "ov009": 136, "ov008": 108,
             "ov023": 100, "ov021": 88, "ov011": 52, "ov013": 20},
    "jpn": {"ov004": 7104, "main": 4544, "itcm": 2156, "ov019": 1044, "ov014": 948,
             "ov003": 916, "ov001": 452, "ov006": 484, "ov020": 476, "ov015": 284,
             "ov010": 368, "ov018": 348, "ov002": 304, "ov017": 284, "ov005": 224,
             "ov016": 220, "ov007": 176, "ov022": 160, "ov009": 136, "ov008": 108,
             "ov023": 100, "ov021": 88, "ov011": 52, "ov013": 20},
}


def render_summary(rows: list[dict]) -> str:
    groups = defaultdict(list)
    for row in rows:
        groups[(row["region"], row["module"])].append(row)
    lines = ["# Master candidate ledger summary", "", "Unmatched functions from committed symbols and delinks; byte deltas compare candidate bytes with the endgame ledger's code-gap bytes.", "", "| Region | Module | Count | Bytes | ARM | Thumb | Dossier | Twin | Endgame gap (B) | Delta (B) |", "|---|---|---:|---:|---:|---:|---:|---:|---:|---:|"]
    totals = defaultdict(lambda: [0, 0, 0, 0, 0, 0])
    for (region, module), items in sorted(groups.items()):
        count = len(items)
        byte_count = sum(item["size"] for item in items)
        arm = sum(item["mode"] == "arm" for item in items)
        thumb = count - arm
        dossier = sum(item["has_dossier"] for item in items)
        twin = sum(item["twin"] is not None for item in items)
        gap = ENDGAME_BYTES.get(region, {}).get(module, 0)
        lines.append(f"| {region.upper()} | {module} | {count} | {byte_count} | {arm} | {thumb} | {dossier}/{count} ({dossier / count:.1%}) | {twin}/{count} ({twin / count:.1%}) | {gap} | {byte_count - gap:+d} |")
        t = totals[region]
        for i, value in enumerate((count, byte_count, arm, thumb, dossier, twin)):
            t[i] += value
    lines += ["", "| **Region total** | | **Count** | **Bytes** | **ARM** | **Thumb** | **Dossier** | **Twin** | **Endgame gap (B)** | **Delta (B)** |", "|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|"]
    for region in VALID_REGIONS:
        count, byte_count, arm, thumb, dossier, twin = totals[region]
        gap = sum(ENDGAME_BYTES.get(region, {}).values())
        lines.append(f"| **{region.upper()}** | | {count} | {byte_count} | {arm} | {thumb} | {dossier}/{count} ({dossier / count:.1%}) | {twin}/{count} ({twin / count:.1%}) | {gap} | {byte_count - gap:+d} |")
    count = sum(v[0] for v in totals.values())
    byte_count = sum(v[1] for v in totals.values())
    gap = sum(sum(values.values()) for values in ENDGAME_BYTES.values())
    lines.append(f"| **ALL REGIONS** | | **{count}** | **{byte_count}** | **{sum(v[2] for v in totals.values())}** | **{sum(v[3] for v in totals.values())}** | | | **{gap}** | **{byte_count - gap:+d}** |")
    lines += ["", "The totals reconcile to the endgame ledger's 55,540-byte gap only as an explicit comparison: this ledger counts unmatched function spans, while the endgame ledger measures module code gaps. The delta is therefore reported, not adjusted.", "", "## ARM singleton pick-list", "", "| Name | Region | Module | Size | Dossier? |", "|---|---|---|---:|---|"]
    singletons = [row for row in rows if row["mode"] == "arm" and row["twin"] is None]
    for row in sorted(singletons, key=lambda r: (r["size"], r["region"], r["module"], r["name"]))[:100]:
        lines.append(f"| `{row['name']}` | {row['region'].upper()} | {row['module']} | {row['size']} | {'yes' if row['has_dossier'] else 'no'} |")
    return "\n".join(lines) + "\n"


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--version", nargs="+", choices=VALID_REGIONS, default=list(VALID_REGIONS))
    parser.add_argument("--output", type=Path, default=DEFAULT_OUTPUT)
    parser.add_argument("--summary", type=Path, help="also write a Markdown summary")
    args = parser.parse_args()
    rows = write_ledger(args.version, args.output)
    print(" ".join(f"{region}={len(rows[region])}" for region in args.version))
    if args.summary:
        args.summary.write_text(render_summary(read_ledger(args.output)))
        print(f"summary={args.summary}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
