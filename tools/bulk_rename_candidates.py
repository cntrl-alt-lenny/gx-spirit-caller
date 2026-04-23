#!/usr/bin/env python3

"""
bulk_rename_candidates.py — find placeholder functions that likely
share a just-named function's role, so the decomper can bulk-rename
N siblings in a single PR.

Complement to `tools/find_cascades.py` (PR #132):

  - `find_cascades` picks the next HIGH-LEVERAGE placeholder to
    match+name — the one that promotes the most callers.
  - `bulk_rename_candidates` (this) expands outward from an
    ALREADY-NAMED function to find other placeholders that plausibly
    share its role (`GX_LoadBG0Char` → `GX_LoadBG1Char` / sibling
    shapes), enabling N renames per brief instead of one.

Signal sources (in descending weight, none individually conclusive
— the score is a weighted sum):

  1. **Caller-set Jaccard** (primary). If `GX_Init` calls the
     anchor + N other placeholders, those N placeholders are very
     likely siblings. Strong signal — same-caller structure beats
     same-callee structure for sibling detection, because siblings
     often have distinct internal helpers but shared dispatchers.

  2. **Size similarity**. Siblings tend to compile to similar-size
     function bodies because they come from the same C template.
     A 0.7-1.3× ratio window gets most pairs; we normalize to a
     0-1 score.

  3. **Address adjacency** in the symbol table. Siblings from the
     same C file usually land contiguously in the module's `.text`
     (or at least within ~0x1000 of each other). Bonus signal, not
     required.

  4. **Same module**. Overlay-local siblings live together. Default
     restricts candidates to the anchor's module; `--cross-module`
     drops that restriction for main-runtime anchors that have
     siblings in overlays too.

The tool does NOT propose names — that's the decomper's call. It
surfaces placeholders that look like they BELONG to the same
family.

Usage:

  # Top-20 sibling candidates for a just-named function.
  python tools/bulk_rename_candidates.py --version eur main 0x02000800

  # Cross-module scan (e.g. for main-runtime anchors called from
  # overlays).
  python tools/bulk_rename_candidates.py --version eur \\
      main 0x02000800 --cross-module

  # Machine-readable.
  python tools/bulk_rename_candidates.py --version eur \\
      main 0x02000800 --json

Pairs with `tools/propagate_template.py` (#122 fix): once you've
identified the sibling SET via this tool, `propagate_template.py`
automates the per-sibling `.c` generation when their reloc
signatures match exactly.
"""

from __future__ import annotations

import argparse
import json
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
from next_targets import (  # noqa: E402
    collect_matched_ranges,
    is_addr_matched,
)


PLACEHOLDER_PREFIXES = ("func_", "data_", "_dsd_gap")

# Address-adjacency threshold (bytes). Siblings from the same C file
# compile to contiguous `.text` regions; functions within this
# window of the anchor are more likely to be siblings than distant
# ones. Not a hard filter — just a bonus.
ADJACENCY_BONUS_WINDOW = 0x1000


@dataclass(frozen=True)
class Candidate:
    symbol: Symbol
    score: float
    caller_jaccard: float
    size_ratio: float     # min/max of the two sizes; 1.0 = exact match
    is_adjacent: bool
    shared_callers: frozenset[SymbolKey]

    @property
    def sort_key(self) -> tuple[float, int, int]:
        # Primary: score desc. Secondary: smaller size first (cheaper
        # match). Tertiary: address asc for determinism.
        return (-self.score, self.symbol.size, self.symbol.addr)


def _callers_of(
    key: SymbolKey, edges_call,
) -> frozenset[SymbolKey]:
    callers = {
        caller for caller, callees in edges_call.items()
        if key in callees
    }
    return frozenset(callers)


def _jaccard(a: frozenset, b: frozenset) -> float:
    if not a and not b:
        return 0.0
    union = len(a | b)
    if union == 0:
        return 0.0
    return len(a & b) / union


def _size_similarity(a: int, b: int) -> float:
    """Return min/max size ratio, 0-1. Exact size match = 1.0,
    double-size candidate = 0.5, etc. Zero-size edge case returns 0
    (shouldn't happen — size-0 symbols filter out earlier)."""
    if a <= 0 or b <= 0:
        return 0.0
    return min(a, b) / max(a, b)


