#!/usr/bin/env python3

"""
find_callsites.py — show callers, callees, and data references for a symbol.

The "look up everything that touches X" question comes up constantly
during decomp. Existing options:

  - `analyze_symbols.py` writes the full graph to graph.json, but
    that's a 5MB blob you have to grep through.
  - The objdiff TUI shows nearby calls but only within a single TU.
  - dsd's `show` is closer but doesn't go bidirectional in one shot.

This is a small CLI that takes a single symbol identifier and dumps
the three things the decomper needs:

  1. CALLERS — every (module, addr) that BL's into this function.
     Useful when guessing the function's role from how it's called.
  2. CALLEES — every (module, addr) this function BL's out to.
     Useful for picking a draft signature and for spotting "all
     callees already named" easy targets.
  3. LOADS — every data symbol this function reads via a load reloc.
     Useful for guessing which globals/structs to model first.

Symbol can be specified by `module addr` pair or by name:

    python tools/find_callsites.py --version eur main 0x02000800
    python tools/find_callsites.py --version eur Entry

If a name matches more than one symbol (rare — usually only `func_*`
placeholders collide across modules), all matches are listed and the
caller is asked to disambiguate with `module addr`.

Output is plain text by default; `--json` switches to a machine-
readable form for scripting.

`--caller-depth N` walks up to N hops through the caller tree
(default 1 = direct only). Useful when the direct callers are
themselves placeholder-named — a second or third hop often brings
in a named symbol that tells you what the function is for. Output
is deduplicated per hop: a function never appears at two depths,
the shallowest wins.

    # Two hops of callers for signature inference.
    python tools/find_callsites.py --version eur \\
        ov006 0x021ba1f0 --caller-depth 2
"""

from __future__ import annotations

import argparse
import json
import sys
from dataclasses import dataclass, field
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from analyze_symbols import (  # noqa: E402
    ROOT,
    ModuleData,
    Symbol,
    SymbolKey,
    build_call_graph,
    load_all,
)


# --------------------------------------------------------------------------- #
# Resolution
# --------------------------------------------------------------------------- #

@dataclass(frozen=True)
class ResolvedSymbol:
    module: str
    addr: int
    symbol: Symbol

    @property
    def key(self) -> SymbolKey:
        return (self.module, self.addr)


def _parse_addr(s: str) -> int | None:
    s = s.strip()
    try:
        if s.startswith(("0x", "0X")):
            return int(s, 16)
        return int(s, 16) if any(c in s for c in "abcdefABCDEF") else int(s)
    except ValueError:
        return None


def resolve_by_module_addr(
    modules: dict[str, ModuleData], module: str, addr: int,
) -> ResolvedSymbol | None:
    md = modules.get(module)
    if md is None:
        return None
    sym = md.by_addr.get(addr)
    if sym is None:
        # Try enclosing lookup so an addr inside a function body still
        # resolves to that function.
        sym = md.enclosing_function(addr)
    if sym is None:
        return None
    return ResolvedSymbol(module=sym.module, addr=sym.addr, symbol=sym)


def resolve_by_name(
    modules: dict[str, ModuleData], name: str,
) -> list[ResolvedSymbol]:
    out: list[ResolvedSymbol] = []
    for md in modules.values():
        for s in md.symbols:
            if s.name == name:
                out.append(ResolvedSymbol(module=s.module, addr=s.addr, symbol=s))
    return out


# --------------------------------------------------------------------------- #
# Cross-reference
# --------------------------------------------------------------------------- #

@dataclass
class Refs:
    callers: list[ResolvedSymbol]
    callees: list[ResolvedSymbol]
    loads: list[ResolvedSymbol]
    # Loads whose dest didn't resolve to a known symbol (mid-data,
    # or a symbol pruned during dsd's analysis).
    unresolved_loads: list[tuple[str, int]]
    # Depth-2+ caller expansion. `caller_hops[0]` = depth-2 (callers
    # of the direct callers), `caller_hops[1]` = depth-3, and so on.
    # Empty list when `caller_depth=1` (default). Dedup'd against
    # earlier hops and the target itself so a function never appears
    # at two depths — the shallowest wins.
    caller_hops: list[list[ResolvedSymbol]] = field(default_factory=list)


def _callers_of_key(
    target_key: SymbolKey,
    modules: dict[str, ModuleData],
    graph_edges_call: dict[SymbolKey, set[SymbolKey]],
) -> list[ResolvedSymbol]:
    """Return ResolvedSymbols of every caller that BL's into
    `target_key`. Skips unresolved keys."""
    out: list[ResolvedSymbol] = []
    for caller_key, callees in graph_edges_call.items():
        if target_key not in callees:
            continue
        cm, ca = caller_key
        md = modules.get(cm)
        if md is None:
            continue
        sym = md.by_addr.get(ca)
        if sym is None:
            continue
        out.append(ResolvedSymbol(module=cm, addr=ca, symbol=sym))
    out.sort(key=lambda r: (r.module, r.addr))
    return out


