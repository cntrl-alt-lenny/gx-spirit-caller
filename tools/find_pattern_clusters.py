#!/usr/bin/env python3

"""
find_pattern_clusters.py — surface clusters of functions sharing an
exact reloc signature, where at least one is already matched and at
least one is still unmatched.

Each such cluster is a **ready-to-propagate template family**: the
matched member is a working `.c` template, and the unmatched
siblings are mechanical or near-mechanical applications of that
template via `tools/propagate_template.py`.

## Where this fits

| Tool                          | Question answered                          |
|-------------------------------|--------------------------------------------|
| `find_duplicates.py`          | What UNMATCHED clusters share coarse shape (size + out-deg + callee-modules)? |
| `pattern_library.py`          | For a NEW TARGET, which already-matched `.c` is the closest drafting template? |
| `propagate_template.py`       | Apply a matched template to an exact-sig sibling (mechanical). |
| `find_pattern_clusters.py`    | **Across the whole tree, where do matched anchors and unmatched siblings already cluster — what's ready to propagate RIGHT NOW?** |

The decomper's match-acceleration loop has the steps:

  1. Pick a target.
  2. Find a near-template.
  3. Adapt + match.
  4. **Propagate to siblings.**

`pattern_library` answers step 2 from the target side. This tool
answers step 4 from the template side: "I just matched `Task_*`;
what other unmatched functions could I propagate this match to
without doing more work?"

## Algorithm

1. Load all modules + relocs (no .c parsing required — works from
   `config/<ver>/**/symbols.txt` + `relocs.txt` alone).
2. For every function, compute `reloc_signature(...)` keyed by
   `(size, sig)` — exact match required, since `propagate_template`
   itself requires exact match for mechanical application.
3. Bucket by that fingerprint, partition each bucket by matched /
   unmatched.
4. Drop buckets that are all-matched (nothing to propagate to) or
   all-unmatched (no template available).
5. Rank by `len(unmatched)` desc — clusters with more unmatched
   siblings unlock more match leverage per propagate run.

## Output shape

  - stdout: cluster count + top-N preview
  - `--out path.md`: full ranked Markdown report
  - `--json`: machine-readable for CI

## Usage

    # Top-20 ready-to-propagate clusters, plain-text.
    python tools/find_pattern_clusters.py --version eur

    # Generate full report for review.
    python tools/find_pattern_clusters.py --version eur \\
        --out build/eur/analysis/pattern_clusters.md

    # Machine-readable, all clusters above the size floor.
    python tools/find_pattern_clusters.py --version eur \\
        --min-unmatched 2 --json

    # Per-anchor mode: show siblings of one specific matched fn.
    python tools/find_pattern_clusters.py --version eur \\
        main 0x02006870

## Why exact-sig (not fuzzy)

`propagate_template.py` requires an EXACT match — same offsets,
same reloc kinds. Anything looser produces a `TemplateMismatch`
when the decomper tries to actually run it. So exact-sig clustering
is the version that maps 1:1 to "no further work needed" siblings.

Fuzzy clustering (Jaccard ≥ T) would surface "near-template" pairs
useful for drafting but not mechanical propagation — that's
`pattern_library.py`'s job, and it's already query-mode (anchored
by the unmatched target). Adding a third tool with fuzzy clustering
from the matched side would duplicate the fuzziness primitive
without a clear unique use case.
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
    ModuleData,
    Reloc,
    ROOT,
    Symbol,
    load_all,
)
from data_symbol_sizes import infer_per_module  # noqa: E402
from next_targets import (  # noqa: E402
    collect_matched_ranges,
    is_addr_matched,
)
from propagate_template import (  # noqa: E402
    relocs_for_function,
)


# Exact (size, reloc-signature) fingerprint. Must include size
# because two functions of different sizes sharing a sig is
# unusual but possible (mwcc tail-merge could produce it), and
# `propagate_template` won't apply across-size anyway.
Fingerprint = tuple[int, tuple]


@dataclass(frozen=True)
class Cluster:
    """A group of functions sharing one exact (size, reloc-sig)
    fingerprint, partitioned by matched-state."""
    fingerprint: Fingerprint
    matched: tuple[Symbol, ...]    # already in a `complete` TU
    unmatched: tuple[Symbol, ...]  # the propagation targets

    @property
    def size(self) -> int:
        return self.fingerprint[0]

    @property
    def sig_len(self) -> int:
        return len(self.fingerprint[1])

    @property
    def total_members(self) -> int:
        return len(self.matched) + len(self.unmatched)

    @property
    def sort_key(self) -> tuple[int, int, int, int]:
        # Primary: more unmatched siblings = more leverage (desc).
        # Secondary: smaller size = cheaper to verify (asc).
        # Tertiary: sig_len asc (smaller signatures = more
        # generic/copyable templates).
        # Quaternary: addr of first matched (deterministic).
        first_matched = (
            self.matched[0].addr if self.matched else 0
        )
        return (
            -len(self.unmatched),
            self.size,
            self.sig_len,
            first_matched,
        )


# --------------------------------------------------------------------------- #
# Extended reloc signature
# --------------------------------------------------------------------------- #
#
# `propagate_template.reloc_signature` returns `(offset, kind)` tuples —
# enough for an exact mechanical match of two functions' template shape.
# But the brief 015 pilot showed `(size, reloc_signature)` is too coarse
# for cluster-level grouping: 144 candidates shared the fingerprint,
# only 18 (12.5%) actually matched the anchor's instruction shape. The
# rest had different instruction sequences targeting different kinds of
# symbols (function vs data) at the same `(offset, kind)` slot.
#
# Cloud has no access to the baserom or the toolchain, so it can't
# inspect instruction bytes. But it CAN look up the *target* of each
# reloc — and the target's TYPE (function / data) plus, for data
# targets, the inferred SIZE BUCKET, are strong shape discriminators
# that survive without seeing instructions.
#
# Examples this catches:
#   - anchor pattern  `ldr r0, =data_X; ldr r0, [r0]; bx lr`
#                     → 1 reloc, target_kind="d4" (4-byte pointer)
#   - tail-call       `ldr ip, =func_Y; mov r1, #N; bx ip`
#                     → 1 reloc, target_kind="fn"            ← different bucket
#   - field getter    `ldr r0, =data_Z; ldr r0, [r0, #0x40]` (data_Z is a struct)
#                     → 1 reloc, target_kind="d128"          ← different bucket
#
# Where the old `(size, [(offset, kind)])` lumped all three into one
# cluster of 156 unmatched siblings, the extended signature splits
# them into per-target-shape sub-clusters, each of which is much more
# homogeneous (and so much more likely to all `derive_plan`-validate).

# Compact target-kind labels — kept short so the fingerprint tuple
# isn't dominated by string overhead. Buckets mirror
# `data_symbol_sizes.size_bucket` boundaries.
_DATA_BUCKETS: list[tuple[int, str]] = [
    (4, "d4"),
    (8, "d8"),
    (0x20, "d32"),
    (0x80, "d128"),
    (0x400, "d1k"),
    (0x4000, "d16k"),
]


def _data_bucket(size: int | None) -> str:
    if size is None:
        return "d_unk"
    for upper, label in _DATA_BUCKETS:
        if size <= upper:
            return label
    return "d_big"


def _target_kind(
    r: Reloc,
    modules: dict[str, ModuleData],
    sizes_cache: dict[str, dict[int, int | None]],
) -> str:
    """Compact label for a reloc's target. `fn` for function targets,
    `dN` for data targets bucketed by inferred size, `ext` for
    targets that don't resolve to any known module / symbol."""
    md = modules.get(r.dest_module)
    if md is None:
        return "ext"
    target = md.by_addr.get(r.dest_addr)
    if target is None:
        return "ext"
    if target.is_function:
        return "fn"
    # Data target — look up the inferred size from the per-module cache.
    if r.dest_module not in sizes_cache:
        sizes_cache[r.dest_module] = infer_per_module(md.symbols)
    size = sizes_cache[r.dest_module].get(r.dest_addr)
    return _data_bucket(size)


