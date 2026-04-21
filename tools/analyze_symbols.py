#!/usr/bin/env python3

"""
analyze_symbols.py — call-graph + decomp-target analyzer for ds-decomp projects.

Reads every config/<version>/arm9/**/symbols.txt and relocs.txt, cross-
references each reloc with its calling and called function, builds a call
graph, and emits:

  - stdout summary: per-module stats, named-symbol breakdown, call-graph
    metrics (leaf/orphan counts, in/out-degree distribution)
  - build/<version>/analysis/graph.json: full serialized call graph
  - build/<version>/analysis/targets.md: prioritised decomp target list
    (Trivial / Easy / __sinit bulk / Named / Medium / Hard tiers)

Rerun after any symbols.txt rename or new `dsd apply` — it reads only the
current on-disk state, so output always reflects the latest config.

Usage:
    python tools/analyze_symbols.py [--version eur] [--no-outputs] [--limit N]
"""

from __future__ import annotations

import argparse
import json
import re
import sys
from collections import defaultdict
from dataclasses import dataclass, field
from pathlib import Path


ROOT = Path(__file__).resolve().parent.parent

# Per CLAUDE.md — the three modules currently failing `dsd check modules`.
# Functions in these modules are higher-risk first targets because layout
# drift may break the match independent of the function's correctness.
FAILING_MODULES: set[str] = {"main", "dtcm", "ov004"}

# Reloc kinds that represent a control-flow edge (caller → callee).
CALL_RELOC_KINDS: set[str] = {
    "arm_call",
    "thumb_call",
    "arm_call_thumb",
    "thumb_call_arm",
}
# Reloc kinds that represent a data reference (reader → datum).
LOAD_RELOC_KINDS: set[str] = {"load"}

# Line formats in config/<ver>/**/symbols.txt, e.g.
#   Entry         kind:function(arm,size=0x13c) addr:0x02000800
#   data_020b4320 kind:data(any)                addr:0x020b4320
SYMBOL_RE = re.compile(
    r"^(?P<name>\S+)\s+kind:(?P<type>\w+)\((?P<attrs>[^)]*)\)\s+addr:0x(?P<addr>[0-9a-fA-F]+)"
)

# Line format in config/<ver>/**/relocs.txt, e.g.
#   from:0x02000814 kind:arm_call to:0x02000a78 module:main
#   from:0x021aa4cc kind:load     to:0x021b1d4c module:overlay(5)
RELOC_RE = re.compile(
    r"from:0x(?P<src>[0-9a-fA-F]+)\s+kind:(?P<kind>\w+)\s+to:0x(?P<dest>[0-9a-fA-F]+)\s+module:(?P<module>\S+)"
)


# --------------------------------------------------------------------------- #
# Data model
# --------------------------------------------------------------------------- #

@dataclass
class Symbol:
    """A single entry from a symbols.txt file."""

    name: str
    module: str          # "main" / "itcm" / "dtcm" / "ov000" ... "ov023"
    addr: int
    size: int            # 0 for data(any) symbols with unknown extent
    type: str            # "function" / "data"
    mode: str            # "arm" / "thumb" for functions; "any" for data

    @property
    def is_function(self) -> bool:
        return self.type == "function"

    @property
    def is_named(self) -> bool:
        # dsd init emits `func_<addr>` / `func_<ov>_<addr>` / `data_<addr>` /
        # `data_<ov>_<addr>` for unnamed entries. `_dsd_gap_*` are gap units.
        # __sinit_ names are dsd-synthetic too (static initializer shells),
        # but we count them as "named" — they're categorized on sight.
        placeholder_prefixes = ("func_", "data_", "_dsd_gap")
        return not self.name.startswith(placeholder_prefixes)

    @property
    def end_addr(self) -> int:
        return self.addr + self.size

    @property
    def is_failing_module(self) -> bool:
        return self.module in FAILING_MODULES


@dataclass
class Reloc:
    """A single entry from a relocs.txt file, plus the source module
    (implied by which file the line came from)."""

    src_addr: int
    src_module: str
    dest_addr: int
    dest_module: str     # normalized: "main"/"itcm"/"dtcm"/"ovNNN"
    kind: str


@dataclass
class ModuleData:
    """Parsed contents of one module's symbols.txt + relocs.txt, plus
    the derived lookup structures used by the analyzer."""

    name: str
    symbols: list[Symbol] = field(default_factory=list)
    relocs: list[Reloc] = field(default_factory=list)

    # addr -> Symbol (entry-point lookup; exact match)
    by_addr: dict[int, Symbol] = field(default_factory=dict)

    # symbols sorted by addr for range-binsearch (mid-function lookup)
    by_addr_sorted: list[Symbol] = field(default_factory=list)

    def enclosing_function(self, addr: int) -> Symbol | None:
        """Find the function whose address range contains `addr`, or
        None if `addr` isn't inside any known function in this module.
        Uses binary search over self.by_addr_sorted."""
        import bisect
        # bisect_right gives us the index after the last symbol with
        # addr <= target; the candidate is the one before it.
        idx = bisect.bisect_right([s.addr for s in self.by_addr_sorted], addr) - 1
        if idx < 0:
            return None
        cand = self.by_addr_sorted[idx]
        if not cand.is_function or cand.size == 0:
            return None
        if cand.addr <= addr < cand.end_addr:
            return cand
        return None


