#!/usr/bin/env python3

"""
find_cascades.py — predict tier promotions from a symbol rename.

`analyze_symbols.classify` places a function in `medium` tier when
its size ≤ 0x80 AND every direct callee is already named. So a
same-size function sits in `hard` tier (not medium) for exactly one
reason: at least one of its callees is still placeholder-named.
Naming that last placeholder callee *cascades* the caller from
`hard → medium` — a real tier promotion unlocked purely by identity
work, not by extra match effort.

This tool answers two shapes of question:

1. **Per-symbol cascade**: "If I name symbol X next, how many
   functions promote tier?" Useful when the decomper is about to
   close a brief (e.g. a new BIOS thunk) and wants to estimate
   downstream leverage.

2. **Rank by cascade weight**: "Which placeholder symbol, if
   named, produces the biggest cascade?" Useful for picking the
   next rename target — the top of this list is the single highest-
   leverage identity work the project can do.

The primary cascade direction we care about is `hard → medium`
because:
  - `trivial` / `easy` / `sinit` are leaf-shape / prefix-based —
    naming a callee doesn't change those tiers.
  - `named` is identity-based, not cascade-driven.
  - `medium → named` on the promoted function itself is the natural
    follow-up, but that's a separate round of work.

Usage:

  # Cascade for a specific pending rename.
  python tools/find_cascades.py --version eur main 0x02000086

  # Top-N placeholder symbols ranked by cascade weight (default mode).
  python tools/find_cascades.py --version eur --top 20

Pairs with `tools/nitro_suggest_renames.py` — that tool proposes
names for functions; this tool tells you which of those names would
produce the biggest downstream cascade once applied.
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
from next_targets import (  # noqa: E402
    collect_matched_ranges,
    is_addr_matched,
)


# Tier-promotion rule: classify()'s `medium` gate is
# `size <= 0x80 AND all_callees_named`. The cap mirrors that.
MEDIUM_SIZE_CAP = 0x80

# Placeholder prefixes mirror analyze_symbols.Symbol.is_named —
# kept as a tuple so .startswith() is one call.
PLACEHOLDER_PREFIXES = ("func_", "data_", "_dsd_gap")


@dataclass(frozen=True)
class CascadeEntry:
    """The promotion X unlocks by being named.

    `target` is the would-be-renamed symbol.
    `promoted` is the set of (module, addr) keys that would move
    tier if `target` became named.
    `weight` is an alias for `len(promoted)` for sort convenience.
    """

    target: Symbol
    promoted: frozenset[SymbolKey]

    @property
    def weight(self) -> int:
        return len(self.promoted)


def _would_cascade_to_medium(
    caller: Symbol,
    caller_callees: set[SymbolKey],
    newly_named_callee: SymbolKey,
    modules: dict[str, ModuleData],
) -> bool:
    """Return True iff `caller` would promote `hard → medium` if
    `newly_named_callee` were named.

    Conditions (mirror classify()):
      - caller is a function in a candidate shape (not __sinit, not
        already named, not matched, size ≤ 0x80, has ≥ 1 callee)
      - newly_named_callee is actually one of its callees
      - newly_named_callee is currently placeholder-named (otherwise
        the rename is a no-op — caller is already in `medium`)
      - after naming newly_named_callee, *every* callee is named.

    `matched`-check is skipped here; the top-level rank_cascades
    applies it at the caller level before calling this helper.
    """
    if not caller.is_function:
        return False
    if caller.size == 0 or caller.size > MEDIUM_SIZE_CAP:
        return False
    if caller.name.startswith("__sinit_"):
        return False
    if caller.is_named:
        return False
    if newly_named_callee not in caller_callees:
        return False
    # If the would-be-renamed symbol is already named, the "rename"
    # is a no-op — caller tier is already whatever it is. No cascade.
    target_mod = modules.get(newly_named_callee[0])
    if target_mod is None:
        return False
    target_sym = target_mod.by_addr.get(newly_named_callee[1])
    if target_sym is None or target_sym.is_named:
        return False
    # Count currently-named callees; bump by one (newly_named_callee)
    # and test for full coverage.
    already_named = 0
    for (cm, ca) in caller_callees:
        cs = modules[cm].by_addr.get(ca)
        if cs is not None and cs.is_named:
            already_named += 1
    simulated_named = already_named + 1  # newly_named_callee becomes named
    return simulated_named >= len(caller_callees)


def cascades_for_target(
    target: Symbol,
    modules: dict[str, ModuleData],
    graph: CallGraph,
    matched: dict[str, list[tuple[int, int]]],
) -> frozenset[SymbolKey]:
    """Return the set of callers that promote hard → medium if
    `target` becomes named. Matched callers are excluded (no
    practical value in promoting an already-done caller).
    """
    target_key: SymbolKey = (target.module, target.addr)
    promoted: set[SymbolKey] = set()
    # Iterate edges_call: which callers reach `target`?
    for caller_key, callee_set in graph.edges_call.items():
        if target_key not in callee_set:
            continue
        caller_mod = modules.get(caller_key[0])
        if caller_mod is None:
            continue
        caller = caller_mod.by_addr.get(caller_key[1])
        if caller is None:
            continue
        if is_addr_matched(matched, caller.module, caller.addr):
            continue
        if _would_cascade_to_medium(
            caller, callee_set, target_key, modules,
        ):
            promoted.add(caller_key)
    return frozenset(promoted)


def rank_cascades(
    modules: dict[str, ModuleData],
    graph: CallGraph,
    matched: dict[str, list[tuple[int, int]]],
) -> list[CascadeEntry]:
    """For every placeholder-named function, compute its cascade
    and return the list sorted by weight desc. Already-named
    symbols are skipped — their cascade is zero by construction
    (no state change from renaming them again).

    Tie-break on (smaller size first, addr asc) — small targets
    are cheaper to match, so among equal-cascade candidates the
    smaller one is the better pick.
    """
    out: list[CascadeEntry] = []
    for _mod_name, md in modules.items():
        for sym in md.symbols:
            if not sym.is_function:
                continue
            if sym.size == 0:
                continue
            if sym.is_named:
                continue
            promoted = cascades_for_target(sym, modules, graph, matched)
            if not promoted:
                continue
            out.append(CascadeEntry(target=sym, promoted=promoted))
    out.sort(key=lambda e: (-e.weight, e.target.size, e.target.addr))
    return out


# --------------------------------------------------------------------------- #
# Rendering
# --------------------------------------------------------------------------- #

def render_ranked_markdown(
    entries: list[CascadeEntry],
    *,
    version: str,
    top_n: int | None = 25,
) -> str:
    shown = entries if top_n is None else entries[:top_n]
    lines: list[str] = []
    lines.append(f"# Rename-cascade ranking — `{version}`")
    lines.append("")
    lines.append(
        "_For each placeholder-named function X, counts the "
        "`hard → medium` promotions triggered by naming X. Higher "
        "= more downstream tier work unlocked per rename._",
    )
    lines.append("")
    lines.append(
        f"**{len(entries)}** target(s) produce ≥1 cascade. "
        f"Showing top **{min(len(shown), len(entries))}**.",
    )
    lines.append("")
    if not shown:
        lines.append(
            "_No cascades found. The current main tip has no "
            "placeholder-named functions whose naming would "
            "promote a size-≤0x80 caller to `medium`._",
        )
        return "\n".join(lines) + "\n"

    lines.append(
        "| Rank | Target | Addr | Size | Cascade | Promoted callers (first 5) |",
    )
    lines.append(
        "|-----:|--------|------|-----:|--------:|----------------------------|",
    )
    for i, e in enumerate(shown, start=1):
        sym = e.target
        promoted_sample = sorted(e.promoted)[:5]
        promoted_str = ", ".join(
            f"`{m}|0x{a:08x}`" for (m, a) in promoted_sample
        )
        if len(e.promoted) > 5:
            promoted_str += f", …(+{len(e.promoted) - 5})"
        lines.append(
            f"| {i} | `{sym.name}` | `0x{sym.addr:08x}` | "
            f"0x{sym.size:x} | **{e.weight}** | {promoted_str} |",
        )
    lines.append("")
    lines.append(
        "<sub>Rename hint: `python tools/rename_symbol.py "
        "<module> <addr> <NewName>`. Re-run this tool after each "
        "landing to see the cascade shift.</sub>",
    )
    lines.append("")
    return "\n".join(lines)


def render_single_target(
    target: Symbol,
    promoted: frozenset[SymbolKey],
    modules: dict[str, ModuleData],
) -> str:
    """Render the per-symbol cascade prediction (mode 1)."""
    lines: list[str] = []
    lines.append(
        f"Cascade for naming `{target.name}` "
        f"({target.module}|0x{target.addr:08x}, size=0x{target.size:x}):",
    )
    if not promoted:
        lines.append("  No `hard → medium` promotions would fire.")
        lines.append(
            "  (Either no caller is size-≤0x80, or every caller "
            "already has another placeholder-named callee blocking "
            "the promotion.)",
        )
        return "\n".join(lines)
    lines.append(f"  **{len(promoted)} caller(s)** would promote to `medium`:")
    for (m, a) in sorted(promoted):
        md = modules.get(m)
        sym = md.by_addr.get(a) if md else None
        name = sym.name if sym else "<unknown>"
        size = f"0x{sym.size:x}" if sym else "?"
        lines.append(f"    - `{m}|0x{a:08x}` {name} (size={size})")
    return "\n".join(lines)


# --------------------------------------------------------------------------- #
# CLI
# --------------------------------------------------------------------------- #

def _parse_symbol_args(
    modules: dict[str, ModuleData],
    module: str | None,
    addr_str: str | None,
) -> Symbol:
    if module is None or addr_str is None:
        raise ValueError("both <module> and <addr> are required")
    md = modules.get(module)
    if md is None:
        raise ValueError(
            f"module `{module}` not found in config; "
            f"known: {sorted(modules.keys())[:8]}…",
        )
    addr = int(addr_str, 0)
    sym = md.by_addr.get(addr)
    if sym is None:
        raise ValueError(
            f"no symbol at {module}|0x{addr:08x}. Check the exact "
            "prologue address in symbols.txt.",
        )
    return sym


def main() -> int:
    ap = argparse.ArgumentParser(
        description="Predict tier-promotion cascades from renames.",
    )
    ap.add_argument("--version", default="eur")
    ap.add_argument(
        "module", nargs="?", default=None,
        help="Module of the target to check (e.g. main, ov005). "
             "Omit for ranked-all mode.",
    )
    ap.add_argument(
        "addr", nargs="?", default=None,
        help="Address (hex) of the target to check. Required with module.",
    )
    ap.add_argument(
        "--top", type=int, default=25,
        help="Top-N rows in ranked mode (default 25; 0 = no limit).",
    )
    ap.add_argument(
        "--out", type=Path, default=None,
        help="Write the Markdown report to this path (ranked mode "
             "only; single-symbol mode always prints to stdout).",
    )
    args = ap.parse_args()

    config_dir = ROOT / "config" / args.version
    if not config_dir.is_dir():
        print(f"error: {config_dir} not found.", file=sys.stderr)
        return 2

    modules = load_all(config_dir)
    graph = build_call_graph(modules)
    matched = collect_matched_ranges(config_dir)

    # Single-symbol mode: both positional args supplied.
    if args.module is not None or args.addr is not None:
        try:
            target = _parse_symbol_args(modules, args.module, args.addr)
        except ValueError as e:
            print(f"error: {e}", file=sys.stderr)
            return 2
        promoted = cascades_for_target(target, modules, graph, matched)
        print(render_single_target(target, promoted, modules))
        return 0

    # Ranked-all mode.
    entries = rank_cascades(modules, graph, matched)
    top_n = None if args.top == 0 else args.top
    md = render_ranked_markdown(
        entries, version=args.version, top_n=top_n,
    )

    # Stdout summary.
    print(
        f"Found {len(entries)} cascade-producing target(s). "
        f"Top {min(args.top if args.top > 0 else len(entries), len(entries))}:",
    )
    for i, e in enumerate(
        entries[:args.top if args.top > 0 else len(entries)],
        start=1,
    ):
        sym = e.target
        print(
            f"  {i:>3}. {sym.module:6s} {sym.name:30s} "
            f"@ 0x{sym.addr:08x}  size=0x{sym.size:x}  "
            f"cascade={e.weight}",
        )

    # File output.
    out_path = args.out
    if out_path is None:
        out_dir = ROOT / "build" / args.version / "analysis"
        out_dir.mkdir(parents=True, exist_ok=True)
        out_path = out_dir / "cascades.md"
    try:
        out_path.write_text(md, encoding="utf-8")
    except OSError as e:
        print(f"error: could not write {out_path}: {e}", file=sys.stderr)
        return 1
    print(f"\nWrote {out_path}", file=sys.stderr)
    return 0


if __name__ == "__main__":
    sys.exit(main())
