#!/usr/bin/env python3

"""
overlay_coupling.py — cross-module call-density report.

Walks every `config/<ver>/arm9/**/relocs.txt`, counts the control-flow
edges between each (source module, destination module) pair, and
produces:

  - stdout summary: tightest-coupled module pairs, standalone overlays.
  - build/<ver>/analysis/coupling.md: per-module "top outbound" table
    plus a ranked list of the tightest pairs.

Why the decomper / brain should care:

  - Tightly coupled overlays (hundreds of mutual calls) are almost
    always a single logical feature split across files; decomp'ing
    them separately is painful because each match on one side needs
    the other's symbols to compile.
  - "Standalone" overlays (few cross-module calls, mostly self-contained)
    are the easy wins — you can decomp them without dragging in the
    rest of the tree.

Usage:
    python tools/overlay_coupling.py --version eur
    python tools/overlay_coupling.py --version eur --top 20
"""

from __future__ import annotations

import argparse
import sys
from collections import defaultdict
from pathlib import Path

# Sibling tools/ imports — tools/ is on sys.path when this is run as
# a script. Reuse the parsers so schema drift touches one place.
sys.path.insert(0, str(Path(__file__).resolve().parent))
from analyze_symbols import (  # noqa: E402
    CALL_RELOC_KINDS,
    FAILING_MODULES,
    ROOT,
    discover_modules,
    parse_relocs_file,
)


def module_relocs_path(config_root: Path, module: str) -> Path:
    """Map a module name back to its relocs.txt file."""
    arm9 = config_root / "arm9"
    if module == "main":
        return arm9 / "relocs.txt"
    if module in ("itcm", "dtcm"):
        return arm9 / module / "relocs.txt"
    return arm9 / "overlays" / module / "relocs.txt"


def build_matrix(config_root: Path) -> tuple[list[str], dict[tuple[str, str], int]]:
    """Return (modules, edges) where edges[(src, dst)] is the number of
    call relocs from src into dst. Self-loops included (src == dst)."""
    modules = discover_modules(config_root)
    edges: dict[tuple[str, str], int] = defaultdict(int)
    for src in modules:
        for r in parse_relocs_file(module_relocs_path(config_root, src), src):
            if r.kind in CALL_RELOC_KINDS:
                edges[(src, r.dest_module)] += 1
    return modules, dict(edges)


def top_outbound(modules: list[str], edges: dict[tuple[str, str], int], src: str, k: int = 3) -> list[tuple[str, int]]:
    out = [((dst, count)) for (s, dst), count in edges.items() if s == src and dst != src]
    out.sort(key=lambda kv: -kv[1])
    return out[:k]


def standalone(modules: list[str], edges: dict[tuple[str, str], int], threshold: int = 20) -> list[tuple[str, int]]:
    """Modules whose external (non-self) outbound call count is below
    `threshold` — candidates for standalone decomp work."""
    out = []
    for m in modules:
        external = sum(c for (s, dst), c in edges.items() if s == m and dst != m)
        if external < threshold:
            out.append((m, external))
    out.sort(key=lambda kv: kv[1])
    return out


def print_summary(modules: list[str], edges: dict[tuple[str, str], int], top_n: int) -> None:
    total = sum(edges.values())
    self_edges = sum(c for (s, d), c in edges.items() if s == d)
    cross_edges = total - self_edges
    print(f"Modules            : {len(modules)}")
    print(f"Total call edges   : {total}")
    print(f"  self-loops       : {self_edges}")
    print(f"  cross-module     : {cross_edges}")
    print()

    # Top-N pairs by count, cross-module only.
    cross = [((s, d), c) for (s, d), c in edges.items() if s != d]
    cross.sort(key=lambda kv: -kv[1])
    print(f"Top {top_n} coupled pairs (src -> dst, call count):")
    for (s, d), c in cross[:top_n]:
        fail = ""
        if s in FAILING_MODULES or d in FAILING_MODULES:
            fail = "  [checksum-failing module involved]"
        print(f"  {c:>6d}  {s:<6s} -> {d:<6s}{fail}")
    print()

    stands = standalone(modules, edges, threshold=20)
    print(f"Standalone modules (< 20 external outbound calls): {len(stands)}")
    for m, external in stands:
        print(f"  {m:<6s}  {external} external calls")