# --------------------------------------------------------------------------- #
# Parsing
# --------------------------------------------------------------------------- #

def parse_module_destination(raw: str) -> str:
    """Normalize reloc `module:` values to short keys used elsewhere.

    Examples:
        "main"        -> "main"
        "itcm"        -> "itcm"
        "dtcm"        -> "dtcm"
        "overlay(5)"  -> "ov005"
        "overlay(23)" -> "ov023"
    """
    if raw.startswith("overlay(") and raw.endswith(")"):
        n = int(raw[len("overlay("):-1])
        return f"ov{n:03d}"
    return raw


def parse_symbols_file(path: Path, module: str) -> list[Symbol]:
    """Parse one symbols.txt into a list of Symbol objects.
    Silently returns [] if the file doesn't exist."""
    if not path.is_file():
        return []
    out: list[Symbol] = []
    with path.open() as f:
        for line in f:
            line = line.rstrip()
            if not line or line.startswith("#"):
                continue
            m = SYMBOL_RE.match(line)
            if not m:
                continue
            attrs = m["attrs"]
            mode = "any"
            size = 0
            # `function(arm,size=0x13c)` vs `data(any)`.
            for part in attrs.split(","):
                part = part.strip()
                if part.startswith("size=0x"):
                    size = int(part[len("size=0x"):], 16)
                elif part in ("arm", "thumb", "any"):
                    mode = part
            out.append(Symbol(
                name=m["name"],
                module=module,
                addr=int(m["addr"], 16),
                size=size,
                type=m["type"],
                mode=mode,
            ))
    return out


def parse_relocs_file(path: Path, src_module: str) -> list[Reloc]:
    """Parse one relocs.txt into a list of Reloc objects.
    Silently returns [] if the file doesn't exist."""
    if not path.is_file():
        return []
    out: list[Reloc] = []
    with path.open() as f:
        for line in f:
            line = line.rstrip()
            if not line or line.startswith("#"):
                continue
            m = RELOC_RE.match(line)
            if not m:
                continue
            out.append(Reloc(
                src_addr=int(m["src"], 16),
                src_module=src_module,
                dest_addr=int(m["dest"], 16),
                dest_module=parse_module_destination(m["module"]),
                kind=m["kind"],
            ))
    return out


def discover_modules(config_root: Path) -> list[str]:
    """Enumerate every module's short name by walking config_root.

    Returns a list like ["main", "itcm", "dtcm", "ov000", ..., "ov023"]
    in a stable, deterministic order (main, itcm, dtcm, then overlays
    sorted numerically)."""
    names: list[str] = []
    arm9 = config_root / "arm9"
    if (arm9 / "symbols.txt").is_file():
        names.append("main")
    if (arm9 / "itcm" / "symbols.txt").is_file():
        names.append("itcm")
    if (arm9 / "dtcm" / "symbols.txt").is_file():
        names.append("dtcm")
    overlays_dir = arm9 / "overlays"
    if overlays_dir.is_dir():
        ovs = sorted(
            p.name for p in overlays_dir.iterdir()
            if p.is_dir() and p.name.startswith("ov") and (p / "symbols.txt").is_file()
        )
        names.extend(ovs)
    return names


def load_all(config_root: Path) -> dict[str, ModuleData]:
    """Load and index every module under config_root. Returns a
    {module_name: ModuleData} dict with all lookup structures populated."""
    arm9 = config_root / "arm9"
    # Map a short module name to its (symbols, relocs) file paths.
    def paths_for(name: str) -> tuple[Path, Path]:
        if name == "main":
            return arm9 / "symbols.txt", arm9 / "relocs.txt"
        if name in ("itcm", "dtcm"):
            return arm9 / name / "symbols.txt", arm9 / name / "relocs.txt"
        return (
            arm9 / "overlays" / name / "symbols.txt",
            arm9 / "overlays" / name / "relocs.txt",
        )

    out: dict[str, ModuleData] = {}
    for name in discover_modules(config_root):
        sym_path, rel_path = paths_for(name)
        symbols = parse_symbols_file(sym_path, name)
        relocs = parse_relocs_file(rel_path, name)
        by_addr = {s.addr: s for s in symbols}
        by_addr_sorted = sorted(symbols, key=lambda s: s.addr)
        out[name] = ModuleData(
            name=name,
            symbols=symbols,
            relocs=relocs,
            by_addr=by_addr,
            by_addr_sorted=by_addr_sorted,
        )
    return out


# --------------------------------------------------------------------------- #
# Call graph
# --------------------------------------------------------------------------- #

# A SymbolKey is (module, addr) — globally unique across the whole project.
SymbolKey = tuple[str, int]


