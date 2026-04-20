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
        raise NotImplementedError

    def out_degree_call(self, key: SymbolKey) -> int:
        raise NotImplementedError


def build_call_graph(modules: dict[str, ModuleData]) -> CallGraph:
    """For every reloc in every module, resolve src_addr and dest_addr
    to enclosing symbols and add an edge to the CallGraph. Relocs whose
    endpoints don't resolve go into the unresolved_* lists."""
    raise NotImplementedError


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


def classify(symbol: Symbol, graph: CallGraph) -> Target | None:
    """Assign a tier to a single symbol, or return None if it's not a
    decomp candidate (e.g. data symbol, gap unit, already matched).

    Tiers:
      trivial — leaf, size ≤ 4, passing module (likely `bx lr`)
      easy    — leaf, size ≤ 0x20, passing module
      sinit   — any `__sinit_*` (bulk opportunity, 51 of them)
      named   — already has a real name (BIOS thunk, Entry, main, etc.) —
                implementation still todo but the target is known
      medium  — size ≤ 0x80, all direct callees already named, passing module
      hard    — everything else (or anything in a failing module)
    """
    raise NotImplementedError


def rank_targets(modules: dict[str, ModuleData], graph: CallGraph) -> list[Target]:
    """Classify every function symbol and return the resulting list,
    sorted so the easiest wins appear first (tier rank, then size ascending)."""
    raise NotImplementedError


# --------------------------------------------------------------------------- #
# Output
# --------------------------------------------------------------------------- #

def print_summary(modules: dict[str, ModuleData], graph: CallGraph, targets: list[Target]) -> None:
    """Print the human-readable summary to stdout:
    per-module function/data counts, named/unnamed split, call-graph
    metrics (edge count, unresolved counts), and a preview of the top
    ~20 target rows."""
    raise NotImplementedError


def write_graph_json(path: Path, modules: dict[str, ModuleData], graph: CallGraph) -> None:
    """Serialize the full graph to JSON:
        {
          "symbols":   [{name, module, addr, size, type, mode}, ...],
          "edges_call":[{src_module, src_addr, dest_module, dest_addr}, ...],
          "edges_load":[{src_module, src_addr, dest_module, dest_addr}, ...],
          "unresolved_calls": [...], "unresolved_loads": [...]
        }
    Hex-formatted addresses for readability. Creates parent dirs as needed.
    """
    raise NotImplementedError


def write_targets_md(path: Path, targets: list[Target], limit: int | None) -> None:
    """Render the tiered target list as Markdown:
    one section per tier, a table with columns (name, module, addr,
    size, callees_named/total, reason). Honors `limit` per tier so the
    file doesn't blow out to thousands of rows."""
    raise NotImplementedError


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
    args = ap.parse_args()

    config_root = ROOT / "config" / args.version
    out_dir = ROOT / "build" / args.version / "analysis"

    modules = load_all(config_root)
    graph = build_call_graph(modules)
    targets = rank_targets(modules, graph)

    print_summary(modules, graph, targets)

    if not args.no_outputs:
        write_graph_json(out_dir / "graph.json", modules, graph)
        write_targets_md(out_dir / "targets.md", targets, limit=args.limit)
        print(f"\nWrote {out_dir}/graph.json and {out_dir}/targets.md", file=sys.stderr)

    return 0


if __name__ == "__main__":
    sys.exit(main())
