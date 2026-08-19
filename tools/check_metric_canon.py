#!/usr/bin/env python3
"""Reject unqualified function-count completion claims in metric docs."""

from __future__ import annotations

import argparse
import re
from pathlib import Path


COUNT_RE = re.compile(
    r"\b(?:\d[\d,]*\s+)?(?:unmatched|matched)\s+functions?\b",
    re.IGNORECASE,
)
COMPLETION_RE = re.compile(
    r"\b(?:closer\s+to\s+done|function-level\s+completion|headline\s+update)\b",
    re.IGNORECASE,
)
AXIS_RE = re.compile(
    r"\b(?:axis|c-decompiled|delink(?:-gap|s)?|metric|natural-c|"
    r"byte-matched|byte-match)\b",
    re.IGNORECASE,
)


def check_text(text: str) -> list[str]:
    """Return paragraphs with count/completion language lacking an axis."""
    errors = []
    for paragraph in re.split(r"\n\s*\n", text):
        if COUNT_RE.search(paragraph) and COMPLETION_RE.search(paragraph):
            if not AXIS_RE.search(paragraph):
                first_line = paragraph.strip().splitlines()[0][:120]
                errors.append(f"unqualified completion claim: {first_line}")
    return errors


def check_paths(paths: list[Path]) -> list[str]:
    errors = []
    for path in paths:
        try:
            text = path.read_text(encoding="utf-8")
        except OSError as exc:
            errors.append(f"{path}: {exc}")
            continue
        errors.extend(f"{path}: {error}" for error in check_text(text))
    return errors


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("paths", nargs="+", type=Path)
    args = parser.parse_args()
    errors = check_paths(args.paths)
    for error in errors:
        print(f"ERROR: {error}")
    return 1 if errors else 0


if __name__ == "__main__":
    raise SystemExit(main())