@dataclass
class CallGraph:
    """Resolved adjacency structure over all Symbols.

    edges_call[caller_key] -> set of callee keys
    edges_load[reader_key] -> set of data keys referenced
    in_degree_call / out_degree_call / in_degree_load / out_degree_load:
        cached per-node counts (call edges and load edges kept separate).
    unresolved_calls: relocs whose dest_addr didn't map to any known
        function (e.g. calls into gap units, cross-overlay-swap dead-ends).
    """

    edges_call: dict[SymbolKey, set[SymbolKey]] = field(default_factory=lambda: defaultdict(set))
    edges_load: dict[SymbolKey, set[SymbolKey]] = field(default_factory=lambda: defaultdict(set))
    unresolved_calls: list[Reloc] = field(default_factory=list)
    unresolved_loads: list[Reloc] = field(default_factory=list)

    def in_degree_call(self, key: SymbolKey) -> int:
        # Recomputed lazily — cheap enough for ~45k edges and avoids
        # keeping a second dict in sync with edges_call.
        return sum(1 for callees in self.edges_call.values() if key in callees)

    def out_degree_call(self, key: SymbolKey) -> int:
        return len(self.edges_call.get(key, ()))

    def all_in_degrees_call(self) -> dict[SymbolKey, int]:
        """Single-pass in-degree table (avoids O(N*E) when scoring every node)."""
        counts: dict[SymbolKey, int] = defaultdict(int)
        for callees in self.edges_call.values():
            for k in callees:
                counts[k] += 1
        return counts


def build_call_graph(modules: dict[str, ModuleData]) -> CallGraph:
    """For every reloc in every module, resolve src_addr and dest_addr
    to enclosing symbols and add an edge to the CallGraph. Relocs whose
    endpoints don't resolve go into the unresolved_* lists."""
    graph = CallGraph()

    for _src_mod_name, src_mod in modules.items():
        for r in src_mod.relocs:
            # Caller: addr -> enclosing function in its own module. Load
            # relocs often originate inside functions too, so we treat
            # caller lookup the same way for both call and load kinds.
            caller = src_mod.enclosing_function(r.src_addr)
            if caller is None:
                # Source lives in a gap/data/unaligned region — rare but
                # possible; we can't attribute the edge to a function.
                if r.kind in CALL_RELOC_KINDS:
                    graph.unresolved_calls.append(r)
                elif r.kind in LOAD_RELOC_KINDS:
                    graph.unresolved_loads.append(r)
                continue

            caller_key: SymbolKey = (caller.module, caller.addr)

            # Callee/datum: exact entry match is the common case (BL targets
            # the function prologue); fall back to enclosing_function for
            # loads that land mid-data and for tail-calls into gap units.
            dest_mod = modules.get(r.dest_module)
            if dest_mod is None:
                # Destination module not loaded (shouldn't happen for
                # config/eur, but guard anyway).
                if r.kind in CALL_RELOC_KINDS:
                    graph.unresolved_calls.append(r)
                else:
                    graph.unresolved_loads.append(r)
                continue

            callee = dest_mod.by_addr.get(r.dest_addr)
            if callee is None and r.kind in CALL_RELOC_KINDS:
                # BL to a non-prologue address — exit-branch into a
                # sibling function (tail call). Record the containing
                # function if there is one, else unresolved.
                callee = dest_mod.enclosing_function(r.dest_addr)
            if callee is None:
                if r.kind in CALL_RELOC_KINDS:
                    graph.unresolved_calls.append(r)
                else:
                    graph.unresolved_loads.append(r)
                continue

            callee_key: SymbolKey = (callee.module, callee.addr)

            if r.kind in CALL_RELOC_KINDS:
                graph.edges_call[caller_key].add(callee_key)
            elif r.kind in LOAD_RELOC_KINDS:
                graph.edges_load[caller_key].add(callee_key)
            # else: link_time_const and other rarer kinds — ignore for now.

    return graph


# --------------------------------------------------------------------------- #
# Target tiering
# --------------------------------------------------------------------------- #

@dataclass
class Target:
    """A single decomp candidate with enough context to pick and justify it."""

    symbol: Symbol
    tier: str            # "trivial" / "easy" / "sinit" / "named" / "medium" / "hard"
    reason: str          # human-readable justification
    callees_named: int   # count of direct callees that already have real names
    callees_total: int   # count of direct callees overall


TIER_ORDER: list[str] = ["trivial", "easy", "sinit", "named", "medium", "hard"]