def _extended_reloc_signature(
    relocs: list[Reloc],
    base_addr: int,
    modules: dict[str, ModuleData],
    sizes_cache: dict[str, dict[int, int | None]],
) -> tuple[tuple[int, str, str], ...]:
    """Like `propagate_template.reloc_signature` but each tuple is
    `(offset, kind, target_kind)` — see module-level comment for
    rationale."""
    return tuple(
        (
            r.src_addr - base_addr,
            r.kind,
            _target_kind(r, modules, sizes_cache),
        )
        for r in relocs
    )


# --------------------------------------------------------------------------- #
# Cluster computation
# --------------------------------------------------------------------------- #

def _fingerprint(
    sym: Symbol,
    md: ModuleData,
    modules: dict[str, ModuleData],
    sizes_cache: dict[str, dict[int, int | None]],
) -> Fingerprint | None:
    """Build the (size, extended-reloc-sig) fingerprint for one
    function. Returns None for symbols that aren't valid template
    members (zero-size, gap stubs, sinit shells)."""
    if not sym.is_function:
        return None
    if sym.size == 0:
        return None
    if sym.name.startswith("__sinit_"):
        return None
    if sym.name.startswith("_dsd_gap"):
        return None
    sig = _extended_reloc_signature(
        relocs_for_function(sym, md), sym.addr,
        modules, sizes_cache,
    )
    return (sym.size, sig)