def score_candidate(
    anchor: Symbol,
    anchor_callers: frozenset[SymbolKey],
    cand: Symbol,
    cand_callers: frozenset[SymbolKey],
) -> tuple[float, float, float, bool, frozenset[SymbolKey]]:
    """Weighted sum. Returns (score, jaccard, size_ratio,
    is_adjacent, shared_callers)."""
    jaccard = _jaccard(anchor_callers, cand_callers)
    size_ratio = _size_similarity(anchor.size, cand.size)
    is_adjacent = (
        cand.module == anchor.module
        and abs(cand.addr - anchor.addr) <= ADJACENCY_BONUS_WINDOW
    )
    shared = anchor_callers & cand_callers

    # Weights picked to keep the score roughly in 0-1 range.
    # Caller-Jaccard dominates because same-caller structure is the
    # strongest sibling signal in practice.
    score = (
        0.6 * jaccard
        + 0.3 * size_ratio
        + (0.1 if is_adjacent else 0.0)
    )
    return score, jaccard, size_ratio, is_adjacent, shared


def find_candidates(
    anchor: Symbol,
    modules: dict[str, ModuleData],
    graph: CallGraph,
    matched: dict[str, list[tuple[int, int]]],
    *,
    cross_module: bool = False,
    min_score: float = 0.1,
    max_candidates: int = 50,
) -> list[Candidate]:
    """Score every placeholder function against the anchor and
    return the top-K candidates above `min_score`. Skips matched
    functions (no value in "bulk renaming" something already in a
    complete TU).

    `cross_module=False` restricts the scan to the anchor's module
    by default. Overlay-local siblings are the common case;
    main-runtime anchors that dispatch to overlays (rare) would
    want `--cross-module`.
    """
    anchor_key: SymbolKey = (anchor.module, anchor.addr)
    anchor_callers = _callers_of(anchor_key, graph.edges_call)

    out: list[Candidate] = []
    for mod_name, md in modules.items():
        if not cross_module and mod_name != anchor.module:
            continue
        for sym in md.symbols:
            if not sym.is_function:
                continue
            if sym.size == 0:
                continue
            if sym.addr == anchor.addr and sym.module == anchor.module:
                continue  # self
            if sym.is_named:
                continue  # only placeholders are rename targets
            if is_addr_matched(matched, sym.module, sym.addr):
                continue
            cand_key: SymbolKey = (sym.module, sym.addr)
            cand_callers = _callers_of(cand_key, graph.edges_call)
            score, jaccard, size_ratio, is_adj, shared = score_candidate(
                anchor, anchor_callers, sym, cand_callers,
            )
            if score < min_score:
                continue
            out.append(Candidate(
                symbol=sym, score=score,
                caller_jaccard=jaccard,
                size_ratio=size_ratio,
                is_adjacent=is_adj,
                shared_callers=shared,
            ))
    out.sort(key=lambda c: c.sort_key)
    return out[:max_candidates]


def render_text_report(
    anchor: Symbol,
    candidates: list[Candidate],
    *,
    max_shared_callers: int = 3,
) -> str:
    """Plain-text stdout-friendly report. Markdown-rendered via
    `--json` → `jq` pipeline if the caller wants to embed in a
    comment."""
    lines: list[str] = []
    lines.append(
        f"Sibling candidates for `{anchor.name}` "
        f"({anchor.module}|0x{anchor.addr:08x}, "
        f"size=0x{anchor.size:x}):",
    )
    if not candidates:
        lines.append("  No placeholder siblings above threshold.")
        lines.append(
            "  (Try --cross-module, or lower --min-score.)",
        )
        return "\n".join(lines)

    lines.append(f"  Found {len(candidates)} candidate(s):")
    lines.append("")
    lines.append(
        "    Score  Caller-J   Size-R  Adj  Module  Addr          Name",
    )
    lines.append("    -----  --------   ------  ---  ------  ------------  ----")
    for c in candidates:
        adj_flag = " ✓ " if c.is_adjacent else "   "
        lines.append(
            f"    {c.score:.2f}    {c.caller_jaccard:.2f}       "
            f"{c.size_ratio:.2f}    {adj_flag}  "
            f"{c.symbol.module:6s}  0x{c.symbol.addr:08x}  "
            f"{c.symbol.name}",
        )
    lines.append("")

    # A short "shared callers" digest for the top-1 — helps the
    # decomper eyeball the signal source.
    if candidates:
        top = candidates[0]
        if top.shared_callers:
            lines.append(
                f"Top candidate's shared callers "
                f"(sample, up to {max_shared_callers}):",
            )
            for (m, a) in sorted(top.shared_callers)[:max_shared_callers]:
                lines.append(f"  - `{m}|0x{a:08x}`")
            if len(top.shared_callers) > max_shared_callers:
                extra = len(top.shared_callers) - max_shared_callers
                lines.append(f"  - … (+{extra} more)")
    return "\n".join(lines)