def classify(symbol: Symbol, graph: CallGraph, modules: dict[str, ModuleData]) -> Target | None:
    """Assign a tier to a single symbol, or return None if it's not a
    decomp candidate (data, gap, assembler local label, zero-size).

    Tiers:
      trivial - leaf, size <= 4, passing module (likely `bx lr`)
      easy    - leaf, size <= 0x20, passing module
      sinit   - any `__sinit_*` (bulk opportunity, 51 of them)
      named   - already has a real name (BIOS thunk, Entry, main, etc.)
                but not yet trivial/easy/sinit
      medium  - size <= 0x80, all direct callees already named, passing module
      hard    - everything else (or anything in a failing module)
    """
    if not symbol.is_function:
        return None
    if symbol.size == 0:
        # _unk placeholders from --allow-unknown-function-calls; not a
        # picking target - they need structural fixes first.
        return None
    if symbol.name.startswith(".L_"):
        # Assembler local labels inside other functions - not a decomp
        # unit on their own.
        return None

    key: SymbolKey = (symbol.module, symbol.addr)
    callees = graph.edges_call.get(key, set())
    out_deg = len(callees)
    callees_named = 0
    for (cm, ca) in callees:
        cs = modules[cm].by_addr.get(ca)
        if cs is not None and cs.is_named:
            callees_named += 1

    is_leaf = out_deg == 0
    all_callees_named = out_deg > 0 and callees_named == out_deg

    # Tier hierarchy: identity wins over shape (named > trivial), and
    # __sinit_* is a distinct bulk category. The failing-module flag is
    # advisory (noted in `reason`), not a gate - individual small-function
    # bodies don't drift; only cross-module relocs do, and those live in
    # their own callsites.
    fail_note = f"  [NB: {symbol.module} module checksum failing]" if symbol.is_failing_module else ""

    if symbol.name.startswith("__sinit_"):
        tier = "sinit"
        reason = f"CodeWarrior static init template (size=0x{symbol.size:x}){fail_note}"
    elif symbol.is_named:
        tier = "named"
        reason = f"already named ({symbol.name}){fail_note}"
    elif is_leaf and symbol.size <= 0x4:
        tier = "trivial"
        reason = f"leaf, {symbol.size}B - likely `bx lr` or SWI stub{fail_note}"
    elif is_leaf and symbol.size <= 0x20:
        tier = "easy"
        reason = f"leaf, {symbol.size}B, no outgoing calls{fail_note}"
    elif symbol.size <= 0x80 and all_callees_named:
        tier = "medium"
        reason = f"{symbol.size}B, all {out_deg} callees already named{fail_note}"
    else:
        tier = "hard"
        if out_deg > 0 and callees_named == 0:
            reason = f"{out_deg} callees, none named yet{fail_note}"
        else:
            reason = f"{symbol.size}B, {callees_named}/{out_deg} callees named{fail_note}"

    return Target(
        symbol=symbol,
        tier=tier,
        reason=reason,
        callees_named=callees_named,
        callees_total=out_deg,
    )


def rank_targets(modules: dict[str, ModuleData], graph: CallGraph) -> list[Target]:
    """Classify every function symbol and return the resulting list,
    sorted easiest-first: (tier rank asc, size asc, address asc)."""
    targets: list[Target] = []
    for mod in modules.values():
        for sym in mod.symbols:
            t = classify(sym, graph, modules)
            if t is not None:
                targets.append(t)
    targets.sort(key=lambda t: (
        TIER_ORDER.index(t.tier),
        t.symbol.size,
        t.symbol.addr,
    ))
    return targets


# --------------------------------------------------------------------------- #
# Bulk groups
#
# A bulk group is a cluster of functions sharing the same (module, size).
# If enough functions share those two attributes in a single module, they
# are almost certainly emitted from the same CodeWarrior template — match
# one, paste the pattern across the rest. Examples in this game:
#
#   * 51 `__sinit_*` static initializers (mostly size=0x2c) across 15
#     overlays — see libs/runtime/README.md.
#   * Small `bx lr` vtable-default stubs (size=0x2 or 0x4) repeated at
#     the head of several overlays.
#
# Leverage score = count / size. More functions in the group and smaller
# each = better bang for the buck (match cost roughly scales with size,
# payoff scales with count).
# --------------------------------------------------------------------------- #

MIN_BULK_COUNT = 4


@dataclass
class BulkGroup:
    """Functions sharing the same (module, size)."""

    module: str
    size: int
    members: list[Symbol]  # sorted by address

    @property
    def count(self) -> int:
        return len(self.members)

    @property
    def leverage(self) -> float:
        return self.count / self.size if self.size > 0 else 0.0

    @property
    def is_failing_module(self) -> bool:
        return self.module in FAILING_MODULES

    @property
    def addr_first(self) -> int:
        return self.members[0].addr

    @property
    def addr_last(self) -> int:
        return self.members[-1].addr

    @property
    def all_sinit(self) -> bool:
        return all(s.name.startswith("__sinit_") for s in self.members)

    @property
    def all_placeholder(self) -> bool:
        return all(not s.is_named for s in self.members)


def _name_family(name: str) -> str:
    """Coarse-grained name family for bulk bucketing.

    Returns "__sinit" for CodeWarrior static initializers (so they
    cluster cleanly even when generic `func_*` symbols share their
    size), and "" for everything else (which keeps generic
    `(module, size)` grouping intact for bx-lr stubs, vtable defaults,
    etc.). Extend this if other distinctive prefixes surface.
    """
    if name.startswith("__sinit_"):
        return "__sinit"
    return ""