def collect_refs(
    target: ResolvedSymbol,
    modules: dict[str, ModuleData],
    graph_edges_call: dict[SymbolKey, set[SymbolKey]],
    graph_edges_load: dict[SymbolKey, set[SymbolKey]],
    *,
    caller_depth: int = 1,
) -> Refs:
    """Walk the resolved graph for the target's bidirectional refs.

    `caller_depth` controls how far up the caller tree to expand:
      - 1 (default): just the direct callers (backwards-compatible).
      - 2+: BFS up to N hops, populating `caller_hops`. Useful when
        the direct callers are themselves placeholder-named, and a
        second hop brings real-named context into view.
    """
    callers = _callers_of_key(
        target.key, modules, graph_edges_call,
    )

    # Callees are unchanged — no depth expansion here. Signature
    # inference reads caller argument patterns, so the asymmetry
    # between callers and callees is deliberate.
    callees: list[ResolvedSymbol] = []
    for callee_key in graph_edges_call.get(target.key, set()):
        cm, ca = callee_key
        md = modules.get(cm)
        if md is None:
            continue
        sym = md.by_addr.get(ca)
        if sym is None:
            continue
        callees.append(ResolvedSymbol(module=cm, addr=ca, symbol=sym))
    callees.sort(key=lambda r: (r.module, r.addr))

    loads: list[ResolvedSymbol] = []
    unresolved: list[tuple[str, int]] = []
    for load_key in graph_edges_load.get(target.key, set()):
        lm, la = load_key
        md = modules.get(lm)
        if md is None:
            unresolved.append(load_key)
            continue
        sym = md.by_addr.get(la)
        if sym is None:
            unresolved.append(load_key)
            continue
        loads.append(ResolvedSymbol(module=lm, addr=la, symbol=sym))
    loads.sort(key=lambda r: (r.module, r.addr))
    unresolved.sort()

    caller_hops = _expand_caller_hops(
        target, callers, modules, graph_edges_call, caller_depth,
    )

    return Refs(
        callers=callers, callees=callees,
        loads=loads, unresolved_loads=unresolved,
        caller_hops=caller_hops,
    )


def _expand_caller_hops(
    target: ResolvedSymbol,
    direct_callers: list[ResolvedSymbol],
    modules: dict[str, ModuleData],
    graph_edges_call: dict[SymbolKey, set[SymbolKey]],
    caller_depth: int,
) -> list[list[ResolvedSymbol]]:
    """BFS upward from `direct_callers` up to `caller_depth` hops.
    Returns hops[0] = depth-2, hops[1] = depth-3, etc.

    Each level is dedup'd against (target, all earlier levels, the
    current level itself) so a symbol that's both a direct caller
    AND reached via another caller only appears once, at the
    shallowest depth.
    """
    if caller_depth <= 1:
        return []

    visited: set[SymbolKey] = {target.key}
    for r in direct_callers:
        visited.add(r.key)

    hops: list[list[ResolvedSymbol]] = []
    frontier = direct_callers
    for _ in range(caller_depth - 1):
        next_level: list[ResolvedSymbol] = []
        for caller in frontier:
            for upstream in _callers_of_key(
                caller.key, modules, graph_edges_call,
            ):
                if upstream.key in visited:
                    continue
                visited.add(upstream.key)
                next_level.append(upstream)
        next_level.sort(key=lambda r: (r.module, r.addr))
        hops.append(next_level)
        if not next_level:
            break
        frontier = next_level
    return hops


# --------------------------------------------------------------------------- #
# Output
# --------------------------------------------------------------------------- #

def _fmt_sym(r: ResolvedSymbol) -> str:
    s = r.symbol
    size = f"0x{s.size:x}" if s.size else "?"
    return f"{r.module}|0x{r.addr:08x}  size={size:<6s}  {s.name}"


