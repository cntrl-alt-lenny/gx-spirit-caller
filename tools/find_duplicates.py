#!/usr/bin/env python3

"""
find_duplicates.py — call-graph-shape clustering.

Complements `tools/analyze_symbols.py`'s bulk-group output. Bulk
groups cluster strictly by `(module, size, name-family)`, which is
conservative by design — it only merges functions the name-prefix
heuristic says are related. This tool goes wider: it clusters by
call-graph *shape* alone, ignoring names and (optionally) module
boundaries.

Fingerprint per function:

    (size, out-degree, sorted tuple of callee modules)

Two functions with identical fingerprints have the same size, the
same number of outgoing calls, and reach the same set of destination
modules. In mwcc output that's a strong signal they came from the
same template — common patterns:

  * Cross-overlay vtable defaults: size 0x4, 0 callees (`bx lr`),
    appearing in multiple overlays. Bulk groups find these
    per-overlay; this tool surfaces the cross-overlay shape.
  * Thin wrappers around main-module helpers: size 0x10..0x20,
    1 callee, callee lives in main. A whole family of "forward to
    main" shims often shares this.
  * Callback adapters: 2–3 callees, all into a shared handler
    module. Template bodies differ only in which handler.

Outputs:
  * stdout: cluster count + top-N preview.
  * build/<ver>/analysis/duplicates.md: ranked clusters with members.
  * build/<ver>/analysis/duplicates.json: machine-readable lookup.

Usage:
    python tools/find_duplicates.py --version eur
    python tools/find_duplicates.py --version eur --min-count 3
    python tools/find_duplicates.py --version eur --same-module-only
"""

from __future__ import annotations

import argparse
import json
import sys
from collections import defaultdict
from dataclasses import dataclass
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from analyze_symbols import (  # noqa: E402
    FAILING_MODULES,
    ROOT,
    CallGraph,
    ModuleData,
    Symbol,
    build_call_graph,
    load_all,
)


DEFAULT_MIN_COUNT = 4


# --------------------------------------------------------------------------- #
# Fingerprint + cluster
# --------------------------------------------------------------------------- #

@dataclass(frozen=True)
class Fingerprint:
    """Call-graph shape signature. Two functions sharing this key
    have identical size, identical number of outgoing calls, and
    reach the same set of destination modules.

    `src_module` is only set (non-None) in --same-module-only mode,
    where it pins each cluster to a single source module. Left None
    in the default cross-module mode so clusters can span overlays."""
    size: int
    out_degree: int
    callee_modules: tuple[str, ...]   # sorted for deterministic hashing
    src_module: str | None = None


@dataclass
class DuplicateCluster:
    """A group of functions sharing one Fingerprint."""
    fingerprint: Fingerprint
    members: list[Symbol]             # sorted by (module, addr)

    @property
    def count(self) -> int:
        return len(self.members)

    @property
    def leverage(self) -> float:
        # Same scoring convention as bulk groups: bigger count with
        # smaller size = higher leverage.
        return self.count / self.fingerprint.size if self.fingerprint.size else 0.0

    @property
    def modules_touched(self) -> set[str]:
        return {m.module for m in self.members}

    @property
    def is_cross_module(self) -> bool:
        return len(self.modules_touched) > 1


def compute_fingerprint(sym: Symbol, graph: CallGraph) -> Fingerprint:
    """Derive the call-graph shape signature of one function."""
    key = (sym.module, sym.addr)
    callees = graph.edges_call.get(key, set())
    modules = tuple(sorted({cm for (cm, _) in callees}))
    return Fingerprint(
        size=sym.size,
        out_degree=len(callees),
        callee_modules=modules,
    )


def find_duplicate_clusters(
    modules: dict[str, ModuleData],
    graph: CallGraph,
    *,
    min_count: int = DEFAULT_MIN_COUNT,
    same_module_only: bool = False,
) -> list[DuplicateCluster]:
    """Bucket every function by Fingerprint, return clusters with
    >= min_count members, ranked by leverage desc."""
    buckets: dict[Fingerprint, list[Symbol]] = defaultdict(list)
    for module in modules.values():
        for sym in module.symbols:
            if not sym.is_function or sym.size == 0:
                continue
            if sym.name.startswith(".L_"):
                # Assembler local labels inside other functions.
                continue
            fp = compute_fingerprint(sym, graph)
            if same_module_only:
                # Pin each cluster to its source module so cross-
                # module entries don't merge. callee_modules keeps
                # its real meaning (modules the function CALLS).
                fp = Fingerprint(
                    size=fp.size,
                    out_degree=fp.out_degree,
                    callee_modules=fp.callee_modules,
                    src_module=sym.module,
                )
            buckets[fp].append(sym)

    clusters: list[DuplicateCluster] = []
    for fp, members in buckets.items():
        if len(members) < min_count:
            continue
        members_sorted = sorted(members, key=lambda s: (s.module, s.addr))
        clusters.append(DuplicateCluster(fingerprint=fp, members=members_sorted))
    clusters.sort(key=lambda c: (-c.leverage, -c.count, c.fingerprint.size))
    return clusters


# --------------------------------------------------------------------------- #
# Output
# --------------------------------------------------------------------------- #