def find_bulk_groups(modules: dict[str, ModuleData], min_count: int = MIN_BULK_COUNT) -> list[BulkGroup]:
    """Cluster every function by (module, size, name-family) and return
    groups with at least `min_count` members, sorted by leverage desc.

    The name-family dimension keeps `__sinit_*` in its own bucket per
    overlay, so a cluster isn't diluted by unrelated `func_*` symbols
    that happen to share the same size."""
    buckets: dict[tuple[str, int, str], list[Symbol]] = defaultdict(list)
    for mod in modules.values():
        for s in mod.symbols:
            if not s.is_function:
                continue
            if s.size == 0:
                # _unk placeholders — can't template-match something of
                # unknown size.
                continue
            if s.name.startswith(".L_"):
                # Assembler local labels aren't real function entries.
                continue
            buckets[(s.module, s.size, _name_family(s.name))].append(s)

    groups: list[BulkGroup] = []
    for (module, size, _family), members in buckets.items():
        if len(members) < min_count:
            continue
        members_sorted = sorted(members, key=lambda s: s.addr)
        groups.append(BulkGroup(module=module, size=size, members=members_sorted))
    # Highest leverage first; tiebreak on count desc, then smaller size.
    groups.sort(key=lambda g: (-g.leverage, -g.count, g.size))
    return groups


def find_sinit_summary(modules: dict[str, ModuleData]) -> dict[str, list[tuple[int, int]]]:
    """Per-overlay size distribution of `__sinit_*` symbols.

    Unlike find_bulk_groups, this ignores MIN_BULK_COUNT — even a lone
    __sinit is useful information because the 51 across 15 overlays
    form a single logical bulk opportunity (CodeWarrior emits them all
    from one template). Returned shape:
        {module: [(size, count), ...]} sorted by count desc then size.
    """
    per_module: dict[str, dict[int, int]] = defaultdict(lambda: defaultdict(int))
    for mod in modules.values():
        for s in mod.symbols:
            if s.is_function and s.name.startswith("__sinit_") and s.size > 0:
                per_module[s.module][s.size] += 1
    out: dict[str, list[tuple[int, int]]] = {}
    for module, sizes in per_module.items():
        out[module] = sorted(sizes.items(), key=lambda kv: (-kv[1], kv[0]))
    return out


# --------------------------------------------------------------------------- #
# Output
# --------------------------------------------------------------------------- #

def print_summary(
    modules: dict[str, ModuleData],
    graph: CallGraph,
    targets: list[Target],
    groups: list[BulkGroup],
) -> None:
    """Human-readable summary: per-module counts, graph metrics, tier
    breakdown, and a preview of the top few rows per tier."""
    from collections import Counter

    total_syms = sum(len(m.symbols) for m in modules.values())
    total_fns = sum(1 for m in modules.values() for s in m.symbols if s.is_function)
    total_named = sum(1 for m in modules.values() for s in m.symbols if s.is_named and s.is_function)

    print(f"Modules        : {len(modules)}")
    print(f"Total symbols  : {total_syms}")
    print(f"Functions      : {total_fns}  ({total_named} named, "
          f"{total_fns - total_named} placeholder)")
    print()

    print("Per-module function counts:")
    for name, mod in modules.items():
        fns = sum(1 for s in mod.symbols if s.is_function)
        named = sum(1 for s in mod.symbols if s.is_function and s.is_named)
        mark = "FAIL" if name in FAILING_MODULES else "ok  "
        print(f"  [{mark}] {name:<8s} {fns:>5d} fns  ({named} named)")
    print()

    call_edges = sum(len(s) for s in graph.edges_call.values())
    load_edges = sum(len(s) for s in graph.edges_load.values())
    print("Call graph:")
    print(f"  call edges (unique)  : {call_edges}")
    print(f"  load edges (unique)  : {load_edges}")
    print(f"  unresolved calls     : {len(graph.unresolved_calls)}")
    print(f"  unresolved loads     : {len(graph.unresolved_loads)}")
    print()

    tier_counts = Counter(t.tier for t in targets)
    print("Decomp target tiers:")
    for tier in TIER_ORDER:
        print(f"  {tier:<8s}: {tier_counts.get(tier, 0):>5d}")
    print()

    print("Top candidates per tier:")
    for tier in TIER_ORDER:
        rows = [t for t in targets if t.tier == tier][:3]
        if not rows:
            continue
        print(f"\n  [{tier}]")
        for t in rows:
            s = t.symbol
            print(f"    {s.module}:{s.name:<40s} 0x{s.addr:08x}  "
                  f"size=0x{s.size:<4x}  {t.reason}")

    print()
    total_members = sum(g.count for g in groups)
    print(f"Bulk candidate groups : {len(groups)}  ({total_members} functions)")
    if groups:
        print("Top 5 by leverage (count / size):")
        for g in groups[:5]:
            fail_tag = "  [FAIL module]" if g.is_failing_module else ""
            sinit_tag = "  __sinit" if g.all_sinit else ""
            print(
                f"  {g.module:<6s}  size=0x{g.size:<4x}  "
                f"count={g.count:<3d}  leverage={g.leverage:6.3f}"
                f"{sinit_tag}{fail_tag}"
            )