def print_text(target: ResolvedSymbol, refs: Refs) -> None:
    s = target.symbol
    size_s = f"0x{s.size:x}" if s.size else "?"
    print(f"Target: {target.module}|0x{target.addr:08x}  "
          f"size={size_s}  {s.name}  ({s.type}, {s.mode})")
    print()

    print(f"Callers ({len(refs.callers)}):")
    if not refs.callers:
        print("  (none — leaf, dead, or only reachable via tail-call gap)")
    for r in refs.callers:
        print(f"  {_fmt_sym(r)}")
    print()

    # Deeper caller hops — each level labelled with its depth + count.
    for i, level in enumerate(refs.caller_hops):
        depth = i + 2
        print(f"Callers ({depth} hops, {len(level)}):")
        if not level:
            print(f"  (none new at depth {depth} — caller subtree "
                  "closed or fully dedup'd against earlier hops)")
        for r in level:
            print(f"  {_fmt_sym(r)}")
        print()

    print(f"Callees ({len(refs.callees)}):")
    if not refs.callees:
        print("  (none — leaf function)")
    for r in refs.callees:
        print(f"  {_fmt_sym(r)}")
    print()

    print(f"Loads ({len(refs.loads)} resolved, "
          f"{len(refs.unresolved_loads)} unresolved):")
    if not refs.loads and not refs.unresolved_loads:
        print("  (none — function does not load any data via reloc)")
    for r in refs.loads:
        print(f"  {_fmt_sym(r)}")
    for lm, la in refs.unresolved_loads:
        print(f"  {lm}|0x{la:08x}  size=?       <unresolved>")


def to_json(target: ResolvedSymbol, refs: Refs) -> dict:
    def _as(r: ResolvedSymbol) -> dict:
        s = r.symbol
        return {
            "module": r.module,
            "addr": f"0x{r.addr:08x}",
            "name": s.name,
            "size": s.size,
            "type": s.type,
            "mode": s.mode,
        }
    return {
        "target": _as(target),
        "callers": [_as(r) for r in refs.callers],
        "caller_hops": [
            [_as(r) for r in level] for level in refs.caller_hops
        ],
        "callees": [_as(r) for r in refs.callees],
        "loads": [_as(r) for r in refs.loads],
        "unresolved_loads": [
            {"module": lm, "addr": f"0x{la:08x}"}
            for lm, la in refs.unresolved_loads
        ],
    }


# --------------------------------------------------------------------------- #
# CLI
# --------------------------------------------------------------------------- #

def main() -> int:
    ap = argparse.ArgumentParser(
        description="Show callers/callees/loads for a symbol.",
    )
    ap.add_argument("--version", default="eur",
                    help="Game version (eur/usa/jpn)")
    ap.add_argument("--json", action="store_true",
                    help="Emit JSON instead of plain text")
    ap.add_argument(
        "--caller-depth", type=int, default=1, metavar="N",
        help="Walk N hops up the caller tree (default 1 = direct only). "
             "Useful when direct callers are placeholder-named and a "
             "deeper hop brings real-named context into view. Capped "
             "at 5 to avoid graph-wide expansion.",
    )
    # Positional spec: either `module addr` or `name`. Validated below.
    ap.add_argument("ident", nargs="+",
                    help="Either `<module> <addr>` (e.g. main 0x02000800) "
                         "or a single symbol name (e.g. Entry)")
    args = ap.parse_args()

    if args.caller_depth < 1:
        print("error: --caller-depth must be >= 1.", file=sys.stderr)
        return 2
    if args.caller_depth > 5:
        print("error: --caller-depth > 5 is rejected — the graph fans "
              "out fast and the output stops being useful. Lower it or "
              "run at depth 5 and inspect the output first.",
              file=sys.stderr)
        return 2

    config_dir = ROOT / "config" / args.version
    if not config_dir.is_dir():
        print(
            f"error: {config_dir} not found. "
            f"Run `python tools/configure.py {args.version}` first.",
            file=sys.stderr,
        )
        return 2

    modules = load_all(config_dir)
    graph = build_call_graph(modules)

    matches: list[ResolvedSymbol] = []
    if len(args.ident) == 2:
        module = args.ident[0]
        addr = _parse_addr(args.ident[1])
        if addr is None:
            print(f"error: addr `{args.ident[1]}` is not parseable as int "
                  f"(use 0x... or hex digits).", file=sys.stderr)
            return 2
        r = resolve_by_module_addr(modules, module, addr)
        if r is not None:
            matches = [r]
    elif len(args.ident) == 1:
        matches = resolve_by_name(modules, args.ident[0])
    else:
        print("error: pass either `<module> <addr>` or `<name>`.",
              file=sys.stderr)
        return 2

    if not matches:
        print(f"error: no symbol matched `{' '.join(args.ident)}`.",
              file=sys.stderr)
        return 1

    if len(matches) > 1:
        print(f"error: name `{args.ident[0]}` matched {len(matches)} symbols. "
              f"Disambiguate with `<module> <addr>`:", file=sys.stderr)
        for r in matches:
            print(f"  {r.module} 0x{r.addr:08x}  ({r.symbol.name})",
                  file=sys.stderr)
        return 1

    target = matches[0]
    refs = collect_refs(
        target, modules,
        graph.edges_call, graph.edges_load,
        caller_depth=args.caller_depth,
    )

    if args.json:
        json.dump(to_json(target, refs), sys.stdout, indent=2)
        sys.stdout.write("\n")
    else:
        print_text(target, refs)
    return 0


if __name__ == "__main__":
    sys.exit(main())
