#!/usr/bin/env python3

"""
next_targets.py — what should I decomp next?

`analyze_symbols.py` already classifies every function into a tier
(trivial / easy / sinit / named / medium / hard) and writes a
`targets.md`. But that ranker doesn't know which functions have
ALREADY been matched; the decomper sees the same easy targets in
their worklist daily even after the underlying TUs are byte-identical
in the rebuilt ROM.

This tool closes that loop. It:

  1. Loads the same modules + call graph that analyze_symbols uses.
  2. Reads `config/<ver>/**/delinks.txt` and collects every address
     range covered by a TU marked `complete` (the dsd-blessed
     "objdiff agrees byte-identical" marker).
  3. Filters analyze_symbols's ranked targets to the unmatched ones
     only, and sorts easiest-first within each tier.
  4. Optionally restricts to a tier or module so the decomper can
     ask narrow questions ("show me ov006's easy unmatched leaves").

Outputs (default):

  - stdout: per-tier counts + the top-N picks across all tiers.
  - build/<ver>/analysis/next_targets.md: full ranked worklist.
  - build/<ver>/analysis/next_targets.json: lookup-friendly version.

Usage:

  python tools/next_targets.py --version eur
  python tools/next_targets.py --version eur --tier easy --module ov006
  python tools/next_targets.py --version eur --top 20 --no-outputs

Pairs naturally with `tools/find_duplicates.py` (which surfaces
template/bulk opportunities) — find_duplicates points you at clusters
worth ONE template match; this tool points you at the next isolated
function to attack.
"""

from __future__ import annotations

import argparse
import json
import sys
from dataclasses import dataclass
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from analyze_symbols import (  # noqa: E402
    ROOT,
    Target,
    TIER_ORDER,
    build_call_graph,
    load_all,
    rank_targets,
)
from progress import (  # noqa: E402
    parse_delinks_file,
)


# --------------------------------------------------------------------------- #
# Matched-state collection
# --------------------------------------------------------------------------- #

def collect_matched_ranges(config_dir: Path) -> dict[str, list[tuple[int, int]]]:
    """Walk every config/<ver>/**/delinks.txt and collect address
    ranges covered by `complete` TUs.

    Returns {module_name: [(start, end), ...]} where each tuple is
    one section's range from a complete TU. A function whose addr
    falls in any of these ranges is byte-identical in the rebuilt
    ROM (per dsd's "complete" marker, set by the decomper after
    objdiff agrees).

    Module name is derived from the delinks.txt path:
      arm9/delinks.txt                   -> "main"
      arm9/itcm/delinks.txt              -> "itcm"
      arm9/dtcm/delinks.txt              -> "dtcm"
      arm9/overlays/ov005/delinks.txt    -> "ov005"
    """
    out: dict[str, list[tuple[int, int]]] = {}
    for delinks in config_dir.rglob("delinks.txt"):
        module = _module_name_from_delinks_path(delinks, config_dir)
        _module_sections, tus = parse_delinks_file(delinks)
        ranges: list[tuple[int, int]] = []
        for tu in tus:
            name = tu.get("source", "")
            if name.startswith("_dsd_gap"):
                continue
            if tu.get("status") != "complete":
                continue
            for _section, start, end in tu.get("sections", []):
                if end > start:
                    ranges.append((start, end))
        if ranges:
            out[module] = ranges
    return out


def _module_name_from_delinks_path(p: Path, config_dir: Path) -> str:
    """arm9/delinks.txt -> "main"; arm9/overlays/ov005/delinks.txt -> "ov005"."""
    try:
        rel = p.relative_to(config_dir)
    except ValueError:
        rel = p
    parts = rel.parts[:-1]  # drop "delinks.txt"
    if not parts:
        return "module"
    last = parts[-1]
    if last == "arm9":
        return "main"
    return last


def is_addr_matched(
    matched: dict[str, list[tuple[int, int]]],
    module: str,
    addr: int,
) -> bool:
    for start, end in matched.get(module, ()):
        if start <= addr < end:
            return True
    return False


# --------------------------------------------------------------------------- #
# Filtered ranking
# --------------------------------------------------------------------------- #

@dataclass
class WorklistEntry:
    target: Target
    matched: bool