def find_clusters(
    modules: dict[str, ModuleData],
    matched: dict[str, list[tuple[int, int]]],
    *,
    min_unmatched: int = 1,
) -> list[Cluster]:
    """Bucket every function by `_fingerprint`, partition each bucket
    matched-vs-unmatched, drop buckets that are all-matched or have
    fewer than `min_unmatched` unmatched siblings.

    Empty-sig fingerprints (no relocs at all — pure leaf functions)
    are intentionally INCLUDED. A pile of 4-byte `bx lr` shells is
    one of the most-propagatable patterns in the corpus and
    surfacing it as a cluster is correct.
    """
    buckets: dict[Fingerprint, list[Symbol]] = defaultdict(list)
    sizes_cache: dict[str, dict[int, int | None]] = {}
    for _mod_name, md in modules.items():
        for sym in md.symbols:
            fp = _fingerprint(sym, md, modules, sizes_cache)
            if fp is None:
                continue
            buckets[fp].append(sym)

    out: list[Cluster] = []
    for fp, members in buckets.items():
        matched_members: list[Symbol] = []
        unmatched_members: list[Symbol] = []
        for sym in members:
            if is_addr_matched(matched, sym.module, sym.addr):
                matched_members.append(sym)
            else:
                unmatched_members.append(sym)
        if not matched_members:
            continue
        if len(unmatched_members) < min_unmatched:
            continue
        # Sort members for deterministic output.
        matched_members.sort(key=lambda s: (s.module, s.addr))
        unmatched_members.sort(key=lambda s: (s.module, s.addr))
        out.append(Cluster(
            fingerprint=fp,
            matched=tuple(matched_members),
            unmatched=tuple(unmatched_members),
        ))
    out.sort(key=lambda c: c.sort_key)
    return out


def find_clusters_for_anchor(
    anchor: Symbol,
    modules: dict[str, ModuleData],
    matched: dict[str, list[tuple[int, int]]],
) -> Cluster | None:
    """Per-anchor mode: return THE cluster containing `anchor`, or
    None if the anchor has no exact-sig siblings (matched or
    unmatched).

    Useful as a drill-down after a fresh match — "I just matched X,
    what else does this open up?"
    """
    md = modules.get(anchor.module)
    if md is None:
        return None
    sizes_cache: dict[str, dict[int, int | None]] = {}
    anchor_fp = _fingerprint(anchor, md, modules, sizes_cache)
    if anchor_fp is None:
        return None
    siblings: list[Symbol] = []
    for _mod_name, mdat in modules.items():
        for sym in mdat.symbols:
            if sym.module == anchor.module and sym.addr == anchor.addr:
                continue
            fp = _fingerprint(sym, mdat, modules, sizes_cache)
            if fp != anchor_fp:
                continue
            siblings.append(sym)
    matched_members: list[Symbol] = [anchor]
    unmatched_members: list[Symbol] = []
    for sym in siblings:
        if is_addr_matched(matched, sym.module, sym.addr):
            matched_members.append(sym)
        else:
            unmatched_members.append(sym)
    matched_members.sort(key=lambda s: (s.module, s.addr))
    unmatched_members.sort(key=lambda s: (s.module, s.addr))
    return Cluster(
        fingerprint=anchor_fp,
        matched=tuple(matched_members),
        unmatched=tuple(unmatched_members),
    )


# --------------------------------------------------------------------------- #
# Rendering
# --------------------------------------------------------------------------- #