def write_graph_json(path: Path, modules: dict[str, ModuleData], graph: CallGraph) -> None:
    """Serialize the full graph to JSON with hex-formatted addresses."""
    path.parent.mkdir(parents=True, exist_ok=True)

    def sym_dict(s: Symbol) -> dict:
        return {
            "name": s.name,
            "module": s.module,
            "addr": f"0x{s.addr:08x}",
            "size": f"0x{s.size:x}",
            "type": s.type,
            "mode": s.mode,
        }

    def edge_list(d: dict[SymbolKey, set[SymbolKey]]) -> list[dict]:
        out = []
        for (src_mod, src_addr), callees in d.items():
            for (dst_mod, dst_addr) in callees:
                out.append({
                    "src_module": src_mod,
                    "src_addr": f"0x{src_addr:08x}",
                    "dest_module": dst_mod,
                    "dest_addr": f"0x{dst_addr:08x}",
                })
        return out

    def reloc_list(rels: list[Reloc]) -> list[dict]:
        return [{
            "src_module": r.src_module,
            "src_addr": f"0x{r.src_addr:08x}",
            "dest_module": r.dest_module,
            "dest_addr": f"0x{r.dest_addr:08x}",
            "kind": r.kind,
        } for r in rels]

    payload = {
        "symbols": [sym_dict(s) for m in modules.values() for s in m.symbols],
        "edges_call": edge_list(graph.edges_call),
        "edges_load": edge_list(graph.edges_load),
        "unresolved_calls": reloc_list(graph.unresolved_calls),
        "unresolved_loads": reloc_list(graph.unresolved_loads),
    }
    with path.open("w") as f:
        json.dump(payload, f, indent=2)


def write_bulk_json(path: Path, groups: list[BulkGroup]) -> None:
    """Serialize every bulk group (no limit) to JSON."""
    path.parent.mkdir(parents=True, exist_ok=True)
    payload = {
        "groups": [
            {
                "module": g.module,
                "size": f"0x{g.size:x}",
                "count": g.count,
                "leverage": round(g.leverage, 4),
                "failing_module": g.is_failing_module,
                "all_sinit": g.all_sinit,
                "all_placeholder": g.all_placeholder,
                "addr_first": f"0x{g.addr_first:08x}",
                "addr_last": f"0x{g.addr_last:08x}",
                "members": [
                    {
                        "name": m.name,
                        "addr": f"0x{m.addr:08x}",
                        "mode": m.mode,
                    }
                    for m in g.members
                ],
            }
            for g in groups
        ],
    }
    with path.open("w") as f:
        json.dump(payload, f, indent=2)


def write_targets_md(
    path: Path,
    targets: list[Target],
    groups: list[BulkGroup],
    sinit_summary: dict[str, list[tuple[int, int]]],
    limit: int | None,
) -> None:
    """Render the tiered target list as Markdown: one section per tier,
    a table per section, honoring `limit` so the file stays reviewable."""
    path.parent.mkdir(parents=True, exist_ok=True)

    from collections import Counter
    counts = Counter(t.tier for t in targets)

    lines: list[str] = []
    lines.append("# Decomp target list")
    lines.append("")
    lines.append("Generated by `tools/analyze_symbols.py`. Rerun after any rename "
                 "or `dsd apply` to refresh.")
    lines.append("")
    lines.append("| Tier | Count | What it is |")
    lines.append("|------|------:|------------|")
    descriptions = {
        "sinit":   "CodeWarrior `__sinit_*` static initializers (bulk template)",
        "named":   "Already has a real name (BIOS thunks, Entry, main, ...)",
        "trivial": "Leaf function, <= 4 bytes (likely `bx lr` or SWI stub)",
        "easy":    "Leaf function, <= 0x20 bytes, no outgoing calls",
        "medium":  "<= 0x80 bytes, every direct callee already named",
        "hard":    "Everything else",
    }
    for tier in TIER_ORDER:
        lines.append(f"| **{tier}** | {counts.get(tier, 0)} | {descriptions[tier]} |")
    lines.append("")

    for tier in TIER_ORDER:
        rows = [t for t in targets if t.tier == tier]
        if not rows:
            continue
        shown = rows if limit is None else rows[:limit]
        lines.append(f"## {tier}  ({len(rows)} total" +
                     (f", showing first {len(shown)}" if limit and len(rows) > limit else "") +
                     ")")
        lines.append("")
        lines.append("| Module | Name | Address | Size | Callees (named/total) | Reason |")
        lines.append("|--------|------|---------|-----:|----------------------:|--------|")
        for t in shown:
            s = t.symbol
            lines.append(
                f"| {s.module} | `{s.name}` | `0x{s.addr:08x}` | "
                f"`0x{s.size:x}` | {t.callees_named}/{t.callees_total} | "
                f"{t.reason} |"
            )
        lines.append("")

    # ---- Bulk candidates section ----
    bulk_cap = 20
    lines.append("## Bulk candidates")
    lines.append("")
    if not groups:
        lines.append("No bulk groups with >= "
                     f"{MIN_BULK_COUNT} members found at current state.")
        lines.append("")
    else:
        total_members = sum(g.count for g in groups)
        lines.append(
            f"{len(groups)} groups of functions share the same "
            f"`(module, size)` and have at least {MIN_BULK_COUNT} members "
            f"(leverage = count / size). Match one, paste the pattern "
            f"across the rest."
        )
        lines.append("")
        lines.append(f"**Total:** {total_members} functions across {len(groups)} groups.")
        lines.append("")
        shown = groups if len(groups) <= bulk_cap else groups[:bulk_cap]
        header = (
            "| Rank | Module | Size | Count | Leverage | Addr range | Kind | Sample names |"
        )
        sep = "|-----:|--------|-----:|------:|---------:|------------|------|--------------|"
        lines.append(header)
        lines.append(sep)
        for i, g in enumerate(shown, start=1):
            kind_bits: list[str] = []
            if g.all_sinit:
                kind_bits.append("`__sinit`")
            if g.all_placeholder and not g.all_sinit:
                kind_bits.append("all unnamed")
            if g.is_failing_module:
                kind_bits.append(f"**NB:** {g.module} checksum failing")
            kind = "; ".join(kind_bits) if kind_bits else "—"
            samples = ", ".join(f"`{m.name}`" for m in g.members[:3])
            if g.count > 3:
                samples += f", ... (+{g.count - 3})"
            lines.append(
                f"| {i} | {g.module} | `0x{g.size:x}` | {g.count} | "
                f"{g.leverage:.3f} | `0x{g.addr_first:08x}`–`0x{g.addr_last:08x}` | "
                f"{kind} | {samples} |"
            )
        if len(groups) > bulk_cap:
            lines.append("")
            lines.append(
                f"(showing top {bulk_cap} of {len(groups)} groups — "
                f"see `bulk.json` for the full list)"
            )
        lines.append("")

    # ---- __sinit by overlay ----
    lines.append("### `__sinit_*` by overlay")
    lines.append("")
    if not sinit_summary:
        lines.append("No `__sinit_*` symbols found.")
        lines.append("")
    else:
        total_sinit = sum(
            count for rows in sinit_summary.values() for _, count in rows
        )
        lines.append(
            f"{total_sinit} CodeWarrior static-init shells across "
            f"{len(sinit_summary)} overlays — all generated from the same "
            f"template, so matching one unlocks the rest regardless of size."
        )
        lines.append("")
        lines.append("| Overlay | Total | Sizes (count × size) |")
        lines.append("|---------|------:|----------------------|")
        for module in sorted(sinit_summary.keys()):
            rows = sinit_summary[module]
            total = sum(count for _, count in rows)
            sizes_desc = ", ".join(f"{count} × `0x{size:x}`" for size, count in rows)
            lines.append(f"| {module} | {total} | {sizes_desc} |")
        lines.append("")

    with path.open("w") as f:
        f.write("\n".join(lines))


