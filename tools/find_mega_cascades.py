#!/usr/bin/env python3

"""
find_mega_cascades.py — transitive cascade finder.

Extends `find_cascades.py` (#132) from single-step to multi-step
promotion prediction. Same graph semantics, recursive evaluation.

## The model

`analyze_symbols.classify` places a function in `medium` tier when
`size ≤ 0x80 AND every direct callee is named`. `find_cascades`
already answers: "if I name placeholder X, how many `hard → medium`
promotions fire in one step?"

Mega-cascade answers the follow-on: **if I name X AND then name
each promoted function in sequence, how many total promotions
cascade across the tree?**

Concrete: target X has primary cascade 20. Of those 20 promoted
functions, 5 are themselves size-≤-0x80 with placeholder callees
blocked on placeholder callees that would promote once those 5
are named. Those 5 each promote their own callers, and so on. The
mega-cascade is the transitive closure.

## Why this matters

A target with **primary cascade 20 + second-order cascade 50** is a
much higher-leverage anchor than one with **primary cascade 30 +
second-order 0**. The former seeds 3-4 cascade waves from one
matched function; the latter saturates after one wave.

`find_cascades` alone misses this distinction. Mega-cascade makes
it explicit.

## Algorithm

BFS over the promotion graph:

1. Seed `named_set = {X}` (the target to be renamed).
2. Repeatedly find every placeholder P such that naming P would
   promote at least one function given the current `named_set`,
   and add P's would-be-promotees to `promoted_set`. But we also
   need to consider P itself becomes newly named — cycles and
   second-order effects propagate.
3. Terminate when no further promotions fire.

In practice: at each step, extend `named_set` to include ALL
currently-promoted functions (because the decomper will match +
name them after the first wave lands). Re-run promotion check
with the expanded `named_set`. Repeat until fixpoint.

Worst-case O(N²) per target; in practice the graph is sparse so
per-target BFS is fast. Total cost for ranked-all mode is
O(N * avg_mega_cascade) which is O(N * small_constant) in the
current corpus (673 cascade-producers × ~5 avg depth).

## Usage

    # Ranked mode — top-N placeholder anchors by mega-cascade weight.
    python tools/find_mega_cascades.py --version eur --top 20

    # Per-symbol mode — explain the mega-cascade tree for one anchor.
    python tools/find_mega_cascades.py --version eur main 0x02018b28

Pairs with `tools/find_cascades.py` (#132) — that's the primary
single-step view; this tool surfaces the transitive-closure view.
Both feed into `tools/cascade_apply.py` (#190) for the actual
rename wave.
"""

from __future__ import annotations

import argparse
import sys
from dataclasses import dataclass
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from analyze_symbols import (  # noqa: E402
    CallGraph,
    ModuleData,
    ROOT,
    Symbol,
    SymbolKey,
    build_call_graph,
    load_all,
)
from find_cascades import (  # noqa: E402
    MEDIUM_SIZE_CAP,
)
from next_targets import (  # noqa: E402
    collect_matched_ranges,
    is_addr_matched,
)


@dataclass(frozen=True)
class MegaCascade:
    """Transitive-closure promotion set starting from one anchor.

    `direct` — functions promoted by naming the anchor alone.
    `indirect` — functions promoted in subsequent waves (after the
      directly-promoted functions are themselves named).
    `total` — direct ∪ indirect.
    `depth` — number of BFS rounds until fixpoint; 1 = no
      second-order cascade, 2+ = mega-cascade exists.
    """
    anchor: Symbol
    direct: frozenset[SymbolKey]
    indirect: frozenset[SymbolKey]
    total: frozenset[SymbolKey]
    depth: int

    @property
    def weight(self) -> int:
        return len(self.total)