def write_coupling_md(
    path: Path,
    modules: list[str],
    edges: dict[tuple[str, str], int],
    top_n: int,
) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)

    cross = [((s, d), c) for (s, d), c in edges.items() if s != d]
    cross.sort(key=lambda kv: -kv[1])

    lines: list[str] = []
    lines.append("# Overlay coupling")
    lines.append("")
    lines.append(
        "Cross-module call density, derived from every "
        "`config/<ver>/arm9/**/relocs.txt`. Regenerate with "
        "`python tools/overlay_coupling.py --version <ver>`."
    )
    lines.append("")

    total = sum(edges.values())
    self_edges = sum(c for (s, d), c in edges.items() if s == d)
    cross_edges = total - self_edges
    lines.append(f"- Total call edges: **{total}** "
                 f"({self_edges} self-loops, {cross_edges} cross-module)")
    lines.append(f"- Modules: **{len(modules)}**")
    lines.append("")

    # Top-N pairs.
    lines.append(f"## Tightest-coupled pairs (top {min(top_n, len(cross))})")
    lines.append("")
    lines.append("| Rank | Src | Dst | Call count | Notes |")
    lines.append("|-----:|-----|-----|-----------:|-------|")
    for i, ((s, d), c) in enumerate(cross[:top_n], start=1):
        notes = []
        if s in FAILING_MODULES or d in FAILING_MODULES:
            notes.append("checksum-failing module involved")
        lines.append(
            f"| {i} | {s} | {d} | {c} | {'; '.join(notes) if notes else '—'} |"
        )
    lines.append("")

    # Per-module "top 3 outbound" matrix.
    lines.append("## Per-module top 3 outbound destinations")
    lines.append("")
    lines.append("| Module | Self calls | Top 3 external destinations |")
    lines.append("|--------|-----------:|------------------------------|")
    for m in modules:
        self_c = edges.get((m, m), 0)
        top = top_outbound(modules, edges, m, k=3)
        if not top:
            cells = "—"
        else:
            cells = ", ".join(f"{dst} ({c})" for dst, c in top)
        fail_mark = " **FAIL**" if m in FAILING_MODULES else ""
        lines.append(f"| {m}{fail_mark} | {self_c} | {cells} |")
    lines.append("")

    # Standalone modules.
    stands = standalone(modules, edges, threshold=20)
    lines.append("## Standalone modules (< 20 external outbound calls)")
    lines.append("")
    if not stands:
        lines.append("(none)")
    else:
        lines.append("| Module | External calls |")
        lines.append("|--------|---------------:|")
        for m, external in stands:
            lines.append(f"| {m} | {external} |")
    lines.append("")

    with path.open("w") as f:
        f.write("\n".join(lines))


def main() -> int:
    ap = argparse.ArgumentParser(
        description="Cross-module call density report for dsd-based decomps"
    )
    ap.add_argument("--version", default="eur")
    ap.add_argument("--top", type=int, default=15,
                    help="Top N coupled pairs to show (default 15)")
    ap.add_argument("--no-outputs", action="store_true",
                    help="Skip writing build/<ver>/analysis/coupling.md")
    args = ap.parse_args()

    config_root = ROOT / "config" / args.version
    out_dir = ROOT / "build" / args.version / "analysis"

    modules, edges = build_matrix(config_root)
    print_summary(modules, edges, top_n=args.top)

    if not args.no_outputs:
        write_coupling_md(out_dir / "coupling.md", modules, edges, top_n=args.top)
        print(f"\nWrote {out_dir}/coupling.md", file=sys.stderr)

    return 0


if __name__ == "__main__":
    sys.exit(main())