def render_text_summary(
    clusters: list[Cluster],
    *,
    top_n: int = 20,
) -> str:
    """One-line-per-cluster overview suitable for stdout."""
    lines: list[str] = []
    if not clusters:
        lines.append(
            "No ready-to-propagate clusters found "
            "(need ≥1 matched + ≥1 unmatched at the same fingerprint)."
        )
        return "\n".join(lines)
    total_unmatched = sum(len(c.unmatched) for c in clusters)
    lines.append(
        f"Found {len(clusters)} ready-to-propagate cluster(s) "
        f"covering {total_unmatched} unmatched function(s). "
        f"Top {min(top_n, len(clusters))}:",
    )
    for i, c in enumerate(clusters[:top_n], start=1):
        anchor = c.matched[0]
        lines.append(
            f"  {i:>3}. {anchor.module:<6s} {anchor.name:<30s} "
            f"size=0x{c.size:x}  sig={c.sig_len:>2}  "
            f"matched={len(c.matched)}  unmatched={len(c.unmatched)}",
        )
    return "\n".join(lines)


def render_markdown(
    clusters: list[Cluster],
    *,
    version: str,
    top_n: int | None = None,
) -> str:
    shown = clusters if top_n is None else clusters[:top_n]
    lines: list[str] = []
    lines.append(f"# Pattern clusters — `{version}`")
    lines.append("")
    lines.append(
        "_Each cluster groups functions sharing an EXACT "
        "`(size, reloc-signature)` fingerprint where at least one "
        "is already matched (the **template**) and at least one is "
        "still unmatched (the **propagation targets**). Each cluster "
        "is mechanically applicable via `tools/propagate_template.py`._"
    )
    lines.append("")
    lines.append(
        f"**{len(clusters)}** ready-to-propagate cluster(s) "
        f"covering "
        f"**{sum(len(c.unmatched) for c in clusters)}** unmatched "
        "function(s). Sorted by unmatched-count desc, then size asc."
    )
    lines.append("")
    if not shown:
        return "\n".join(lines) + "\n"

    for i, c in enumerate(shown, start=1):
        lines.append("---")
        lines.append("")
        anchor = c.matched[0]
        lines.append(
            f"## {i}. `{anchor.name}` "
            f"(`{anchor.module}|0x{anchor.addr:08x}`) "
            f"+ {len(c.unmatched)} unmatched sibling(s)",
        )
        lines.append("")
        lines.append(
            f"`size=0x{c.size:x}` &nbsp;|&nbsp; "
            f"`relocs={c.sig_len}` &nbsp;|&nbsp; "
            f"`matched={len(c.matched)}` &nbsp;|&nbsp; "
            f"`unmatched={len(c.unmatched)}`"
        )
        lines.append("")

        if len(c.matched) > 1:
            lines.append(
                f"**Already-matched anchors ({len(c.matched)}):**",
            )
            for s in c.matched:
                lines.append(
                    f"- `{s.name}` (`{s.module}|0x{s.addr:08x}`)",
                )
            lines.append("")
        else:
            lines.append("**Anchor:**")
            lines.append(
                f"- `{anchor.name}` "
                f"(`{anchor.module}|0x{anchor.addr:08x}`)",
            )
            lines.append("")

        lines.append(
            f"**Propagation targets ({len(c.unmatched)}):**",
        )
        for s in c.unmatched:
            lines.append(
                f"- `{s.name}` (`{s.module}|0x{s.addr:08x}`)",
            )
        lines.append("")
    return "\n".join(lines) + "\n"


def render_json(clusters: list[Cluster]) -> str:
    payload = {
        "clusters": [
            {
                "size": c.size,
                "sig_len": c.sig_len,
                "matched": [
                    {
                        "module": s.module,
                        "addr": s.addr,
                        "name": s.name,
                    } for s in c.matched
                ],
                "unmatched": [
                    {
                        "module": s.module,
                        "addr": s.addr,
                        "name": s.name,
                    } for s in c.unmatched
                ],
            }
            for c in clusters
        ],
    }
    return json.dumps(payload, indent=2)


