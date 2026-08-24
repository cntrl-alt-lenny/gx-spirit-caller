#!/usr/bin/env python3
"""Record one successfully-shipped C-match attempt in attempts.tsv.

cm-ledger-park-bias (2026-08-17): `park_one.py` is the only recorder in
regular use, and it always writes `result=parked` -- ships only ever reach
the ledger when a lane adds them by hand, which mostly doesn't happen (0
shipped rows across 5 of the last 8 main-tier-sweep/unknown-sweep rounds).
This is the ship-side counterpart, reusing the SAME validated append path
`park_one.py` uses (`_validate_ledger` / `audit_event`) so a shipped row
can never violate the schema `validate_attempts.py` checks.

Unlike `park_one.py`, this tool performs NO file or delinks.txt mutation --
run it AFTER the normal ship flow (write the `.c`, flip delinks.txt via
hand-edit or `batch_sha1.py`, confirm via gate) once `c_path` is already
the delinks.txt TU's active entry. `text_size` is read from that now-active
entry directly (not the old `.s` header, which no longer exists post-flip).

Usage:
    python tools/record_shipped.py src/main/func_02012345.c [--region eur]
        [--brief cm-main-wall-filtered-sweep-1-batch1 --shape ... ]
"""
from __future__ import annotations

import argparse
import re
import sys
from pathlib import Path

from batch_sha1 import ROOT, _is_already_applied
from park_one import _ATTEMPTS_REL, _ledger_identity, _record_attempt, _validate_ledger


def _text_size_active(delinks_path: Path, c_rel: str) -> str:
    """Read the now-active TU's committed `.text` byte span."""
    try:
        lines = delinks_path.read_text(encoding="utf-8").splitlines()
    except OSError:
        return "unknown"
    for i, line in enumerate(lines):
        if line != f"{c_rel}:":
            continue
        for child in lines[i + 1:]:
            if child and not child[0].isspace():
                break
            match = re.search(
                r"\.text start:0x([0-9a-fA-F]+) end:0x([0-9a-fA-F]+)", child,
            )
            if match:
                return str(int(match.group(2), 16) - int(match.group(1), 16))
        break
    return "unknown"


def record_shipped(
    c_rel: str,
    region: str,
    *,
    tier: str = "default",
    shape: str = "unknown",
    match_pct: str = "100",
    brief: str = "unknown",
    attempts: int | str = "",
) -> int:
    delinks_path = _is_already_applied(c_rel, region)
    if delinks_path is None:
        print(
            f"ERROR: {c_rel} is not the active delinks.txt entry for region "
            f"{region} -- ship the delinks.txt flip first (batch_sha1.py or "
            "a hand-edit), then record.",
            file=sys.stderr,
        )
        return 1
    try:
        _ledger_identity(c_rel)
    except ValueError as exc:
        print(f"ERROR: {exc}", file=sys.stderr)
        return 1
    try:
        _validate_ledger(ROOT / _ATTEMPTS_REL)
    except (OSError, ValueError) as exc:
        print(f"ERROR: attempts ledger preflight failed: {exc}", file=sys.stderr)
        return 1

    text_size = _text_size_active(delinks_path, c_rel)
    _record_attempt(
        c_rel,
        text_size=text_size,
        tier=tier,
        shape=shape,
        match_pct=match_pct,
        park_class="n/a",
        brief=brief,
        result="shipped",
        attempts=attempts,
    )
    return 0


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("c_path", help="Path to the shipped .c file (relative to repo root, or absolute)")
    parser.add_argument("--region", default="eur", choices=("eur", "usa", "jpn"))
    parser.add_argument("--tier", default="default")
    parser.add_argument("--shape", default="unknown")
    parser.add_argument("--match-pct", default="100")
    parser.add_argument("--brief", default="unknown")
    parser.add_argument("--attempts", default="")
    args = parser.parse_args(argv)

    c_path = Path(args.c_path)
    c_rel = str(c_path.relative_to(ROOT) if c_path.is_absolute() else c_path).replace("\\", "/")

    return record_shipped(
        c_rel, args.region, tier=args.tier, shape=args.shape,
        match_pct=args.match_pct, brief=args.brief, attempts=args.attempts,
    )


if __name__ == "__main__":
    raise SystemExit(main())
