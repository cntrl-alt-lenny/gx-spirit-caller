#!/usr/bin/env python3

"""
data_worklist.py — rank unmatched data symbols by reference density.

The data tier is still 0% matched (per `progress.py`). Unlike
functions, which `next_targets.py` / `analyze_symbols.py` already
tier and queue, data symbols don't have a clear ordering. Decomping
`data_020b4320` nets nothing if it's referenced from one leaf; the
same byte count on a widely-referenced table unblocks a whole
cluster of callers that read it.

This tool closes that gap:

  1. Loads every `config/<ver>/**/symbols.txt` via `analyze_symbols`.
  2. Builds the load-edge graph (reader function → data symbol).
  3. For each data symbol still in placeholder form (`data_*`):
     - `in_degree_load`: how many distinct reader functions touch it
     - `reader_modules`: how many distinct modules contain readers
       (cross-module density = SDK-like data worth naming first)
     - `size` (0 if extent is unknown)
     - `matched`: whether the enclosing TU is already `complete`
  4. Ranks unmatched entries by
     (cross-module readers desc, total readers desc, size desc).
  5. Emits a Markdown worklist + stdout summary.

The "cross-module" signal matters: data touched by 5+ overlays is
almost certainly a fundamental SDK table (TEGs, heap state,
framebuffer pointers, …). Names for those generally come from the
NitroSDK headers, so the decomper can batch-rename a wide cluster
in one pass.

Usage:

  python tools/data_worklist.py --version eur
  python tools/data_worklist.py --version eur --module main --top 20
  python tools/data_worklist.py --version eur --min-readers 5 --out worklist.md

Pairs with `tools/nitro_suggest_renames.py` (which suggests names
for function symbols) — this is the data-side companion.
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
    build_call_graph,
    load_all,
)
from next_targets import (  # noqa: E402
    collect_matched_ranges,
    is_addr_matched,
)


# Placeholder prefix for unnamed data symbols. dsd emits two shapes:
#   data_020b4320         (main / itcm / dtcm)
#   data_ov005_021cabcd   (overlays)
# Both start with `data_`; one `startswith` covers both.
DATA_PLACEHOLDER_PREFIX = "data_"


# --------------------------------------------------------------------------- #
# Ranking
# --------------------------------------------------------------------------- #

@dataclass
class DataEntry:
    """One ranked data symbol."""

    symbol: Symbol
    reader_count: int                       # distinct reader functions
    reader_modules: frozenset[str]          # distinct reader modules
    matched: bool                           # enclosing TU is `complete`

    @property
    def cross_module_readers(self) -> int:
        return len(self.reader_modules)

    @property
    def sort_key(self) -> tuple[int, int, int]:
        # Primary sort: cross-module density (higher = more fundamental).
        # Secondary: raw reader count. Tertiary: size (prefer knowable
        # extents over 0-size `data(any)`). All descending → negate.
        return (
            -self.cross_module_readers,
            -self.reader_count,
            -self.symbol.size,
        )


def _load_readers_index(
    graph: CallGraph,
) -> dict[tuple[str, int], set[tuple[str, int]]]:
    """Invert `graph.edges_load` to `data_key -> set of reader_keys`.

    `edges_load` stores reader → {data} forward edges; for ranking
    by data-side popularity we need the reverse direction once, so
    this builds and returns a lookup table."""
    by_datum: dict[tuple[str, int], set[tuple[str, int]]] = {}
    for reader, data_keys in graph.edges_load.items():
        for datum in data_keys:
            by_datum.setdefault(datum, set()).add(reader)
    return by_datum


def rank_data_symbols(
    modules: dict[str, ModuleData],
    graph: CallGraph,
    matched: dict[str, list[tuple[int, int]]],
    *,
    include_named: bool = False,
    min_readers: int = 1,
    module_filter: str | None = None,
) -> list[DataEntry]:
    """Build the ranked DataEntry list.

    By default surfaces only placeholder-named, unmatched data
    symbols with at least `min_readers` reader functions. Pass
    `include_named=True` to also show already-renamed data (useful
    for auditing coverage). `module_filter` restricts to one module.
    """
    readers_of = _load_readers_index(graph)
    out: list[DataEntry] = []
    for mod_name, md in modules.items():
        if module_filter is not None and mod_name != module_filter:
            continue
        for sym in md.symbols:
            if sym.type != "data":
                continue
            if not include_named and not sym.name.startswith(
                DATA_PLACEHOLDER_PREFIX,
            ):
                continue
            is_matched = is_addr_matched(matched, sym.module, sym.addr)
            if is_matched:
                # Skip matched unless caller opts in via include_named
                # (which doubles as "show everything"). Matched data
                # isn't in the worklist — it's done.
                continue
            readers = readers_of.get((sym.module, sym.addr), set())
            if len(readers) < min_readers:
                continue
            reader_mods = frozenset(r[0] for r in readers)
            out.append(DataEntry(
                symbol=sym,
                reader_count=len(readers),
                reader_modules=reader_mods,
                matched=is_matched,
            ))
    out.sort(key=lambda e: e.sort_key)
    return out


# --------------------------------------------------------------------------- #
# Rendering
# --------------------------------------------------------------------------- #

def render_markdown(
    entries: list[DataEntry],
    *,
    version: str,
    total_data_symbols: int,
    matched_data_count: int,
    top_n: int | None = None,
    module_filter: str | None = None,
    min_readers: int = 1,
) -> str:
    """Render the Markdown worklist. Caller decides the output path."""
    shown = entries if top_n is None else entries[:top_n]

    lines: list[str] = []
    lines.append(f"# Data-symbol worklist — `{version}`")
    lines.append("")
    lines.append(
        "_Ranked by cross-module reader density (higher = more "
        "fundamental; good first-rename candidates). Re-run after "
        "any data-symbol rename or new `dsd apply`._",
    )
    lines.append("")
    filters = []
    if module_filter is not None:
        filters.append(f"module=`{module_filter}`")
    filters.append(f"min_readers={min_readers}")
    if top_n is not None:
        filters.append(f"top={top_n}")
    lines.append("**Filters applied:** " + ", ".join(filters))
    lines.append("")
    lines.append(
        f"**Corpus:** {total_data_symbols} total data symbols, of which "
        f"**{matched_data_count} matched** "
        f"({100.0 * matched_data_count / max(total_data_symbols, 1):.2f}%). "
        f"Worklist below shows **{len(entries)} unmatched** "
        f"placeholder-named data symbols with ≥{min_readers} reader(s).",
    )
    lines.append("")

    if not shown:
        lines.append(
            "_No entries match the current filters. Try "
            "`--min-readers 1` or drop `--module`._",
        )
        lines.append("")
        return "\n".join(lines)

    # Cross-module density histogram — handy for estimating how
    # much leverage the top slice actually carries.
    density_bins: dict[int, int] = {}
    for e in entries:
        density_bins[e.cross_module_readers] = (
            density_bins.get(e.cross_module_readers, 0) + 1
        )
    lines.append("## Cross-module reader distribution")
    lines.append("")
    lines.append("| Modules referencing | # data symbols |")
    lines.append("|--------------------:|---------------:|")
    for bucket in sorted(density_bins.keys(), reverse=True):
        lines.append(f"| {bucket} | {density_bins[bucket]} |")
    lines.append("")

    # The ranked worklist.
    lines.append(
        "## Ranked worklist"
        + (f" (top {top_n})" if top_n is not None and top_n < len(entries)
           else ""),
    )
    lines.append("")
    lines.append(
        "| # | Module | Name | Addr | Size | Readers | Cross-mod | Reader modules |"
    )
    lines.append(
        "|--:|--------|------|------|-----:|--------:|----------:|----------------|"
    )
    for i, e in enumerate(shown, start=1):
        sym = e.symbol
        size_str = f"0x{sym.size:x}" if sym.size else "_any_"
        # Cap displayed reader modules at 6 to keep rows readable;
        # the count column already carries the full cardinality.
        mods = sorted(e.reader_modules)
        if len(mods) > 6:
            mods_str = ", ".join(mods[:6]) + f", …(+{len(mods) - 6})"
        else:
            mods_str = ", ".join(mods)
        lines.append(
            f"| {i} | `{sym.module}` | `{sym.name}` | "
            f"`0x{sym.addr:08x}` | {size_str} | {e.reader_count} | "
            f"{e.cross_module_readers} | {mods_str} |",
        )
    lines.append("")

    lines.append(
        "<sub>Rename hint: `python tools/rename_symbol.py <module> "
        "<addr> <NewName>`. Cross-module candidates likely come from "
        "the NitroSDK header tree; a `libs/nitro/` adoption pass "
        "would batch-name many at once.</sub>",
    )
    lines.append("")
    return "\n".join(lines)


def render_stdout_summary(
    entries: list[DataEntry],
    *,
    total_data_symbols: int,
    matched_data_count: int,
    top_n: int,
) -> None:
    matched_pct = 100.0 * matched_data_count / max(total_data_symbols, 1)
    print(
        f"Data symbols: {total_data_symbols} total, "
        f"{matched_data_count} matched ({matched_pct:.2f}%), "
        f"{len(entries)} unmatched w/ readers in worklist.",
    )
    print(f"Top {min(top_n, len(entries))} by cross-module density:")
    for i, e in enumerate(entries[:top_n], start=1):
        sym = e.symbol
        print(
            f"  {i:>3}. {sym.module:6s} {sym.name:30s} "
            f"@ 0x{sym.addr:08x}  readers={e.reader_count:3d}  "
            f"xmod={e.cross_module_readers}",
        )


# --------------------------------------------------------------------------- #
# CLI
# --------------------------------------------------------------------------- #

def main() -> int:
    ap = argparse.ArgumentParser(
        description="Rank unmatched data symbols by reference density.",
    )
    ap.add_argument(
        "--version", default="eur",
        help="Config subdirectory (default: eur).",
    )
    ap.add_argument(
        "--module", default=None,
        help="Restrict to a single module (e.g. main, ov005).",
    )
    ap.add_argument(
        "--min-readers", type=int, default=1,
        help="Skip data symbols with fewer than this many distinct "
             "reader functions (default 1). 1-reader data is usually "
             "a module-local table; cross-module data has at least 2.",
    )
    ap.add_argument(
        "--top", type=int, default=25,
        help="Limit stdout + Markdown to top N entries (default 25). "
             "Pass 0 for no limit.",
    )
    ap.add_argument(
        "--include-named", action="store_true",
        help="Include already-renamed data symbols too. Useful for "
             "auditing data-tier coverage; default is placeholder-"
             "only.",
    )
    ap.add_argument(
        "--out", type=Path, default=None,
        help="Write the Markdown report to this file (default: "
             "build/<ver>/analysis/data_worklist.md).",
    )
    ap.add_argument(
        "--no-outputs", action="store_true",
        help="Skip the Markdown file; stdout summary only.",
    )
    args = ap.parse_args()

    config_dir = ROOT / "config" / args.version
    if not config_dir.is_dir():
        print(f"error: {config_dir} not found.", file=sys.stderr)
        return 2

    modules = load_all(config_dir)
    graph = build_call_graph(modules)
    matched = collect_matched_ranges(config_dir)

    # Global totals for the "N of M matched" header — independent
    # of whatever filters the caller passed. Counts placeholder +
    # named alike so the percentage is honest.
    total_data = 0
    matched_data = 0
    for md in modules.values():
        for sym in md.symbols:
            if sym.type != "data":
                continue
            total_data += 1
            if is_addr_matched(matched, sym.module, sym.addr):
                matched_data += 1

    entries = rank_data_symbols(
        modules, graph, matched,
        include_named=args.include_named,
        min_readers=args.min_readers,
        module_filter=args.module,
    )

    top_n = None if args.top == 0 else args.top
    render_stdout_summary(
        entries,
        total_data_symbols=total_data,
        matched_data_count=matched_data,
        top_n=args.top if args.top > 0 else max(len(entries), 1),
    )

    if args.no_outputs:
        return 0

    out_path = args.out
    if out_path is None:
        out_dir = ROOT / "build" / args.version / "analysis"
        out_dir.mkdir(parents=True, exist_ok=True)
        out_path = out_dir / "data_worklist.md"
    try:
        out_path.write_text(render_markdown(
            entries,
            version=args.version,
            total_data_symbols=total_data,
            matched_data_count=matched_data,
            top_n=top_n,
            module_filter=args.module,
            min_readers=args.min_readers,
        ), encoding="utf-8")
    except OSError as e:
        print(f"error: could not write {out_path}: {e}", file=sys.stderr)
        return 1
    print(f"\nWrote {out_path}", file=sys.stderr)
    return 0


if __name__ == "__main__":
    sys.exit(main())
