#!/usr/bin/env python3

"""
bulk_data_candidates.py — find placeholder data symbols that likely
share a just-named data symbol's role, so the decomper can bulk-rename
N data siblings in a single PR.

The data-tier analogue of `tools/bulk_rename_candidates.py` (#153 +
#216):

  - `bulk_rename_candidates` expands outward from an already-named
    FUNCTION to find sibling functions.
  - `bulk_data_candidates` (this) does the same for an already-named
    DATA symbol — `BuildInfo` → adjacent header fields, `OS_HeapStart`
    → other heap-state pointers, `gMainGfx` → other framebuffer
    pointers, etc.

Pairs with `tools/data_worklist.py` (which RANKS unnamed data by
reader density without an anchor) and `tools/data_symbol_sizes.py`
(which infers data extents from address gaps).

Signal sources (in descending weight, none individually conclusive
— the score is a weighted sum):

  1. **Reader-set Jaccard** (primary, w=0.50). Two data symbols
     read by the same set of functions are very likely the same
     "thing" exported under different addresses (e.g. parallel
     fields of a global struct, sibling entries in a table).

  2. **Reader-module Jaccard** (w=0.20). Coarser-grained: when two
     data symbols are read by the same SET OF MODULES (even if
     different functions inside them), they're likely peers in a
     widely-shared SDK structure. This is the data-tier analogue
     of bulk_rename_candidates' reloc-signature signal — a
     "shape" discriminator that complements the raw reader set.

  3. **Inferred-size ratio** (w=0.20). Data-symbol sizes aren't
     stored in `symbols.txt`; we infer them as the gap to the
     next symbol at a higher address (same algorithm as
     `data_symbol_sizes.py`). Two data symbols with similar
     inferred extents are more likely siblings than a 4-byte
     int + 0x400-byte table.

  4. **Address adjacency** (w=0.10). Data siblings from the same C
     source land contiguously in `.bss` / `.data` / `.rodata`.
     Bonus signal, not required.

The tool does NOT propose names — that's the decomper's call. It
surfaces placeholders that look like they BELONG to the same data
family.

Usage:

  # Top-20 data sibling candidates for a just-named anchor.
  python tools/bulk_data_candidates.py --version eur main 0x02000b68

  # Cross-module scan (e.g. for main-runtime data anchors that
  # have peers in overlays).
  python tools/bulk_data_candidates.py --version eur \\
      main 0x02000b68 --cross-module

  # Machine-readable.
  python tools/bulk_data_candidates.py --version eur \\
      main 0x02000b68 --json
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
from data_symbol_sizes import infer_per_module  # noqa: E402
from next_targets import (  # noqa: E402
    collect_matched_ranges,
    is_addr_matched,
)


PLACEHOLDER_PREFIXES = ("func_", "data_", "_dsd_gap")

# Address-adjacency threshold (bytes). Data siblings from the same C
# source land contiguously; symbols within this window are more
# likely peers than distant ones. Smaller than the function-tier
# value because data sections pack tighter.
ADJACENCY_BONUS_WINDOW = 0x400


# Scoring weights. Sum to 1.0 so the headline score stays in 0-1.
#
# Mirrors `bulk_rename_candidates._W_*` shape (caller-graph signal
# dominates, plus a "shape" discriminator + size + adjacency), with
# reader-MODULE-Jaccard standing in for the function tier's
# reloc-signature signal — both are "coarser shape" discriminators
# that complement the raw caller/reader set.
_W_READER_JACCARD = 0.50
_W_READER_MODULE_JACCARD = 0.20
_W_SIZE_RATIO = 0.20
_W_ADJACENCY = 0.10


@dataclass(frozen=True)
class Candidate:
    symbol: Symbol
    score: float
    reader_jaccard: float
    # Coarser-grained reader signal: Jaccard over the SET OF
    # READER MODULES rather than the set of reader functions.
    # 0.0 when neither side has readers.
    reader_module_jaccard: float
    size_ratio: float          # min/max of inferred sizes; 1.0 = match
    is_adjacent: bool
    shared_readers: frozenset[SymbolKey]
    # Inferred sizes (bytes) of anchor + candidate, kept in the
    # candidate so the JSON renderer can surface them. None when the
    # symbol is the last in its module (no upper anchor).
    anchor_inferred_size: int | None
    cand_inferred_size: int | None

    @property
    def sort_key(self) -> tuple[float, int, int]:
        # Primary: score desc. Secondary: smaller (inferred) size
        # first — cheaper for the decomper to start with.
        # Tertiary: address asc for determinism.
        size = self.cand_inferred_size or 0
        return (-self.score, size, self.symbol.addr)


def _readers_of(
    key: SymbolKey, edges_load,
) -> frozenset[SymbolKey]:
    readers = {
        reader for reader, data_keys in edges_load.items()
        if key in data_keys
    }
    return frozenset(readers)


def _jaccard(a: frozenset, b: frozenset) -> float:
    if not a and not b:
        return 0.0
    union = len(a | b)
    if union == 0:
        return 0.0
    return len(a & b) / union


def _size_similarity(a: int | None, b: int | None) -> float:
    """min/max of two inferred sizes. 0.0 when either side has no
    inferred extent (last symbol in module) — no signal."""
    if a is None or b is None:
        return 0.0
    if a <= 0 or b <= 0:
        return 0.0
    return min(a, b) / max(a, b)


def _reader_modules(readers: frozenset[SymbolKey]) -> frozenset[str]:
    return frozenset(m for (m, _a) in readers)


def score_candidate(
    anchor: Symbol,
    anchor_readers: frozenset[SymbolKey],
    anchor_inferred_size: int | None,
    cand: Symbol,
    cand_readers: frozenset[SymbolKey],
    cand_inferred_size: int | None,
) -> tuple[float, float, float, float, bool, frozenset[SymbolKey]]:
    """Weighted sum over 4 signals. Returns (score, reader_jaccard,
    reader_module_jaccard, size_ratio, is_adjacent, shared_readers).

    Weights in `_W_*` constants; sum to 1.0 so the headline score
    stays in 0-1 range regardless of which signals fire."""
    reader_jac = _jaccard(anchor_readers, cand_readers)
    rm_jac = _jaccard(
        _reader_modules(anchor_readers),
        _reader_modules(cand_readers),
    )
    size_ratio = _size_similarity(anchor_inferred_size, cand_inferred_size)
    is_adjacent = (
        cand.module == anchor.module
        and abs(cand.addr - anchor.addr) <= ADJACENCY_BONUS_WINDOW
    )
    shared = anchor_readers & cand_readers

    score = (
        _W_READER_JACCARD * reader_jac
        + _W_READER_MODULE_JACCARD * rm_jac
        + _W_SIZE_RATIO * size_ratio
        + (_W_ADJACENCY if is_adjacent else 0.0)
    )
    return score, reader_jac, rm_jac, size_ratio, is_adjacent, shared


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
    """Score every placeholder data symbol against the anchor and
    return the top-K candidates above `min_score`. Skips matched
    symbols (already inside a complete TU).

    `cross_module=False` restricts the scan to the anchor's module
    by default. Most data siblings are overlay-local; main-runtime
    SDK tables that are mirrored across overlays would want
    `--cross-module`."""
    anchor_key: SymbolKey = (anchor.module, anchor.addr)
    anchor_readers = _readers_of(anchor_key, graph.edges_load)

    # Pre-compute inferred-size tables per module on demand.
    # `infer_per_module` is O(N log N) per module; cache to avoid
    # recomputing once per candidate.
    sizes_cache: dict[str, dict[int, int | None]] = {}

    def _sizes(module: str) -> dict[int, int | None]:
        if module not in sizes_cache:
            md = modules.get(module)
            sizes_cache[module] = (
                infer_per_module(md.symbols) if md else {}
            )
        return sizes_cache[module]

    anchor_inferred_size = _sizes(anchor.module).get(anchor.addr)

    out: list[Candidate] = []
    for mod_name, md in modules.items():
        if not cross_module and mod_name != anchor.module:
            continue
        sizes_for_mod = _sizes(mod_name)
        for sym in md.symbols:
            if sym.is_function:
                continue
            if sym.addr == anchor.addr and sym.module == anchor.module:
                continue  # self
            if sym.is_named:
                continue  # only placeholders are rename targets
            if is_addr_matched(matched, sym.module, sym.addr):
                continue
            cand_key: SymbolKey = (sym.module, sym.addr)
            cand_readers = _readers_of(cand_key, graph.edges_load)
            cand_inferred_size = sizes_for_mod.get(sym.addr)
            score, reader_jac, rm_jac, size_ratio, is_adj, shared = (
                score_candidate(
                    anchor, anchor_readers, anchor_inferred_size,
                    sym, cand_readers, cand_inferred_size,
                )
            )
            if score < min_score:
                continue
            out.append(Candidate(
                symbol=sym, score=score,
                reader_jaccard=reader_jac,
                reader_module_jaccard=rm_jac,
                size_ratio=size_ratio,
                is_adjacent=is_adj,
                shared_readers=shared,
                anchor_inferred_size=anchor_inferred_size,
                cand_inferred_size=cand_inferred_size,
            ))
    out.sort(key=lambda c: c.sort_key)
    return out[:max_candidates]


def _fmt_size(n: int | None) -> str:
    if n is None:
        return "?"
    return f"0x{n:x}"


def render_text_report(
    anchor: Symbol,
    candidates: list[Candidate],
    *,
    max_shared_readers: int = 3,
) -> str:
    lines: list[str] = []
    anchor_size = (
        candidates[0].anchor_inferred_size
        if candidates else None
    )
    lines.append(
        f"Data sibling candidates for `{anchor.name}` "
        f"({anchor.module}|0x{anchor.addr:08x}, "
        f"inferred size={_fmt_size(anchor_size)}):",
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
        "    Score  Reader-J  ReadMod-J  Size-R  Adj  Module  Addr          Size    Name",
    )
    lines.append(
        "    -----  --------  ---------  ------  ---  ------  ------------  ------  ----",
    )
    for c in candidates:
        adj_flag = " ✓ " if c.is_adjacent else "   "
        lines.append(
            f"    {c.score:.2f}    {c.reader_jaccard:.2f}      "
            f"{c.reader_module_jaccard:.2f}       "
            f"{c.size_ratio:.2f}    {adj_flag}  "
            f"{c.symbol.module:6s}  0x{c.symbol.addr:08x}  "
            f"{_fmt_size(c.cand_inferred_size):6s}  "
            f"{c.symbol.name}",
        )
    lines.append("")

    # Shared-readers digest for the top-1 candidate.
    if candidates:
        top = candidates[0]
        if top.shared_readers:
            lines.append(
                f"Top candidate's shared readers "
                f"(sample, up to {max_shared_readers}):",
            )
            for (m, a) in sorted(top.shared_readers)[:max_shared_readers]:
                lines.append(f"  - `{m}|0x{a:08x}`")
            if len(top.shared_readers) > max_shared_readers:
                extra = len(top.shared_readers) - max_shared_readers
                lines.append(f"  - … (+{extra} more)")
    return "\n".join(lines)


def render_json(
    anchor: Symbol, candidates: list[Candidate],
) -> str:
    anchor_size = (
        candidates[0].anchor_inferred_size
        if candidates else None
    )
    payload = {
        "anchor": {
            "module": anchor.module,
            "addr": anchor.addr,
            "name": anchor.name,
            "inferred_size": anchor_size,
        },
        "candidates": [
            {
                "module": c.symbol.module,
                "addr": c.symbol.addr,
                "name": c.symbol.name,
                "inferred_size": c.cand_inferred_size,
                "score": round(c.score, 4),
                "reader_jaccard": round(c.reader_jaccard, 4),
                "reader_module_jaccard": round(
                    c.reader_module_jaccard, 4,
                ),
                "size_ratio": round(c.size_ratio, 4),
                "is_adjacent": c.is_adjacent,
                "shared_readers": [
                    [m, a] for (m, a) in sorted(c.shared_readers)
                ],
            }
            for c in candidates
        ],
    }
    return json.dumps(payload, indent=2)


def main() -> int:
    ap = argparse.ArgumentParser(
        description="Find placeholder siblings of a named data symbol.",
    )
    ap.add_argument("--version", default="eur")
    ap.add_argument(
        "module", help="Module of the anchor (e.g. main, ov005).",
    )
    ap.add_argument(
        "addr", help="Address (hex) of the anchor — must be a "
                     "NAMED data symbol.",
    )
    ap.add_argument(
        "--cross-module", action="store_true",
        help="Scan all modules, not just the anchor's. Default is "
             "same-module (overlay-local data siblings are the common "
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
    if anchor.is_function:
        print(
            f"error: {anchor.name} is a function, not data. Use "
            "`tools/bulk_rename_candidates.py` for function siblings.",
            file=sys.stderr,
        )
        return 2
    if not anchor.is_named:
        print(
            f"error: anchor {anchor.name} is a placeholder. "
            "This tool expands outward from an ALREADY-NAMED data "
            "symbol. If you wanted to rank unnamed data by reader "
            "density, use `tools/data_worklist.py` instead.",
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
