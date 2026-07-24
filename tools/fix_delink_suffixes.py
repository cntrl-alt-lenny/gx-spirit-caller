#!/usr/bin/env python3
"""Check and repair routing suffixes in ``delinks.txt`` TU headers.

Routing tiers are encoded in source filenames (``.legacy.c``,
``.legacy_sp3.c``, and ``.thumb.c``). A stale plain ``.c`` header can leave a
build green while making the invariant checker unable to find the TU source.
This preflight reports only an unambiguous routed replacement; ``--fix``
rewrites those headers in place.

Usage::

    python tools/fix_delink_suffixes.py       # check all config/**/delinks.txt
    python tools/fix_delink_suffixes.py --fix
"""
from __future__ import annotations

import argparse
import re
import sys
from pathlib import Path

try:
    from tools.routing_suffixes import ROUTING_SUFFIXES
except ModuleNotFoundError:  # direct ``python tools/fix_delink_suffixes.py`` entry
    from routing_suffixes import ROUTING_SUFFIXES


ROOT = Path(__file__).resolve().parent.parent
_SOURCE_HEADER_RE = re.compile(r"^((?:src|libs)/\S+\.c):\s*$")


def _alternatives(source: str) -> list[str]:
    """Return plain/routed C spellings that can represent ``source``."""
    stem = source[:-2]  # remove the final `.c`
    for suffix in ROUTING_SUFFIXES:
        if stem.endswith(suffix):
            stem = stem[: -len(suffix)]
            break
    return [stem + ".c"] + [stem + suffix + ".c" for suffix in ROUTING_SUFFIXES]


def find_mismatches(text: str, *, root: Path = ROOT) -> list[dict[str, str]]:
    """Find headers whose only existing source spelling is a routed one."""
    issues: list[dict[str, str]] = []
    for line_number, line in enumerate(text.splitlines(), 1):
        match = _SOURCE_HEADER_RE.match(line)
        if not match:
            continue
        declared = match.group(1).replace("\\", "/")
        declared_path = root / declared
        if declared_path.is_file():
            continue
        existing = [
            candidate for candidate in _alternatives(declared)
            if (root / candidate).is_file()
        ]
        if len(existing) == 1 and existing[0] != declared:
            issues.append({
                "line": str(line_number),
                "declared": declared,
                "expected": existing[0],
            })
    return issues


def fix_text(text: str, issues: list[dict[str, str]]) -> str:
    """Apply known replacements to one delinks body, preserving all else."""
    replacements = {int(i["line"]): i["expected"] for i in issues}
    lines = text.splitlines(keepends=True)
    for line_number, expected in replacements.items():
        old = lines[line_number - 1]
        newline = "\n" if old.endswith("\n") else ""
        lines[line_number - 1] = f"{expected}:{newline}"
    return "".join(lines)


def scan(paths: list[Path], *, root: Path = ROOT, fix: bool = False) -> int:
    """Print mismatches and optionally fix them; return the check exit code."""
    total = 0
    for path in paths:
        try:
            text = path.read_text(encoding="utf-8")
        except OSError as exc:
            print(f"fix_delink_suffixes: {path}: {exc}", file=sys.stderr)
            return 2
        issues = find_mismatches(text, root=root)
        if not issues:
            continue
        total += len(issues)
        rel = path.relative_to(root) if path.is_absolute() else path
        for issue in issues:
            action = "FIX" if fix else "MISMATCH"
            print(
                f"{action} {rel}:{issue['line']}: "
                f"{issue['declared']} -> {issue['expected']}"
            )
        if fix:
            path.write_text(fix_text(text, issues), encoding="utf-8")
    if total and not fix:
        print(f"\nfix_delink_suffixes: {total} mismatched routed header(s)")
        return 1
    if total and fix:
        print(f"\nfix_delink_suffixes: fixed {total} routed header(s)")
    else:
        print(f"fix_delink_suffixes: OK ({len(paths)} delinks.txt)")
    return 0


def main(argv: list[str]) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--fix", action="store_true", help="rewrite unambiguous mismatches")
    parser.add_argument("paths", nargs="*", type=Path,
                        help="specific delinks.txt files (default: config/**/delinks.txt)")
    args = parser.parse_args(argv[1:])
    paths = args.paths or sorted((ROOT / "config").rglob("delinks.txt"))
    if not paths:
        print("fix_delink_suffixes: no delinks.txt found", file=sys.stderr)
        return 2
    return scan(paths, root=ROOT, fix=args.fix)


if __name__ == "__main__":
    raise SystemExit(main(sys.argv))