def _would_promote(
    caller: Symbol,
    caller_callees: set[SymbolKey],
    named_set: set[SymbolKey],
    modules: dict[str, ModuleData],
) -> bool:
    """Given a hypothetical `named_set` of placeholders-become-named,
    would `caller` be classified as `medium`? Mirrors
    `analyze_symbols.classify`'s medium gate:
      size ≤ 0x80, all direct callees named (either by the config
      or by the hypothesised rename set).

    A caller that's ALREADY `medium` or better isn't a cascade
    target — we're looking for hard→medium promotions specifically.
    """
    if not caller.is_function:
        return False
    if caller.size == 0 or caller.size > MEDIUM_SIZE_CAP:
        return False
    if caller.name.startswith("__sinit_"):
        return False
    if caller.is_named:
        # Already `named` tier; renaming placeholder callees doesn't
        # demote it. Not a cascade target.
        return False
    if not caller_callees:
        # No callees → classifier puts it in trivial/easy by size,
        # not medium. Not our cascade semantics.
        return False
    for (cm, ca) in caller_callees:
        md = modules.get(cm)
        if md is None:
            return False  # unresolved → can't verify all-named
        cs = md.by_addr.get(ca)
        if cs is None:
            return False
        if cs.is_named:
            continue
        if (cm, ca) in named_set:
            continue
        return False  # found a placeholder callee not in named_set
    return True


def mega_cascade_for_target(
    target: Symbol,
    modules: dict[str, ModuleData],
    graph: CallGraph,
    matched: dict[str, list[tuple[int, int]]],
    *,
    max_depth: int = 16,
) -> MegaCascade:
    """BFS over the rename-promotion graph starting from `target`.

    At depth D, `named_set` contains `target` plus every function
    promoted in previous depths. We find every placeholder caller
    whose promotion gate opens under the current `named_set`, add
    them to the promoted set, then extend `named_set` by the newly-
    promoted names for the next iteration.

    `max_depth` caps BFS rounds (defensive; real cascades are < 10
    deep in this corpus).
    """
    target_key: SymbolKey = (target.module, target.addr)

    # Invert graph.edges_call once for fast caller lookup.
    # callers_of[(m, a)] = set of (m', a') whose edges include (m,a).
    callers_of: dict[SymbolKey, set[SymbolKey]] = {}
    for caller_key, callees in graph.edges_call.items():
        for callee in callees:
            callers_of.setdefault(callee, set()).add(caller_key)

    named_set: set[SymbolKey] = {target_key}
    promoted_all: set[SymbolKey] = set()
    direct: set[SymbolKey] = set()
    frontier: set[SymbolKey] = {target_key}
    depth = 0

    while frontier and depth < max_depth:
        newly_promoted: set[SymbolKey] = set()
        # For each freshly-named symbol, check its callers to see
        # if any just gained their final named-callee condition.
        for nk in frontier:
            for caller_key in callers_of.get(nk, set()):
                if caller_key in promoted_all:
                    continue
                if caller_key in named_set:
                    continue
                cmod = modules.get(caller_key[0])
                if cmod is None:
                    continue
                caller = cmod.by_addr.get(caller_key[1])
                if caller is None:
                    continue
                if is_addr_matched(matched, caller.module, caller.addr):
                    continue
                caller_callees = graph.edges_call.get(caller_key, set())
                if _would_promote(
                    caller, caller_callees, named_set, modules,
                ):
                    newly_promoted.add(caller_key)
        if not newly_promoted:
            # No new promotions this round — BFS has reached
            # fixpoint. Don't count this as a "depth", it was a
            # wasted check.
            break
        depth += 1
        if depth == 1:
            direct = set(newly_promoted)
        promoted_all.update(newly_promoted)
        # The newly-promoted functions are themselves candidates to
        # be named in the next wave; add to named_set + frontier.
        named_set.update(newly_promoted)
        frontier = newly_promoted

    indirect = promoted_all - direct
    return MegaCascade(
        anchor=target,
        direct=frozenset(direct),
        indirect=frozenset(indirect),
        total=frozenset(promoted_all),
        depth=depth,
    )