# --------------------------------------------------------------------------- #
# Snapshots + diff
#
# Every run writes `snapshot.json` next to the other outputs, capturing
# a minimal per-function record (tier, name, size). The *next* run
# loads it before overwriting, and `--diff` prints what changed since
# then — useful motivational feedback for the decomper:
#
#   Since last snapshot:
#     +7 named functions
#     5 moved:  hard -> medium
#     Renames: func_020abcde -> Ov005_DrawInit, ...
#
# Snapshots live under build/<ver>/analysis/ which is gitignored, so
# they're per-machine. First run on a machine has no prior snapshot
# and simply notes that.
# --------------------------------------------------------------------------- #

def build_snapshot(version: str, targets: list[Target]) -> dict:
    """Minimal serialisable state — only what's needed to compute a
    meaningful diff. Keyed by '<module>|0x<addr>' so a single dict-
    comparison reveals tier/name/size drift per function."""
    from collections import Counter
    tier_counts = Counter(t.tier for t in targets)
    return {
        "version": version,
        "schema": 1,
        "totals": {
            "classified": len(targets),
            "tier_counts": dict(tier_counts),
        },
        "symbols": {
            f"{t.symbol.module}|0x{t.symbol.addr:08x}": {
                "name": t.symbol.name,
                "tier": t.tier,
                "size": t.symbol.size,
            }
            for t in targets
        },
    }


def read_snapshot(path: Path) -> dict | None:
    if not path.is_file():
        return None
    try:
        with path.open() as f:
            data = json.load(f)
        # Minimal schema check — older snapshots are ignored rather
        # than crashing the diff.
        if not isinstance(data, dict) or "symbols" not in data:
            return None
        return data
    except (json.JSONDecodeError, OSError):
        return None


def write_snapshot(path: Path, snapshot: dict) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w") as f:
        json.dump(snapshot, f, indent=2)


def compute_diff(prev: dict, curr: dict) -> dict:
    """Return a structured diff between two snapshots.

    Keys:
      tier_delta    — {tier_name: curr_count - prev_count}
      moved         — [(key, prev_tier, curr_tier), ...] tier changed
      renamed       — [(key, prev_name, curr_name), ...] name changed
      newly_classified — [(key, curr_name, curr_tier), ...] not in prev
      removed       — [(key, prev_name, prev_tier), ...] not in curr
    """
    prev_syms: dict = prev.get("symbols", {})
    curr_syms: dict = curr.get("symbols", {})

    moved: list[tuple[str, str, str]] = []
    renamed: list[tuple[str, str, str]] = []
    newly: list[tuple[str, str, str]] = []
    removed: list[tuple[str, str, str]] = []

    for key, curr_rec in curr_syms.items():
        prev_rec = prev_syms.get(key)
        if prev_rec is None:
            newly.append((key, curr_rec["name"], curr_rec["tier"]))
            continue
        if prev_rec.get("name") != curr_rec["name"]:
            renamed.append((key, prev_rec["name"], curr_rec["name"]))
        if prev_rec.get("tier") != curr_rec["tier"]:
            moved.append((key, prev_rec["tier"], curr_rec["tier"]))

    for key, prev_rec in prev_syms.items():
        if key not in curr_syms:
            removed.append((key, prev_rec.get("name", "?"),
                            prev_rec.get("tier", "?")))

    prev_counts = prev.get("totals", {}).get("tier_counts", {})
    curr_counts = curr.get("totals", {}).get("tier_counts", {})
    all_tiers = set(prev_counts) | set(curr_counts)
    tier_delta = {
        tier: curr_counts.get(tier, 0) - prev_counts.get(tier, 0)
        for tier in all_tiers
    }

    return {
        "tier_delta": tier_delta,
        "moved": moved,
        "renamed": renamed,
        "newly_classified": newly,
        "removed": removed,
    }


