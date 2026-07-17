#!/usr/bin/env python3
"""Build the committed, unmatched-function master candidate ledger."""
from __future__ import annotations

import argparse
import json
import re
import subprocess
import time
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
                "attempted": False,
                "park_reason": None,
            })
    return sorted(rows, key=lambda row: (row["module"], parse_addr(row["addr"]), row["name"]))


def _evidence_tags(line: str, heading: str, source: str) -> list[str]:
    if source.endswith("endgame-ledger.md"):
        if any(word in heading.lower() for word in ("park", "floor")):
            return ["endgame-floor"]
        return []
    if not source.endswith("codegen-walls.md"):
        return []
    tags = re.findall(r"\b(?:C|P|T)-\d+[a-z]?\b|\bW-[A-Z]\b", line)
    if tags:
        return [tags[0]]
    heading_tags = re.findall(r"\b(?:C|P|T)-\d+[a-z]?\b|\bW-[A-Z]\b", heading)
    if heading_tags:
        return [heading_tags[0]]
    return ["codegen-walls"]


def load_research_evidence(names: set[str], research_root: Path = ROOT / "docs/research") -> tuple[set[str], dict[str, str], float]:
    """Use one ripgrep pattern-file sweep, then classify matching evidence."""
    started = time.perf_counter()
    if not names:
        return set(), {}, 0.0
    pattern_file = research_root.parent / ".master-ledger-name-patterns.tmp"
    pattern_file.write_text("\n".join(sorted(names)) + "\n")
    try:
        result = subprocess.run(
            [
                "rg", "-l", "-F", "-f", str(pattern_file),
                "--glob", "!campaign-analytics/master-ledger-summary.md",
                "--glob", "!campaign-analytics/pick-lists.md",
                str(research_root),
            ],
            check=True,
            capture_output=True,
            text=True,
        )
    finally:
        pattern_file.unlink(missing_ok=True)
    attempted = set()
    reasons: dict[str, set[str]] = defaultdict(set)
    for raw_path in result.stdout.splitlines():
        path = Path(raw_path)
        text = path.read_text(encoding="utf-8")
        present = {name for name in names if name in text}
        attempted.update(present)
        heading = ""
        for line in text.splitlines():
            if line.startswith("#"):
                heading = line
            for name in present:
                if name in line:
                    reasons[name].update(_evidence_tags(line, heading, path.name))
    elapsed = time.perf_counter() - started
    def primary(tags: set[str]) -> str:
        if "endgame-floor" in tags:
            return "endgame-floor"
        if "codegen-walls" in tags:
            return "codegen-walls"
        return sorted(tags)[0]

    return attempted, {name: primary(tags) for name, tags in reasons.items() if tags}, elapsed


def apply_provenance(rows: list[dict]) -> float:
    names = {row["name"] for row in rows}
    attempted, reasons, elapsed = load_research_evidence(names)
    for row in rows:
        row["attempted"] = row["name"] in attempted
        row["park_reason"] = reasons.get(row["name"])
    return elapsed