def rank_mega_cascades(
    modules: dict[str, ModuleData],
    graph: CallGraph,
    matched: dict[str, list[tuple[int, int]]],
    *,
    min_weight: int = 1,
    min_depth: int = 1,
) -> list[MegaCascade]:
    """Compute mega-cascade for every placeholder function; return
    ranked list. Tie-break on (smaller size first, addr asc) so
    cheaper matches win equal-weight ties.
    """
    out: list[MegaCascade] = []
    for _mod, md in modules.items():
        for sym in md.symbols:
            if not sym.is_function:
                continue
            if sym.size == 0:
                continue
            if sym.is_named:
                continue
            mc = mega_cascade_for_target(sym, modules, graph, matched)
            if mc.weight < min_weight or mc.depth < min_depth:
                continue
            out.append(mc)
    out.sort(key=lambda m: (
        -m.weight, m.anchor.size, m.anchor.addr,
    ))
    return out


# --------------------------------------------------------------------------- #
# Rendering
# --------------------------------------------------------------------------- #

def render_ranked_markdown(
    entries: list[MegaCascade],
    *,
    version: str,
    top_n: int | None = 25,
) -> str:
    shown = entries if top_n is None else entries[:top_n]
    lines: list[str] = []
    lines.append(f"# Mega-cascade ranking — `{version}`")
    lines.append("")
    lines.append(
        "_Transitive closure of the `hard → medium` promotion "
        "graph starting from each placeholder anchor. `direct` = "
        "one-step promotions (same as `find_cascades.py`); "
        "`indirect` = promotions that fire after the directly-"
        "promoted functions are themselves named in a follow-up "
        "wave. `depth` = BFS rounds to fixpoint (1 = no "
        "mega-effect, 2+ = multi-wave cascade)._",
    )
    lines.append("")
    lines.append(
        f"**{len(entries)}** mega-cascade-producing target(s). "
        f"Showing top **{min(len(shown), len(entries))}**.",
    )
    lines.append("")
    if not shown:
        lines.append(
            "_No mega-cascades found. Pair with "
            "`tools/find_cascades.py` for the single-step view._",
        )
        return "\n".join(lines) + "\n"

    lines.append(
        "| Rank | Target | Addr | Size | Total | Direct | Indirect | Depth |",
    )
    lines.append(
        "|-----:|--------|------|-----:|------:|-------:|---------:|------:|",
    )
    for i, m in enumerate(shown, start=1):
        lines.append(
            f"| {i} | `{m.anchor.name}` | `0x{m.anchor.addr:08x}` | "
            f"0x{m.anchor.size:x} | **{m.weight}** | "
            f"{len(m.direct)} | {len(m.indirect)} | {m.depth} |",
        )
    lines.append("")
    lines.append(
        "<sub>Reading guide: a row with `Indirect > 0` means the "
        "anchor seeds a multi-wave cascade — naming it plus its "
        "directly-promoted callers unlocks further promotions. "
        "`Depth > 1` confirms. High-indirect anchors are where "
        "the real leverage lives.</sub>",
    )
    lines.append("")
    return "\n".join(lines)


def render_single_target(
    mc: MegaCascade,
    modules: dict[str, ModuleData],
) -> str:
    lines: list[str] = []
    lines.append(
        f"Mega-cascade for `{mc.anchor.name}` "
        f"({mc.anchor.module}|0x{mc.anchor.addr:08x}, "
        f"size=0x{mc.anchor.size:x}):",
    )
    lines.append(
        f"  Total promotions: **{mc.weight}** "
        f"(direct: {len(mc.direct)}, indirect: {len(mc.indirect)}, "
        f"depth: {mc.depth})",
    )
    if not mc.total:
        lines.append("  No `hard → medium` promotions would fire.")
        return "\n".join(lines)

    if mc.direct:
        lines.append("")
        lines.append("  Direct (1-step) promotions:")
        for (m, a) in sorted(mc.direct)[:10]:
            md = modules.get(m)
            sym = md.by_addr.get(a) if md else None
            name = sym.name if sym else "?"
            lines.append(f"    - `{m}|0x{a:08x}` {name}")
        if len(mc.direct) > 10:
            lines.append(f"    - … (+{len(mc.direct) - 10} more)")

    if mc.indirect:
        lines.append("")
        lines.append(
            f"  Indirect (depth-2+) promotions "
            f"({len(mc.indirect)} total):",
        )
        for (m, a) in sorted(mc.indirect)[:10]:
            md = modules.get(m)
            sym = md.by_addr.get(a) if md else None
            name = sym.name if sym else "?"
            lines.append(f"    - `{m}|0x{a:08x}` {name}")
        if len(mc.indirect) > 10:
            lines.append(f"    - … (+{len(mc.indirect) - 10} more)")
    return "\n".join(lines)


