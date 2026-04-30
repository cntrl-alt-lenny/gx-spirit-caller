#!/usr/bin/env python3

"""
tier_classifier.py — bucket every function in a tier into actionable
"how to attack this" categories using the v2 cluster fingerprint.

Operationalises the manual analysis in
[`docs/research/medium-tier-plateau.md`](../docs/research/medium-tier-plateau.md)
(#246) and
[`docs/research/hard-tier-clustering.md`](../docs/research/hard-tier-clustering.md)
(#255). Both docs walked the v2 fingerprint over a tier and bucketed
the unmatched fns into:

  - **Propagatable** — has a matched anchor at the same fingerprint.
    Run `tools/cluster_wave_propagate.py` to ship in a single brief.
  - **Anchorless cluster** — ≥2 unmatched siblings at the same
    fingerprint, no matched anchor anywhere. Hand-draft one, then
    propagate to the rest. ROI varies by cluster size.
  - **Singleton** — unique fingerprint. Direct decomp, no shortcut.

This tool runs the same bucketing automatically against any tier
(`hard`, `medium`, `easy`, …). Output is a Markdown report (or JSON)
consumable directly as brief input — pick a row, run the action.

## Where this fits

Sister-tool to `find_pattern_clusters.py` (#227) which surfaces only
clusters with matched anchors. The classifier is broader: it
**explicitly surfaces the anchorless opportunities** that
`find_pattern_clusters` filters out, and it adds the singleton count
so the decomper sees the long-tail clearly.

## Algorithm

1. Load modules + matched ranges + the latest snapshot.
2. Filter to functions in the requested tier (per the snapshot's
   `tier` field).
3. Compute v2 fingerprint per function (`find_pattern_clusters._fingerprint`).
4. Cross-reference with matched anchors **across the whole tree**
   (so e.g. a hard-tier fn whose anchor is matched in another tier
   still counts as propagatable).
5. Bucket; rank within each bucket; render.

## Usage

    # Hard-tier (default), markdown summary on stdout.
    python tools/tier_classifier.py --version eur --tier hard

    # Medium-tier, write full report.
    python tools/tier_classifier.py --version eur --tier medium \\
        --out build/eur/analysis/medium_classifier.md

    # Machine-readable for CI / downstream tooling.
    python tools/tier_classifier.py --version eur --tier hard --json
"""

from __future__ import annotations

import argparse
import json
import sys
from dataclasses import dataclass
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from analyze_symbols import (  # noqa: E402
    ROOT,
    Symbol,
    load_all,
)
from find_pattern_clusters import (  # noqa: E402
    _fingerprint,
)
from next_targets import (  # noqa: E402
    collect_matched_ranges,
    is_addr_matched,
)


# --------------------------------------------------------------------------- #
# Types
# --------------------------------------------------------------------------- #

# v2 fingerprint shape per find_pattern_clusters._fingerprint.
Fingerprint = tuple[int, tuple]


@dataclass(frozen=True)
class PropagatableEntry:
    """One fingerprint with both matched anchors and unmatched
    in-tier siblings — immediately propagatable."""
    fingerprint: Fingerprint
    anchors: tuple[Symbol, ...]      # matched anchors at this fp
    unmatched: tuple[Symbol, ...]    # in-tier unmatched siblings

    @property
    def size(self) -> int:
        return self.fingerprint[0]

    @property
    def sig_len(self) -> int:
        return len(self.fingerprint[1])

    @property
    def target_kinds(self) -> tuple[str, ...]:
        return tuple(r[2] for r in self.fingerprint[1])

    @property
    def leverage(self) -> int:
        # Sort key: more unmatched siblings = more brief leverage.
        return len(self.unmatched)


@dataclass(frozen=True)
class AnchorlessEntry:
    """One fingerprint with ≥2 in-tier unmatched siblings but no
    matched anchor anywhere. Hand-draft one, propagate to the rest."""
    fingerprint: Fingerprint
    unmatched: tuple[Symbol, ...]

    @property
    def size(self) -> int:
        return self.fingerprint[0]

    @property
    def sig_len(self) -> int:
        return len(self.fingerprint[1])

    @property
    def target_kinds(self) -> tuple[str, ...]:
        return tuple(r[2] for r in self.fingerprint[1])

    @property
    def leverage(self) -> int:
        return len(self.unmatched)


@dataclass(frozen=True)
class TierClassification:
    """Full classification of a single tier."""
    tier: str
    in_tier_total: int
    propagatable: tuple[PropagatableEntry, ...]
    anchorless: tuple[AnchorlessEntry, ...]
    singletons: tuple[Symbol, ...]

    @property
    def propagatable_count(self) -> int:
        return sum(len(e.unmatched) for e in self.propagatable)

    @property
    def anchorless_count(self) -> int:
        return sum(len(e.unmatched) for e in self.anchorless)

    @property
    def singletons_count(self) -> int:
        return len(self.singletons)