def build_worklist(
    targets: list[Target],
    matched_ranges: dict[str, list[tuple[int, int]]],
    *,
    tier: str | None = None,
    module: str | None = None,
) -> list[Target]:
    """Filter `targets` to the unmatched subset, optionally also
    restricting to a single tier and/or module. Order is preserved
    from rank_targets (already easiest-first)."""
    out: list[Target] = []
    for t in targets:
        if tier is not None and t.tier != tier:
            continue
        if module is not None and t.symbol.module != module:
            continue
        if is_addr_matched(matched_ranges, t.symbol.module, t.symbol.addr):
            continue
        out.append(t)
    return out


def tier_breakdown(
    targets: list[Target],
    matched_ranges: dict[str, list[tuple[int, int]]],
) -> dict[str, dict[str, int]]:
    """For each tier in TIER_ORDER, compute matched / unmatched counts."""
    out: dict[str, dict[str, int]] = {
        t: {"matched": 0, "unmatched": 0, "total": 0}
        for t in TIER_ORDER
    }
    for t in targets:
        bucket = out.setdefault(
            t.tier, {"matched": 0, "unmatched": 0, "total": 0},
        )
        bucket["total"] += 1
        if is_addr_matched(
            matched_ranges, t.symbol.module, t.symbol.addr,
        ):
            bucket["matched"] += 1
        else:
            bucket["unmatched"] += 1
    return out


# --------------------------------------------------------------------------- #
# Output
# --------------------------------------------------------------------------- #

def print_summary(
    breakdown: dict[str, dict[str, int]],
    worklist: list[Target],
    *,
    top_n: int = 15,
    tier_filter: str | None = None,
    module_filter: str | None = None,
) -> None:
    print("Tier breakdown (matched / unmatched / total):")
    for tier in TIER_ORDER:
        row = breakdown.get(tier, {"matched": 0, "unmatched": 0, "total": 0})
        if row["total"] == 0:
            continue
        m = row["matched"]
        u = row["unmatched"]
        t = row["total"]
        pct = (m / t * 100.0) if t else 0.0
        print(f"  {tier:<8s} {m:>5d} / {u:>5d} / {t:>5d}  ({pct:5.1f}% matched)")
    print()

    label_bits: list[str] = []
    if tier_filter:
        label_bits.append(f"tier={tier_filter}")
    if module_filter:
        label_bits.append(f"module={module_filter}")
    label = (" (" + ", ".join(label_bits) + ")") if label_bits else ""
    print(f"Top {min(top_n, len(worklist))} unmatched picks{label}:")

    if not worklist:
        print("  (nothing — either fully matched or filter too narrow)")
        return

    for t in worklist[:top_n]:
        s = t.symbol
        print(
            f"  [{t.tier:<7s}] {s.module}|0x{s.addr:08x}  "
            f"size=0x{s.size:<3x}  {s.name}"
        )


def write_md(
    path: Path,
    breakdown: dict[str, dict[str, int]],
    worklist: list[Target],
    *,
    version: str,
    top_per_tier: int = 25,
    tier_filter: str | None = None,
    module_filter: str | None = None,
) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    lines: list[str] = []
    lines.append(f"# Next decomp targets ({version})")
    lines.append("")
    lines.append(
        "Unmatched functions ranked by `analyze_symbols.classify`, "
        "filtered against `delinks.txt` `complete` markers so the "
        "already-matched ones drop out of view. Easiest-first within "
        "each tier."
    )
    lines.append("")

    if tier_filter or module_filter:
        bits = []
        if tier_filter:
            bits.append(f"tier=`{tier_filter}`")
        if module_filter:
            bits.append(f"module=`{module_filter}`")
        lines.append(f"_Filtered: {', '.join(bits)}._")
        lines.append("")

    lines.append("## Tier breakdown")
    lines.append("")
    lines.append("| Tier | Matched | Unmatched | Total | % matched |")
    lines.append("|------|--------:|----------:|------:|----------:|")
    for tier in TIER_ORDER:
        row = breakdown.get(tier, {"matched": 0, "unmatched": 0, "total": 0})
        if row["total"] == 0:
            continue
        m = row["matched"]
        u = row["unmatched"]
        t = row["total"]
        pct = (m / t * 100.0) if t else 0.0
        lines.append(f"| `{tier}` | {m} | {u} | {t} | {pct:.1f}% |")
    lines.append("")

    # Group worklist by tier for the per-tier sections.
    by_tier: dict[str, list[Target]] = {t: [] for t in TIER_ORDER}
    for t in worklist:
        by_tier.setdefault(t.tier, []).append(t)

    for tier in TIER_ORDER:
        bucket = by_tier.get(tier, [])
        if not bucket:
            continue
        lines.append(f"## `{tier}` (showing top {min(top_per_tier, len(bucket))} of {len(bucket)})")
        lines.append("")
        lines.append("| Module | Addr | Size | Name | Reason |")
        lines.append("|--------|------|-----:|------|--------|")
        for t in bucket[:top_per_tier]:
            s = t.symbol
            # Markdown table cells: pipes and underscores in the reason
            # are mostly safe inside a short cell; the reason column comes
            # from analyze_symbols and is hand-written.
            lines.append(
                f"| `{s.module}` | `0x{s.addr:08x}` | `0x{s.size:x}` | "
                f"`{s.name}` | {t.reason} |"
            )
        lines.append("")

    with path.open("w", encoding="utf-8") as f:
        f.write("\n".join(lines))