def print_diff(diff: dict, *, limit: int = 20) -> None:
    print("=" * 60)
    print("Diff vs last snapshot")
    print("=" * 60)

    td = diff["tier_delta"]
    nonzero = {t: d for t, d in td.items() if d != 0}
    if nonzero:
        print("\nTier count deltas:")
        for tier in TIER_ORDER:
            d = nonzero.get(tier)
            if d is None:
                continue
            sign = "+" if d > 0 else ""
            print(f"  {tier:<8s} {sign}{d}")
    else:
        print("\nTier counts unchanged.")

    renamed = diff["renamed"]
    if renamed:
        print(f"\nRenames ({len(renamed)}):")
        for key, old, new in renamed[:limit]:
            print(f"  {key}  {old}  ->  {new}")
        if len(renamed) > limit:
            print(f"  ... (+{len(renamed) - limit} more)")

    moved = diff["moved"]
    if moved:
        print(f"\nTier changes ({len(moved)}):")
        # Group by (prev, curr) for a compact summary.
        from collections import Counter
        transitions = Counter((p, c) for _, p, c in moved)
        for (prev, curr), count in sorted(transitions.items(), key=lambda kv: -kv[1]):
            print(f"  {count:>4d}  {prev:<8s} -> {curr}")

    newly = diff["newly_classified"]
    if newly:
        print(f"\nNewly classified ({len(newly)}):")
        for key, name, tier in newly[:limit]:
            print(f"  {key}  {name}  [{tier}]")
        if len(newly) > limit:
            print(f"  ... (+{len(newly) - limit} more)")

    removed = diff["removed"]
    if removed:
        print(f"\nRemoved ({len(removed)}):")
        for key, name, tier in removed[:limit]:
            print(f"  {key}  {name}  [was {tier}]")
        if len(removed) > limit:
            print(f"  ... (+{len(removed) - limit} more)")

    if not any([renamed, moved, newly, removed]) and not nonzero:
        print("\nNo changes since last snapshot.")


# --------------------------------------------------------------------------- #
# Entrypoint
# --------------------------------------------------------------------------- #

def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__.splitlines()[1] if __doc__ else None)
    ap.add_argument("--version", default="eur",
                    help='Game version under config/<version>/ (default: "eur")')
    ap.add_argument("--no-outputs", action="store_true",
                    help="Skip writing build/<ver>/analysis/*; stdout summary only")
    ap.add_argument("--limit", type=int, default=50,
                    help="Max rows per tier in targets.md (default: 50)")
    ap.add_argument("--diff", action="store_true",
                    help="Print changes vs the previous snapshot "
                         "(build/<ver>/analysis/snapshot.json)")
    args = ap.parse_args()

    config_root = ROOT / "config" / args.version
    out_dir = ROOT / "build" / args.version / "analysis"
    snapshot_path = out_dir / "snapshot.json"

    modules = load_all(config_root)
    graph = build_call_graph(modules)
    targets = rank_targets(modules, graph)
    groups = find_bulk_groups(modules)
    sinit_summary = find_sinit_summary(modules)

    print_summary(modules, graph, targets, groups)

    # Load previous snapshot BEFORE writing the new one, so we keep
    # the pre-run state available for comparison.
    prev_snapshot = read_snapshot(snapshot_path)
    curr_snapshot = build_snapshot(args.version, targets)

    if args.diff:
        if prev_snapshot is None:
            print(
                "\n(--diff requested but no previous snapshot at "
                f"{snapshot_path.relative_to(ROOT)} — this is the first "
                "run on this machine. Rerun after a rename or match to "
                "see the delta.)"
            )
        else:
            print()
            print_diff(compute_diff(prev_snapshot, curr_snapshot))


    if not args.no_outputs:
        write_graph_json(out_dir / "graph.json", modules, graph)
        write_targets_md(
            out_dir / "targets.md", targets, groups, sinit_summary, limit=args.limit
        )
        write_bulk_json(out_dir / "bulk.json", groups)
        write_snapshot(snapshot_path, curr_snapshot)
        print(
            f"\nWrote {out_dir}/graph.json, {out_dir}/targets.md, "
            f"{out_dir}/bulk.json, and {out_dir}/snapshot.json",
            file=sys.stderr,
        )

    return 0


if __name__ == "__main__":
    sys.exit(main())