# --------------------------------------------------------------------------- #
# Classification
# --------------------------------------------------------------------------- #

def _load_tier_keys(
    snapshot_path: Path, tier: str,
) -> set[tuple[str, int]]:
    """Pull every `(module, addr)` whose `tier` matches in the
    analyze_symbols snapshot."""
    payload = json.loads(snapshot_path.read_text(encoding="utf-8"))
    out: set[tuple[str, int]] = set()
    for k, v in payload.get("symbols", {}).items():
        if v.get("tier") != tier:
            continue
        if "|" not in k:
            continue
        mod, addr_str = k.split("|", 1)
        try:
            addr = int(addr_str, 16)
        except ValueError:
            continue
        out.add((mod, addr))
    return out


def classify_tier(
    modules: dict, matched: dict, tier_keys: set[tuple[str, int]],
    *, tier_name: str = "hard",
) -> TierClassification:
    """Bucket every function in `tier_keys` into propagatable /
    anchorless / singleton against the v2 fingerprint."""
    # Group in-tier, unmatched fns by fingerprint.
    sizes_cache: dict = {}
    in_tier_by_fp: dict[Fingerprint, list[Symbol]] = {}
    in_tier_total = 0
    for (mod, addr) in tier_keys:
        md = modules.get(mod)
        if md is None:
            continue
        sym = md.by_addr.get(addr)
        if sym is None:
            continue
        in_tier_total += 1
        # Skip functions that are in a complete TU (matched). The
        # tier classification is independent of match-state, but
        # for "what should we work on next" the decomper only cares
        # about unmatched.
        if is_addr_matched(matched, sym.module, sym.addr):
            continue
        fp = _fingerprint(sym, md, modules, sizes_cache)
        if fp is None:
            continue
        in_tier_by_fp.setdefault(fp, []).append(sym)

    # Cross-reference with matched anchors across the whole tree.
    matched_anchors_by_fp: dict[Fingerprint, list[Symbol]] = {}
    for _mod_name, md in modules.items():
        for sym in md.symbols:
            if not is_addr_matched(matched, sym.module, sym.addr):
                continue
            fp = _fingerprint(sym, md, modules, sizes_cache)
            if fp is None:
                continue
            matched_anchors_by_fp.setdefault(fp, []).append(sym)

    propagatable: list[PropagatableEntry] = []
    anchorless: list[AnchorlessEntry] = []
    singletons: list[Symbol] = []

    for fp, members in in_tier_by_fp.items():
        anchors = matched_anchors_by_fp.get(fp, [])
        if anchors:
            # Sort for deterministic output.
            sorted_anchors = sorted(
                anchors, key=lambda s: (s.module, s.addr),
            )
            sorted_members = sorted(
                members, key=lambda s: (s.module, s.addr),
            )
            propagatable.append(PropagatableEntry(
                fingerprint=fp,
                anchors=tuple(sorted_anchors),
                unmatched=tuple(sorted_members),
            ))
        elif len(members) >= 2:
            sorted_members = sorted(
                members, key=lambda s: (s.module, s.addr),
            )
            anchorless.append(AnchorlessEntry(
                fingerprint=fp,
                unmatched=tuple(sorted_members),
            ))
        else:
            singletons.extend(members)

    propagatable.sort(key=lambda e: -e.leverage)
    anchorless.sort(key=lambda e: -e.leverage)
    singletons.sort(key=lambda s: (s.module, s.addr))

    return TierClassification(
        tier=tier_name,
        in_tier_total=in_tier_total,
        propagatable=tuple(propagatable),
        anchorless=tuple(anchorless),
        singletons=tuple(singletons),
    )


# --------------------------------------------------------------------------- #
# Rendering
# --------------------------------------------------------------------------- #

def _fmt_target_kinds(kinds: tuple[str, ...]) -> str:
    """Compact display for the target_kind tuple. `(fn, fn, d4)` →
    "fn × 2, d4"."""
    if not kinds:
        return "—"
    counts: dict[str, int] = {}
    for k in kinds:
        counts[k] = counts.get(k, 0) + 1
    parts: list[str] = []
    for k in sorted(counts.keys()):
        n = counts[k]
        parts.append(f"`{k}`" + (f" × {n}" if n > 1 else ""))
    return ", ".join(parts)


