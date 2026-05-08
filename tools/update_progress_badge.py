#!/usr/bin/env python3

"""
Compute the decomp progress percentage and update README.md's shields.io
badge to match.

Pulls the percentage from `tools/progress.py --json` (which prefers
build/<ver>/report.json and falls back to symbols.txt counting), then
rewrites the single `img.shields.io/badge/Progress-...` line in README.md.

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

Idempotent: exits 0 with no diff if the badge is already correct.
Exit code 0 always (no diff and successful update both succeed); exit
code 1 only on hard error (missing README, malformed shields URL, etc.).

Usage:
    python tools/update_progress_badge.py                  # default: eur
    python tools/update_progress_badge.py --version usa
    python tools/update_progress_badge.py --check          # fail if out of date
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

# Matches: https://img.shields.io/badge/Progress-<text>-<color>...
# Captures the whole shields URL so we can replace the text + color.
BADGE_RE = re.compile(
    r"(https://img\.shields\.io/badge/Progress-)"  # prefix
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
    """Run progress.py --json and return matched-code percentage as
    a float. Code-only by design — see module docstring; the data
    tier is structurally 0% today and dragging it into the denominator
    under-represents visible progress."""
    out = subprocess.check_output(
        [sys.executable, str(PROGRESS), "--version", version, "--json"],
        text=True,
    )
    data = json.loads(out)

    # Stub state (no report.json yet): always 0%.
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


def update_readme(text: str, color: str) -> tuple[str, str | None]:
    """Apply the new badge text+color to README contents.

    Returns (new_contents, change_summary). change_summary is None when
    the badge is already correct."""
    contents = README.read_text(encoding="utf-8")

    matches = list(BADGE_RE.finditer(contents))
    if not matches:
        raise SystemExit(f"could not find Progress badge URL in {README.relative_to(ROOT)}")
    if len(matches) > 1:
        raise SystemExit(f"found {len(matches)} Progress badges in {README.relative_to(ROOT)}; expected 1")

    m = matches[0]
    old_text, old_color = m.group(2), m.group(4)
    if old_text == text and old_color == color:
        return contents, None

    new_contents = contents[:m.start()] + f"{m.group(1)}{text}-{color}" + contents[m.end():]
    summary = f"{old_text}-{old_color} -> {text}-{color}"
    return new_contents, summary


def main() -> int:
    ap = argparse.ArgumentParser(description="Update README progress badge from progress.py")
    ap.add_argument("--version", default="eur", help='Game version (default: "eur")')
    ap.add_argument("--check", action="store_true",
                    help="Exit 1 if the badge is out of date instead of writing")
    args = ap.parse_args()

    pct = compute_pct(args.version)
    text, color = render_badge_url(pct)
    new_contents, summary = update_readme(text, color)

    if summary is None:
        print(f"badge already current: {text}-{color} ({pct:.2f}%)")
        return 0

    if args.check:
        print(f"badge out of date: {summary}", file=sys.stderr)
        return 1

    README.write_text(new_contents, encoding="utf-8")
    print(f"updated README badge: {summary}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