# --------------------------------------------------------------------------- #
# CLI
# --------------------------------------------------------------------------- #

def main() -> int:
    ap = argparse.ArgumentParser(
        description="Transitive-closure cascade finder.",
    )
    ap.add_argument("--version", default="eur")
    ap.add_argument(
        "module", nargs="?", default=None,
        help="Module of the target (e.g. main, ov005). "
             "Omit for ranked-all mode.",
    )
    ap.add_argument(
        "addr", nargs="?", default=None,
        help="Hex address of the target. Required with module.",
    )
    ap.add_argument(
        "--top", type=int, default=25,
        help="Top-N rows in ranked mode (default 25, 0 = no limit).",
    )
    ap.add_argument(
        "--min-depth", type=int, default=1,
        help="Filter ranked results to depth ≥ N. `--min-depth 2` "
             "surfaces only targets with indirect-cascade potential.",
    )
    ap.add_argument(
        "--out", type=Path, default=None,
        help="Write Markdown to this path (ranked mode only).",
    )
    args = ap.parse_args()

    config_dir = ROOT / "config" / args.version
    if not config_dir.is_dir():
        print(f"error: {config_dir} not found.", file=sys.stderr)
        return 2

    modules = load_all(config_dir)
    graph = build_call_graph(modules)
    matched = collect_matched_ranges(config_dir)

    # Single-symbol mode.
    if args.module is not None and args.addr is not None:
        md = modules.get(args.module)
        if md is None:
            print(
                f"error: module `{args.module}` not found.",
                file=sys.stderr,
            )
            return 2
        addr = int(args.addr, 0)
        target = md.by_addr.get(addr)
        if target is None:
            print(
                f"error: no symbol at {args.module}|0x{addr:08x}.",
                file=sys.stderr,
            )
            return 2
        mc = mega_cascade_for_target(target, modules, graph, matched)
        print(render_single_target(mc, modules))
        return 0

    # Ranked-all mode.
    entries = rank_mega_cascades(
        modules, graph, matched,
        min_depth=args.min_depth,
    )
    top_n = None if args.top == 0 else args.top
    md_text = render_ranked_markdown(
        entries, version=args.version, top_n=top_n,
    )

    # Stdout summary.
    print(
        f"Found {len(entries)} mega-cascade target(s). "
        f"Top {min(args.top if args.top > 0 else len(entries), len(entries))}:",
    )
    for i, mc in enumerate(
        entries[:args.top if args.top > 0 else len(entries)],
        start=1,
    ):
        print(
            f"  {i:>3}. {mc.anchor.module:6s} "
            f"{mc.anchor.name:30s} @ 0x{mc.anchor.addr:08x}  "
            f"total={mc.weight:3d}  direct={len(mc.direct):3d}  "
            f"indirect={len(mc.indirect):3d}  depth={mc.depth}",
        )

    out_path = args.out
    if out_path is None:
        out_dir = ROOT / "build" / args.version / "analysis"
        out_dir.mkdir(parents=True, exist_ok=True)
        out_path = out_dir / "mega_cascades.md"
    try:
        out_path.write_text(md_text, encoding="utf-8")
    except OSError as e:
        print(f"error: could not write {out_path}: {e}", file=sys.stderr)
        return 1
    print(f"\nWrote {out_path}", file=sys.stderr)
    return 0


if __name__ == "__main__":
    sys.exit(main())