def print_summary(clusters: list[DuplicateCluster], top_n: int = 10) -> None:
    total_members = sum(c.count for c in clusters)
    cross = sum(1 for c in clusters if c.is_cross_module)
    print(f"Shape clusters           : {len(clusters)}")
    print(f"  cross-module           : {cross}")
    print(f"  intra-module only      : {len(clusters) - cross}")
    print(f"Total functions in clusters: {total_members}")
    if not clusters:
        return
    print()
    print(f"Top {top_n} by leverage (count / size):")
    for c in clusters[:top_n]:
        fp = c.fingerprint
        # ASCII-only: `print_summary` writes to sys.stdout which in a
        # non-UTF-8 locale (e.g. LC_ALL=C, cp1252) would raise
        # UnicodeEncodeError on glyphs like -> or the empty-set sign.
        cm = f"calls->{{{','.join(fp.callee_modules)}}}"
        xmod = "  [cross-module]" if c.is_cross_module else ""
        src = f"  [in {fp.src_module}]" if fp.src_module else ""
        print(f"  size=0x{fp.size:<4x}  "
              f"out={fp.out_degree}  "
              f"count={c.count:<3d}  "
              f"leverage={c.leverage:5.2f}  "
              f"{cm}{src}{xmod}")


def write_md(
    path: Path,
    clusters: list[DuplicateCluster],
    *,
    top_n: int = 25,
    sample_per_cluster: int = 3,
) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    lines: list[str] = []
    lines.append("# Duplicate / template candidates (call-graph shape)")
    lines.append("")
    lines.append(
        "Functions clustered by **call-graph shape** — identical "
        "`(size, out-degree, callee-module-set)`. Complements the bulk "
        "groups in `targets.md` by surfacing cross-module templates "
        "(bulk groups are per-module by design)."
    )
    lines.append("")
    lines.append(
        "Regenerate with `python tools/find_duplicates.py --version "
        "<ver>`. Full member lists live in `duplicates.json`."
    )
    lines.append("")

    if not clusters:
        lines.append("_No clusters found at current threshold._")
        lines.append("")
    else:
        shown = clusters[:top_n]
        more = len(clusters) - len(shown)
        lines.append(f"## Top {len(shown)} clusters by leverage")
        lines.append("")
        lines.append(
            "| Rank | Size | Out-deg | Count | Leverage | Callee modules | Cross-module? | Sample members |"
        )
        lines.append(
            "|-----:|-----:|--------:|------:|---------:|----------------|:-------------:|----------------|"
        )
        for i, c in enumerate(shown, start=1):
            fp = c.fingerprint
            cm = ", ".join(fp.callee_modules) if fp.callee_modules else "—"
            xmod = "✓" if c.is_cross_module else ""
            # src_module is only set in --same-module-only mode.
            src = f" (in `{fp.src_module}`)" if fp.src_module else ""
            samples = ", ".join(
                f"`{s.module}:{s.name}`"
                for s in c.members[:sample_per_cluster]
            )
            if c.count > sample_per_cluster:
                samples += f", …+{c.count - sample_per_cluster}"
            lines.append(
                f"| {i} | `0x{fp.size:x}`{src} | {fp.out_degree} | {c.count} | "
                f"{c.leverage:.2f} | {cm} | {xmod} | {samples} |"
            )
        if more > 0:
            lines.append("")
            lines.append(
                f"_…and {more} more cluster(s) — see `duplicates.json`._"
            )
        lines.append("")

    # Markdown body uses non-ASCII glyphs (—, ✓, …). Pin the file
    # encoding so the writer doesn't crash in non-UTF-8 locales.
    with path.open("w", encoding="utf-8") as f:
        f.write("\n".join(lines))


def write_json(path: Path, clusters: list[DuplicateCluster]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    payload = {
        "clusters": [
            {
                "fingerprint": {
                    "size": f"0x{c.fingerprint.size:x}",
                    "out_degree": c.fingerprint.out_degree,
                    "callee_modules": list(c.fingerprint.callee_modules),
                    "src_module": c.fingerprint.src_module,
                },
                "count": c.count,
                "leverage": round(c.leverage, 4),
                "cross_module": c.is_cross_module,
                "modules_touched": sorted(c.modules_touched),
                "members": [
                    {
                        "name": m.name,
                        "module": m.module,
                        "addr": f"0x{m.addr:08x}",
                        "failing_module": m.module in FAILING_MODULES,
                    }
                    for m in c.members
                ],
            }
            for c in clusters
        ],
    }
    with path.open("w") as f:
        json.dump(payload, f, indent=2)


# --------------------------------------------------------------------------- #
# Entrypoint
# --------------------------------------------------------------------------- #

def main() -> int:
    ap = argparse.ArgumentParser(
        description="Cluster functions by call-graph shape "
                    "(complements bulk groups in targets.md)"
    )
    ap.add_argument("--version", default="eur")
    ap.add_argument("--min-count", type=int, default=DEFAULT_MIN_COUNT,
                    help=f"Minimum cluster size (default: {DEFAULT_MIN_COUNT})")
    ap.add_argument("--same-module-only", action="store_true",
                    help="Don't merge cross-module clusters — pin each "
                         "cluster to a single module. Useful for finding "
                         "in-module templates the bulk grouper missed "
                         "due to name-family diversity.")
    ap.add_argument("--no-outputs", action="store_true",
                    help="Skip writing duplicates.{md,json}; stdout only")
    ap.add_argument("--top", type=int, default=10,
                    help="Top N clusters to show in stdout summary")
    args = ap.parse_args()

    config_root = ROOT / "config" / args.version
    out_dir = ROOT / "build" / args.version / "analysis"

    modules = load_all(config_root)
    graph = build_call_graph(modules)

    clusters = find_duplicate_clusters(
        modules, graph,
        min_count=args.min_count,
        same_module_only=args.same_module_only,
    )

    print_summary(clusters, top_n=args.top)

    if not args.no_outputs:
        write_md(out_dir / "duplicates.md", clusters)
        write_json(out_dir / "duplicates.json", clusters)
        print(f"\nWrote {out_dir}/duplicates.md and "
              f"{out_dir}/duplicates.json", file=sys.stderr)

    return 0


if __name__ == "__main__":
    sys.exit(main())
