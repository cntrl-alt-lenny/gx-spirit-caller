#!/usr/bin/env python3
"""READ-ONLY census: what remains of the EUR code frontier, by size band,
at current pool state (q-eur-next-frontier).

Historical band rates (sweep-N, drain-N, this project's own briefs) each
describe the pool AT THE TIME they were measured -- `docs/research/
band-rate-vintage.md` is the standing warning that these figures go stale
as soon as the population is picked over. This tool re-derives every
band's CURRENT candidate count/bytes in one pass, so "what's left" never
has to be quoted forward from a stale brief.

One unfiltered `wall_aware_headroom.scan()` call (exclude-attempted) is
bucketed in pure Python by size band and, separately, by the campaign's
own dispatch-ready filter (`>=4` exact `bl`/`blx` calls -- the SAME two-part
filter `docs/dashboard.md`'s own remaining-pool table uses and documents:
`.text` size alone is not the real dispatch criterion). This mirrors
`generate_dashboard.py`'s own "scan once, bucket many times" pattern
instead of re-scanning `src/**/*.s` once per band (14 bands x scans would
each re-walk the whole tree).

No build, no baserom, no toolchain: `scan()` only reads committed `.s`
disassembly text and `attempts.tsv`.

Usage:
    python tools/eur_frontier_census.py
    python tools/eur_frontier_census.py --json
"""
from __future__ import annotations

import argparse
import json
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(Path(__file__).resolve().parent))

from wall_aware_headroom import scan  # noqa: E402

# The bands this project has historically dispatched on (see
# docs/research/band-rate-vintage.md and the queue's own recap). 377-512 B
# is included even though no historical figure exists for it in this
# project's records -- its absence from every prior recap is itself part
# of what this census is checking.
BANDS: tuple[tuple[str, int | None, int | None], ...] = (
    ("<=192 B", None, 192),
    ("193-256 B", 193, 256),
    ("257-320 B", 257, 320),
    ("321-376 B", 321, 376),
    ("377-512 B", 377, 512),
    ("513-1023 B", 513, 1023),
    (">=1024 B", 1024, None),
)

DISPATCH_MIN_BL_BLX = 4


def _all_candidate_files(per: dict[str, dict]) -> list[dict]:
    """Every candidate file's metadata (text_size, bl_blx, ...) across
    every module, from one scan() result -- mirrors generate_dashboard.py's
    `_all_candidate_sizes()`, but keeps the full metadata dict (not just
    the size) so bl_blx can be bucketed too."""
    return [
        f
        for d in per.values()
        for key in ("coercible_files", "unknown_files", "no_marker_files")
        for f in d[key]
    ]


def _in_band(size: int, lo: int | None, hi: int | None) -> bool:
    return (lo is None or size >= lo) and (hi is None or size <= hi)


def band_totals(files: list[dict]) -> list[dict]:
    """For every band: dispatch-ready (size band AND >=4 bl/blx, the
    campaign's actual dispatch criterion) and size-only (size band alone,
    the broader upper-bound figure) candidate/byte counts."""
    out = []
    for label, lo, hi in BANDS:
        in_band = [f for f in files if _in_band(int(f.get("text_size") or 0), lo, hi)]
        dispatch = [f for f in in_band if int(f.get("bl_blx") or 0) >= DISPATCH_MIN_BL_BLX]
        out.append({
            "band": label, "min_size": lo, "max_size": hi,
            "dispatch_ready": {
                "candidates": len(dispatch),
                "bytes": sum(int(f.get("text_size") or 0) for f in dispatch),
            },
            "size_only": {
                "candidates": len(in_band),
                "bytes": sum(int(f.get("text_size") or 0) for f in in_band),
            },
        })
    return out


def main(argv: list[str] | None = None) -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--json", action="store_true", help="emit JSON instead of a table")
    args = ap.parse_args(argv)

    # min_bl_blx=0 (NOT None): scan() only computes and attaches each
    # file's bl_blx count when min_bl_blx is passed at all (body_call_count()
    # is real per-file disassembly-text parsing, gated behind the flag for
    # performance when the caller doesn't need it) -- passing 0 gets that
    # count attached to every file's metadata without filtering anything
    # out itself (bl_blx can never be < 0), so band_totals() can bucket by
    # bl_blx afterward. Passing None here would silently leave "bl_blx"
    # unset on every file and make every dispatch-ready bucket empty.
    per = scan(None, None, True, None, None, min_bl_blx=0)
    files = _all_candidate_files(per)
    totals = band_totals(files)

    if args.json:
        print(json.dumps(totals, indent=1))
        return 0

    print(f"{'band':<12} {'dispatch cand':>13} {'dispatch B':>11} "
          f"{'size-only cand':>15} {'size-only B':>12}")
    for row in totals:
        d, s = row["dispatch_ready"], row["size_only"]
        print(f"{row['band']:<12} {d['candidates']:>13} {d['bytes']:>11} "
              f"{s['candidates']:>15} {s['bytes']:>12}")
    dispatch_total = sum(r["dispatch_ready"]["bytes"] for r in totals)
    print(f"\ndispatch-ready total: {sum(r['dispatch_ready']['candidates'] for r in totals)} "
          f"candidates / {dispatch_total:,} B")
    return 0


if __name__ == "__main__":
    sys.exit(main())