def render_json(
    anchor: Symbol, candidates: list[Candidate],
) -> str:
    payload = {
        "anchor": {
            "module": anchor.module,
            "addr": anchor.addr,
            "name": anchor.name,
            "size": anchor.size,
        },
        "candidates": [
            {
                "module": c.symbol.module,
                "addr": c.symbol.addr,
                "name": c.symbol.name,
                "size": c.symbol.size,
                "score": round(c.score, 4),
                "caller_jaccard": round(c.caller_jaccard, 4),
                "size_ratio": round(c.size_ratio, 4),
                "is_adjacent": c.is_adjacent,
                "shared_callers": [
                    [m, a] for (m, a) in sorted(c.shared_callers)
                ],
            }
            for c in candidates
        ],
    }
    return json.dumps(payload, indent=2)


def main() -> int:
    ap = argparse.ArgumentParser(
        description="Find placeholder siblings of a named function.",
    )
    ap.add_argument("--version", default="eur")
    ap.add_argument(
        "module", help="Module of the anchor (e.g. main, ov005).",
    )
    ap.add_argument(
        "addr", help="Address (hex) of the anchor — must be a "
                     "NAMED function.",
    )
    ap.add_argument(
        "--cross-module", action="store_true",
        help="Scan all modules, not just the anchor's. Default is "
             "same-module (overlay-local siblings are the common "
             "case).",
    )
    ap.add_argument(
        "--min-score", type=float, default=0.1,
        help="Floor on candidate score (default 0.1). Below 0.1 is "
             "usually noise; try 0.3+ for tighter candidate sets.",
    )
    ap.add_argument(
        "--top", type=int, default=20,
        help="Max candidates returned (default 20).",
    )
    ap.add_argument(
        "--json", action="store_true",
        help="Emit JSON instead of plain-text report.",
    )
    args = ap.parse_args()

    config_dir = ROOT / "config" / args.version
    if not config_dir.is_dir():
        print(f"error: {config_dir} not found.", file=sys.stderr)
        return 2

    modules = load_all(config_dir)
    graph = build_call_graph(modules)
    matched = collect_matched_ranges(config_dir)

    md = modules.get(args.module)
    if md is None:
        print(
            f"error: module `{args.module}` not found. "
            f"Known: {sorted(modules.keys())[:8]}…",
            file=sys.stderr,
        )
        return 2
    addr = int(args.addr, 0)
    anchor = md.by_addr.get(addr)
    if anchor is None:
        print(
            f"error: no symbol at {args.module}|0x{addr:08x}.",
            file=sys.stderr,
        )
        return 2
    if not anchor.is_function:
        print(
            f"error: {anchor.name} is not a function "
            f"({anchor.type}).",
            file=sys.stderr,
        )
        return 2
    if not anchor.is_named:
        print(
            f"error: anchor {anchor.name} is a placeholder. "
            "This tool expands outward from an ALREADY-NAMED "
            "function. If you wanted cascade leverage for a "
            "placeholder, use `tools/find_cascades.py` instead.",
            file=sys.stderr,
        )
        return 2

    candidates = find_candidates(
        anchor, modules, graph, matched,
        cross_module=args.cross_module,
        min_score=args.min_score,
        max_candidates=args.top,
    )

    if args.json:
        print(render_json(anchor, candidates))
    else:
        print(render_text_report(anchor, candidates))
    return 0


if __name__ == "__main__":
    sys.exit(main())