def render_markdown(
    cls: TierClassification,
    *,
    version: str,
    top_propagatable: int = 10,
    top_anchorless: int = 10,
) -> str:
    lines: list[str] = []
    lines.append(f"# Tier classification — `{version}`, `{cls.tier}` tier")
    lines.append("")

    # Summary table.
    p_n = cls.propagatable_count
    a_n = cls.anchorless_count
    s_n = cls.singletons_count
    matched_in_tier = (
        cls.in_tier_total - p_n - a_n - s_n
    )
    lines.append("| Bucket                   | Fns | Action |")
    lines.append("|--------------------------|----:|--------|")
    lines.append(
        f"| Propagatable             | {p_n:>3} | "
        "Run `cluster_wave_propagate` from one of the matched "
        "anchors |"
    )
    lines.append(
        f"| Anchorless cluster       | {a_n:>3} | "
        "Hand-draft one of the cluster, propagate to siblings |"
    )
    lines.append(
        f"| Singleton                | {s_n:>3} | "
        "Direct decomp; no shortcut |"
    )
    if matched_in_tier > 0:
        lines.append(
            f"| Already matched (in tier)| {matched_in_tier:>3} | "
            "—; will leave the tier on rename |"
        )
    lines.append(f"| **Total in `{cls.tier}` tier** | "
                 f"**{cls.in_tier_total}** | |")
    lines.append("")

    # Propagatable section.
    lines.append("## Propagatable clusters")
    lines.append("")
    if not cls.propagatable:
        lines.append("_No propagatable clusters in this tier._")
        lines.append("")
    else:
        lines.append(
            f"_{len(cls.propagatable)} fingerprints with both matched "
            "anchors and unmatched in-tier siblings. Run "
            "`cluster_wave_propagate` from any anchor to ship the "
            "siblings as a brief._"
        )
        lines.append("")
        lines.append(
            "| Rank | Size | Sig | Target kinds | Anchors | "
            "Unmatched | Sample anchor |"
        )
        lines.append(
            "|-----:|-----:|----:|--------------|--------:|"
            "----------:|---------------|"
        )
        shown = cls.propagatable[:top_propagatable]
        for i, e in enumerate(shown, 1):
            sample = e.anchors[0]
            lines.append(
                f"| {i} | `0x{e.size:x}` | {e.sig_len} | "
                f"{_fmt_target_kinds(e.target_kinds)} | "
                f"{len(e.anchors)} | **{len(e.unmatched)}** | "
                f"`{sample.name}` "
                f"(`{sample.module}|0x{sample.addr:08x}`) |"
            )
        if len(cls.propagatable) > top_propagatable:
            lines.append("")
            lines.append(
                f"_(+{len(cls.propagatable) - top_propagatable} more "
                f"clusters truncated; pass `--top-propagatable` to "
                f"see more.)_"
            )
        lines.append("")

    # Anchorless section.
    lines.append("## Anchorless clusters")
    lines.append("")
    if not cls.anchorless:
        lines.append(
            "_No anchorless clusters in this tier "
            "(every cluster has a matched template)._"
        )
        lines.append("")
    else:
        lines.append(
            f"_{len(cls.anchorless)} fingerprints with ≥2 in-tier "
            "unmatched siblings but no matched anchor anywhere. "
            "Hand-draft one of each cluster as the template, then "
            "`cluster_wave_propagate` to the siblings. ROI varies "
            "with cluster size + sig_len; large `sig_len=0` clusters "
            "are speculative (could be coincidentally-same-shape)._"
        )
        lines.append("")
        lines.append(
            "| Rank | Size | Sig | Target kinds | Members | "
            "Sample member |"
        )
        lines.append(
            "|-----:|-----:|----:|--------------|--------:|"
            "---------------|"
        )
        shown = cls.anchorless[:top_anchorless]
        for i, e in enumerate(shown, 1):
            sample = e.unmatched[0]
            lines.append(
                f"| {i} | `0x{e.size:x}` | {e.sig_len} | "
                f"{_fmt_target_kinds(e.target_kinds)} | "
                f"**{len(e.unmatched)}** | "
                f"`{sample.name}` "
                f"(`{sample.module}|0x{sample.addr:08x}`) |"
            )
        if len(cls.anchorless) > top_anchorless:
            lines.append("")
            lines.append(
                f"_(+{len(cls.anchorless) - top_anchorless} more "
                f"clusters truncated; pass `--top-anchorless` to "
                f"see more.)_"
            )
        lines.append("")

    # Singletons summary (no per-fn dump — there are typically thousands).
    lines.append("## Singletons")
    lines.append("")
    if cls.singletons_count == 0:
        lines.append("_No singletons — every in-tier fn has a sibling._")
    else:
        lines.append(
            f"**{cls.singletons_count}** functions with unique "
            f"fingerprints — no template, no sibling, no algorithmic "
            "shortcut. Direct decomp at decomper cadence (typically "
            "10-20 matches per wave)."
        )
    lines.append("")

    return "\n".join(lines) + "\n"