def render_anchor_text(
    anchor: Symbol, cluster: Cluster | None,
) -> str:
    lines: list[str] = []
    if cluster is None or not cluster.unmatched:
        lines.append(
            f"`{anchor.name}` "
            f"(`{anchor.module}|0x{anchor.addr:08x}`): no "
            "unmatched exact-sig siblings.",
        )
        if cluster and cluster.matched:
            other_matched = [
                s for s in cluster.matched
                if (s.module, s.addr) != (anchor.module, anchor.addr)
            ]
            if other_matched:
                lines.append(
                    f"  ({len(other_matched)} other matched "
                    "anchor(s) share this fingerprint — already "
                    "covered.)",
                )
        return "\n".join(lines)

    lines.append(
        f"`{anchor.name}` "
        f"(`{anchor.module}|0x{anchor.addr:08x}`): "
        f"size=0x{cluster.size:x}, sig={cluster.sig_len}",
    )
    lines.append(
        f"  Matched anchors in cluster: {len(cluster.matched)}",
    )
    lines.append(
        f"  Unmatched propagation targets: {len(cluster.unmatched)}",
    )
    lines.append("")
    lines.append("Targets:")
    for s in cluster.unmatched:
        lines.append(f"  - {s.module:<6s} 0x{s.addr:08x}  {s.name}")
    return "\n".join(lines)


# --------------------------------------------------------------------------- #
# CLI
# --------------------------------------------------------------------------- #

def main() -> int:
    ap = argparse.ArgumentParser(
        description=(
            "Find clusters of matched + unmatched functions sharing "
            "an exact (size, reloc-sig) fingerprint."
        ),
    )
    ap.add_argument("--version", default="eur")
    ap.add_argument(
        "module", nargs="?",
        help="Anchor module (per-anchor mode). When omitted, "
             "ranks all clusters across the tree.",
    )
    ap.add_argument(
        "addr", nargs="?",
        help="Anchor address (hex). Required when `module` given.",
    )
    ap.add_argument(
        "--min-unmatched", type=int, default=1,
        help="Minimum unmatched siblings per cluster (default 1).",
    )
    ap.add_argument(
        "--top", type=int, default=20,
        help="Top-N clusters shown in stdout summary (default 20).",
    )
    ap.add_argument(
        "--out", type=Path, default=None,
        help="Write full Markdown report to this path.",
    )
    ap.add_argument(
        "--json", action="store_true",
        help="Emit JSON to stdout instead of plain-text summary.",
    )
    args = ap.parse_args()

    config_dir = ROOT / "config" / args.version
    if not config_dir.is_dir():
        print(f"error: {config_dir} not found.", file=sys.stderr)
        return 2

    modules = load_all(config_dir)
    matched = collect_matched_ranges(config_dir)

    # Per-anchor mode.
    if args.module is not None:
        if args.addr is None:
            print(
                "error: addr required when module is given.",
                file=sys.stderr,
            )
            return 2
        md = modules.get(args.module)
        if md is None:
            print(
                f"error: module `{args.module}` not found.",
                file=sys.stderr,
            )
            return 2
        addr = int(args.addr, 0)
        anchor = md.by_addr.get(addr)
        if anchor is None:
            print(
                f"error: no symbol at "
                f"{args.module}|0x{addr:08x}.",
                file=sys.stderr,
            )
            return 2
        if not anchor.is_function:
            print(
                f"error: {anchor.name} is not a function.",
                file=sys.stderr,
            )
            return 2
        if not is_addr_matched(matched, anchor.module, anchor.addr):
            print(
                f"warning: anchor {anchor.name} is not matched. "
                "This tool surfaces siblings of MATCHED anchors. "
                "(Run anyway — siblings will still cluster, just "
                "with no template to draft from.)",
                file=sys.stderr,
            )
        cluster = find_clusters_for_anchor(anchor, modules, matched)
        if args.json:
            print(render_json(
                [cluster] if cluster else [],
            ))
        else:
            print(render_anchor_text(anchor, cluster))
        return 0

    # Tree-wide ranking mode.
    clusters = find_clusters(
        modules, matched, min_unmatched=args.min_unmatched,
    )

    if args.json:
        print(render_json(clusters))
        return 0

    print(render_text_summary(clusters, top_n=args.top))

    if args.out:
        args.out.parent.mkdir(parents=True, exist_ok=True)
        args.out.write_text(
            render_markdown(clusters, version=args.version),
            encoding="utf-8",
        )
        try:
            display = args.out.relative_to(ROOT)
        except ValueError:
            display = args.out
        print(
            f"\nWrote {display} ({len(clusters)} clusters).",
            file=sys.stderr,
        )
    return 0


if __name__ == "__main__":
    sys.exit(main())
