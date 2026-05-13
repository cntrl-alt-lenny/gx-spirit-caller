#!/usr/bin/env python3

"""
Compute the decomp progress percentage for each region and update
README.md's per-region shields.io badges to match.

Pulls per-region percentages from `tools/progress.py --json` (which
prefers build/<ver>/report.json and falls back to symbols.txt counting),
then rewrites the three `img.shields.io/badge/{EUR,USA,JPN}-...`
lines in README.md.

**Multi-region.** Before 2026-05-13 the badge was single-region (EUR
only) because USA + JPN weren't bootstrapped. Once we wanted USA/JPN
visible too — even at 0% — the tool needs to emit one badge per region.
Non-bootstrapped regions cleanly report `state: "stub"` from
progress.py and resolve to 0.00% / red.

**Code-only formula.** The badge tracks `matched_code / total_code`,
matching the headline progress.py prints in its human-readable
output (`  code:  X / Y bytes  (Z%)`). Earlier versions used
`(matched_code + matched_data) / (total_code + total_data)`, which
drags the badge down because the data tier is structurally 0%-matched
until data-tier work begins (today: data total 4.7 MB, all
unmatched). Including data in the denominator made the badge under-
represent visible progress: 0.39% (code+data) vs 1.18% (code-only)
on 2026-05-08. Revisit when data-tier matching has actual
forward motion.

Idempotent: exits 0 with no diff if all badges are already correct.
Exit code 0 always (no diff and successful update both succeed); exit
code 1 only on hard error (missing README, malformed shields URL,
wrong badge count, etc.).

Usage:
    python tools/update_progress_badge.py                  # update all 3 regions
    python tools/update_progress_badge.py --version usa    # update USA only
    python tools/update_progress_badge.py --check          # fail if any out of date
"""

from __future__ import annotations

import argparse
import json
import re
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
README = ROOT / "README.md"
PROGRESS = ROOT / "tools" / "progress.py"

# Regions in the order they appear in README. Order matters for the
# "found N badges, expected 3" guardrail.
REGIONS: tuple[str, ...] = ("eur", "usa", "jpn")
REGION_LABEL = {"eur": "EUR", "usa": "USA", "jpn": "JPN"}

# Matches a single per-region badge in README. We compile one regex
# per region so each badge slot has its own match-and-replace.
def _badge_re(region: str) -> re.Pattern[str]:
    label = REGION_LABEL[region]
    return re.compile(
        rf"(https://img\.shields\.io/badge/{label}-)"  # prefix incl region label
        r"([^-\s\"<]+)"                                 # text
        r"(-)"                                          # separator
        r"([A-Za-z0-9]+)"                               # color
    )


def color_for(pct: float) -> str:
    if pct >= 100.0:
        return "brightgreen"
    if pct >= 75.0:
        return "green"
    if pct >= 50.0:
        return "yellowgreen"
    if pct >= 25.0:
        return "yellow"
    if pct >= 10.0:
        return "orange"
    return "red"


def compute_pct(version: str) -> float:
    """Run progress.py --json for one region and return matched-code
    percentage as a float. Code-only by design — see module docstring.
    Returns 0.0 for non-bootstrapped regions (progress.py reports
    `state: "stub"` when no config/<ver>/ exists)."""
    out = subprocess.check_output(
        [sys.executable, str(PROGRESS), "--version", version, "--json"],
        text=True,
    )
    data = json.loads(out)

    # Stub state (no config/<ver>/ or no report.json yet): always 0%.
    if data.get("state") == "stub":
        return 0.0

    measures = data.get("measures") or {}
    matched_code = int(measures.get("matched_code") or 0)
    total_code = int(measures.get("total_code") or 0)
    return (matched_code / total_code * 100.0) if total_code else 0.0


def render_badge_url(pct: float) -> tuple[str, str]:
    """Return (badge_text, color) for the given pct."""
    text = f"{pct:.2f}%25"  # %25 = URL-encoded %
    return text, color_for(pct)


def update_readme_for_region(
    contents: str, region: str, text: str, color: str
) -> tuple[str, str | None]:
    """Apply the new badge text+color for one region to README contents.

    Returns (new_contents, change_summary). change_summary is None when
    the badge is already correct."""
    badge_re = _badge_re(region)
    matches = list(badge_re.finditer(contents))
    label = REGION_LABEL[region]
    if not matches:
        raise SystemExit(
            f"could not find {label} progress badge URL in {README.relative_to(ROOT)}"
        )
    if len(matches) > 1:
        raise SystemExit(
            f"found {len(matches)} {label} progress badges in "
            f"{README.relative_to(ROOT)}; expected 1"
        )

    m = matches[0]
    old_text, old_color = m.group(2), m.group(4)
    if old_text == text and old_color == color:
        return contents, None

    new_contents = contents[: m.start()] + f"{m.group(1)}{text}-{color}" + contents[m.end():]
    summary = f"{label}: {old_text}-{old_color} -> {text}-{color}"
    return new_contents, summary


def main() -> int:
    ap = argparse.ArgumentParser(
        description="Update README per-region progress badges from progress.py"
    )
    ap.add_argument(
        "--version",
        default=None,
        choices=REGIONS,
        help='Only update one region (default: all 3)',
    )
    ap.add_argument(
        "--check",
        action="store_true",
        help="Exit 1 if any badge is out of date instead of writing",
    )
    args = ap.parse_args()

    regions = (args.version,) if args.version else REGIONS

    contents = README.read_text(encoding="utf-8")
    summaries: list[str] = []

    for region in regions:
        pct = compute_pct(region)
        text, color = render_badge_url(pct)
        contents, summary = update_readme_for_region(contents, region, text, color)
        if summary is not None:
            summaries.append(summary)

    if not summaries:
        print(f"badges already current ({', '.join(regions)})")
        return 0

    if args.check:
        print("badges out of date:\n  " + "\n  ".join(summaries), file=sys.stderr)
        return 1

    README.write_text(contents, encoding="utf-8")
    print("updated README badges:\n  " + "\n  ".join(summaries))
    return 0


if __name__ == "__main__":
    sys.exit(main())