def render_json(
    cls: TierClassification, *, version: str,
) -> str:
    """Machine-readable serialization. Singletons are summarised as a
    count, not enumerated — there are typically thousands."""
    payload = {
        "version": version,
        "tier": cls.tier,
        "totals": {
            "in_tier_total": cls.in_tier_total,
            "propagatable_count": cls.propagatable_count,
            "anchorless_count": cls.anchorless_count,
            "singletons_count": cls.singletons_count,
        },
        "propagatable": [
            {
                "size": e.size,
                "sig_len": e.sig_len,
                "target_kinds": list(e.target_kinds),
                "anchor_count": len(e.anchors),
                "unmatched_count": len(e.unmatched),
                "sample_anchor": {
                    "module": e.anchors[0].module,
                    "addr": e.anchors[0].addr,
                    "name": e.anchors[0].name,
                },
                "unmatched": [
                    {
                        "module": s.module,
                        "addr": s.addr,
                        "name": s.name,
                    } for s in e.unmatched
                ],
            } for e in cls.propagatable
        ],
        "anchorless": [
            {
                "size": e.size,
                "sig_len": e.sig_len,
                "target_kinds": list(e.target_kinds),
                "unmatched_count": len(e.unmatched),
                "unmatched": [
                    {
                        "module": s.module,
                        "addr": s.addr,
                        "name": s.name,
                    } for s in e.unmatched
                ],
            } for e in cls.anchorless
        ],
    }
    return json.dumps(payload, indent=2)


# --------------------------------------------------------------------------- #
# CLI
# --------------------------------------------------------------------------- #

def main() -> int:
    ap = argparse.ArgumentParser(
        description=(
            "Bucket every function in a tier into propagatable / "
            "anchorless-cluster / singleton categories using the v2 "
            "cluster fingerprint."
        ),
    )
    ap.add_argument("--version", default="eur")
    ap.add_argument(
        "--tier", default="hard",
        help="Tier to classify (default: hard). Use any tier name "
             "from the analyzer snapshot — typically `hard`, "
             "`medium`, `easy`, `trivial`, `sinit`.",
    )
    ap.add_argument(
        "--snapshot", type=Path, default=None,
        help="Path to analyze_symbols snapshot.json. Default: "
             "build/<version>/analysis/snapshot.json.",
    )
    ap.add_argument(
        "--top-propagatable", type=int, default=10,
        help="Top-N propagatable clusters shown in Markdown (default 10).",
    )
    ap.add_argument(
        "--top-anchorless", type=int, default=10,
        help="Top-N anchorless clusters shown in Markdown (default 10).",
    )
    ap.add_argument(
        "--out", type=Path, default=None,
        help="Write Markdown report to this path.",
    )
    ap.add_argument(
        "--json", action="store_true",
        help="Emit JSON to stdout instead of Markdown.",
    )
    args = ap.parse_args()

    config_dir = ROOT / "config" / args.version
    if not config_dir.is_dir():
        print(f"error: {config_dir} not found.", file=sys.stderr)
        return 2

    snapshot = args.snapshot or (
        ROOT / "build" / args.version / "analysis" / "snapshot.json"
    )
    if not snapshot.is_file():
        print(
            f"error: {snapshot} not found. Run "
            f"`python tools/analyze_symbols.py --version {args.version}` "
            "first to produce it.",
            file=sys.stderr,
        )
        return 2

    tier_keys = _load_tier_keys(snapshot, args.tier)
    if not tier_keys:
        print(
            f"warning: no symbols in tier `{args.tier}` per "
            f"{snapshot}. Empty classification — possibly a typo?",
            file=sys.stderr,
        )

    modules = load_all(config_dir)
    matched = collect_matched_ranges(config_dir)

    cls = classify_tier(
        modules, matched, tier_keys, tier_name=args.tier,
    )

    if args.json:
        print(render_json(cls, version=args.version))
        return 0

    md = render_markdown(
        cls, version=args.version,
        top_propagatable=args.top_propagatable,
        top_anchorless=args.top_anchorless,
    )
    print(md)

    if args.out:
        args.out.parent.mkdir(parents=True, exist_ok=True)
        args.out.write_text(md, encoding="utf-8")
        try:
            display = args.out.relative_to(ROOT)
        except ValueError:
            display = args.out
        print(
            f"Wrote {display} "
            f"({len(cls.propagatable) + len(cls.anchorless)} cluster(s), "
            f"{cls.singletons_count} singleton(s)).",
            file=sys.stderr,
        )
    return 0


if __name__ == "__main__":
    sys.exit(main())