def write_ledger(regions: list[str], output: Path) -> tuple[dict[str, list[dict]], float]:
    dossiers = load_dossiers()
    twins = load_twins()
    rows_by_region = {region: build_region_rows(region, dossiers=dossiers, twins=twins)
                      for region in regions}
    elapsed = apply_provenance([row for rows in rows_by_region.values() for row in rows])
    output.parent.mkdir(parents=True, exist_ok=True)
    with output.open("w") as handle:
        for region in regions:
            for row in rows_by_region[region]:
                handle.write(json.dumps(row, sort_keys=True) + "\n")
    return rows_by_region, elapsed


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
    lines = ["# Master candidate ledger summary", "", "Unmatched functions from committed symbols and delinks; provenance columns are derived from one repository-wide ripgrep sweep.", "", "| Region | Module | Count | Bytes | ARM | Thumb | Dossier | Twin | Attempted | Parked | Endgame gap (B) | Delta (B) |", "|---|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|"]
    totals = defaultdict(lambda: [0, 0, 0, 0, 0, 0])
    for (region, module), items in sorted(groups.items()):
        count = len(items)
        byte_count = sum(item["size"] for item in items)
        arm = sum(item["mode"] == "arm" for item in items)
        thumb = count - arm
        dossier = sum(item["has_dossier"] for item in items)
        twin = sum(item["twin"] is not None for item in items)
        attempted = sum(item["attempted"] for item in items)
        parked = sum(item["park_reason"] is not None for item in items)
        gap = ENDGAME_BYTES.get(region, {}).get(module, 0)
        lines.append(f"| {region.upper()} | {module} | {count} | {byte_count} | {arm} | {thumb} | {dossier}/{count} ({dossier / count:.1%}) | {twin}/{count} ({twin / count:.1%}) | {attempted}/{count} | {parked}/{count} | {gap} | {byte_count - gap:+d} |")
        t = totals[region]
        for i, value in enumerate((count, byte_count, arm, thumb, dossier, twin)):
            t[i] += value
    lines += ["", "| **Region total** | | **Count** | **Bytes** | **ARM** | **Thumb** | **Dossier** | **Twin** | **Attempted** | **Parked** | **Endgame gap (B)** | **Delta (B)** |", "|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|"]
    for region in VALID_REGIONS:
        count, byte_count, arm, thumb, dossier, twin = totals[region]
        attempted = sum(item["attempted"] for item in rows if item["region"] == region)
        parked = sum(item["park_reason"] is not None for item in rows if item["region"] == region)
        gap = sum(ENDGAME_BYTES.get(region, {}).values())
        lines.append(f"| **{region.upper()}** | | {count} | {byte_count} | {arm} | {thumb} | {dossier}/{count} ({dossier / count:.1%}) | {twin}/{count} ({twin / count:.1%}) | {attempted}/{count} | {parked}/{count} | {gap} | {byte_count - gap:+d} |")
    count = sum(v[0] for v in totals.values())
    byte_count = sum(v[1] for v in totals.values())
    gap = sum(sum(values.values()) for values in ENDGAME_BYTES.values())
    attempted = sum(row["attempted"] for row in rows)
    parked = sum(row["park_reason"] is not None for row in rows)
    lines.append(f"| **ALL REGIONS** | | **{count}** | **{byte_count}** | **{sum(v[2] for v in totals.values())}** | **{sum(v[3] for v in totals.values())}** | | | **{attempted}** | **{parked}** | **{gap}** | **{byte_count - gap:+d}** |")
    lines += ["", "The totals reconcile to the endgame ledger's 55,540-byte gap only as an explicit comparison: this ledger counts unmatched function spans, while the endgame ledger measures module code gaps. The delta is therefore reported, not adjusted.", "", "## ARM singleton pick-list", "", "| Name | Region | Module | Size | Dossier? |", "|---|---|---|---:|---|"]
    singletons = [row for row in rows if row["mode"] == "arm" and row["twin"] is None]
    for row in sorted(singletons, key=lambda r: (r["size"], r["region"], r["module"], r["name"]))[:100]:
        lines.append(f"| `{row['name']}` | {row['region'].upper()} | {row['module']} | {row['size']} | {'yes' if row['has_dossier'] else 'no'} |")
    return "\n".join(lines) + "\n"


def render_pick_lists(rows: list[dict]) -> str:
    lines = ["# Never-attempted ARM singleton pick-lists", "", "Full lists by module; singleton means `twin == null`. Rows are sorted by size, then region and address.", ""]
    groups = defaultdict(list)
    for row in rows:
        if row["mode"] == "arm" and row["twin"] is None and not row["attempted"]:
            groups[row["module"]].append(row)
    for module in sorted(groups):
        items = sorted(groups[module], key=lambda r: (r["size"], r["region"], parse_addr(r["addr"]), r["name"]))
        lines += [f"## {module} ({len(items)} rows)", "", "| Name | Region | Size | Dossier? |", "|---|---|---:|---|"]
        for row in items:
            lines.append(f"| `{row['name']}` | {row['region'].upper()} | {row['size']} | {'yes' if row['has_dossier'] else 'no'} |")
        lines.append("")
    lines.append(f"Total never-attempted ARM singletons: {sum(len(items) for items in groups.values())}.")
    return "\n".join(lines) + "\n"


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--version", nargs="+", choices=VALID_REGIONS, default=list(VALID_REGIONS))
    parser.add_argument("--output", type=Path, default=DEFAULT_OUTPUT)
    parser.add_argument("--summary", type=Path, help="also write a Markdown summary")
    parser.add_argument("--pick-lists", type=Path, help="also write never-attempted ARM singleton lists")
    args = parser.parse_args()
    rows, elapsed = write_ledger(args.version, args.output)
    print(" ".join(f"{region}={len(rows[region])}" for region in args.version))
    if args.summary:
        ledger_rows = read_ledger(args.output)
        args.summary.write_text(render_summary(ledger_rows))
        print(f"summary={args.summary}")
        if args.pick_lists:
            args.pick_lists.write_text(render_pick_lists(ledger_rows))
            print(f"pick_lists={args.pick_lists}")
    print(f"research_sweep_seconds={elapsed:.6f}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