def write_json(
    path: Path,
    breakdown: dict[str, dict[str, int]],
    worklist: list[Target],
    *,
    version: str,
    tier_filter: str | None = None,
    module_filter: str | None = None,
) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    payload = {
        "version": version,
        "filters": {
            "tier": tier_filter,
            "module": module_filter,
        },
        "tier_breakdown": breakdown,
        "worklist": [
            {
                "tier": t.tier,
                "module": t.symbol.module,
                "addr": f"0x{t.symbol.addr:08x}",
                "size": t.symbol.size,
                "name": t.symbol.name,
                "callees_total": t.callees_total,
                "callees_named": t.callees_named,
                "reason": t.reason,
            }
            for t in worklist
        ],
    }
    with path.open("w", encoding="utf-8") as f:
        json.dump(payload, f, indent=2)


# --------------------------------------------------------------------------- #
# CLI
# --------------------------------------------------------------------------- #

def main() -> int:
    ap = argparse.ArgumentParser(
        description="Pick the next decomp target — analyze_symbols + delinks-aware filter."
    )
    ap.add_argument("--version", default="eur", help="Game version (eur/usa/jpn)")
    ap.add_argument("--top", type=int, default=15,
                    help="Stdout: top-N picks across all tiers")
    ap.add_argument("--top-per-tier", type=int, default=25,
                    help="Markdown: top-N picks within each tier")
    ap.add_argument("--tier", choices=TIER_ORDER,
                    help="Restrict to a single tier")
    ap.add_argument("--module",
                    help="Restrict to a single module (e.g. ov006)")
    ap.add_argument("--no-outputs", action="store_true",
                    help="Skip writing analysis/next_targets.{md,json}")
    args = ap.parse_args()

    config_dir = ROOT / "config" / args.version
    out_dir = ROOT / "build" / args.version / "analysis"

    if not config_dir.is_dir():
        print(
            f"error: {config_dir} not found. "
            f"Run `python tools/configure.py {args.version}` first.",
            file=sys.stderr,
        )
        return 2

    modules = load_all(config_dir)
    graph = build_call_graph(modules)
    targets = rank_targets(modules, graph)
    matched = collect_matched_ranges(config_dir)

    breakdown = tier_breakdown(targets, matched)
    worklist = build_worklist(
        targets, matched,
        tier=args.tier, module=args.module,
    )

    print_summary(
        breakdown, worklist,
        top_n=args.top,
        tier_filter=args.tier,
        module_filter=args.module,
    )

    if not args.no_outputs:
        write_md(
            out_dir / "next_targets.md",
            breakdown, worklist,
            version=args.version,
            top_per_tier=args.top_per_tier,
            tier_filter=args.tier,
            module_filter=args.module,
        )
        write_json(
            out_dir / "next_targets.json",
            breakdown, worklist,
            version=args.version,
            tier_filter=args.tier,
            module_filter=args.module,
        )
        print(
            f"\nWrote {out_dir}/next_targets.md and "
            f"{out_dir}/next_targets.json",
            file=sys.stderr,
        )

    return 0


if __name__ == "__main__":
    sys.exit(main())
