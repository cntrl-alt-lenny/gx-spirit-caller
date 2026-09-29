#!/usr/bin/env python3
"""
check_baseline_growth.py — a baseline may only shrink.

`tools/fake_match_baseline.txt` and `tools/reference_baseline.txt` tolerate the
findings that were on `main` when the checks arrived. Each check has a
`--write-baseline` that records whatever it finds today, so on its own it
launders a new finding: fail, rewrite the baseline, pass. This check closes
that (round 005). It compares each baseline in the working tree with the same
file at the pull request's merge base and fails when any entry was ADDED.
Removing entries (a fixed finding, a stale line) always passes and needs
nothing else recorded. A file that did not exist at the merge base is the
change that introduces its check: it is reported, not compared.

Format-2 baselines list one finding per line, so the comparison is set
difference: swapping one entry for another in the same unit adds an entry and
fails. A format-1 base (per-unit counts; the migration commit only) is
compared per coarse key: the entries under a key must not outnumber the
count the old file allowed for it.

Usage:
    python tools/check_baseline_growth.py --base origin/main
    python tools/check_baseline_growth.py --base HEAD --file tools/reference_baseline.txt

`--base` is any commit-ish; the comparison point is `git merge-base <base> HEAD`.
Exit codes: 0 no growth, 1 growth, 2 git or file problem.
"""
from __future__ import annotations

import argparse
import subprocess
import sys
from collections import Counter
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import baseline_file  # noqa: E402

ROOT = Path(__file__).resolve().parent.parent
DEFAULT_FILES = ("tools/fake_match_baseline.txt", "tools/reference_baseline.txt")


def _git(root: Path, *args: str) -> subprocess.CompletedProcess:
    return subprocess.run(["git", *args], cwd=root, capture_output=True, text=True, check=False)


def growth(base_text: str | None, new_text: str, name: str) -> list[str]:
    """Return one line per baseline entry the new text adds over the base."""
    new_fmt, new_entries = baseline_file.parse(new_text, source=name)
    base_fmt, base_entries = baseline_file.parse(base_text or "", source=f"{name} at base")
    if new_fmt != 2 and new_entries:
        return [f"{name} is not a format-2 baseline: regenerate it with --write-baseline"]
    if base_fmt == 2 or not base_entries:
        return ["\t".join(e) for e in sorted(set(new_entries) - set(base_entries))]
    # Format-1 base: (key..., count). The new entries under a key may not
    # outnumber the count the old file allowed.
    budget = Counter({e[:-1]: int(e[-1]) for e in base_entries})
    used: Counter = Counter()
    added = []
    for entry in sorted(new_entries):
        key = _coarse_key(entry)
        used[key] += 1
        if used[key] > budget.get(key, 0):
            added.append("\t".join(entry))
    return added


def _coarse_key(entry: tuple[str, ...]) -> tuple[str, ...]:
    """Map a format-2 entry onto the format-1 key it descends from."""
    if len(entry) >= 4 and entry[0] in ("eur", "usa", "jpn"):   # region, unit, kind, detail
        return entry[:3]
    return entry[:2]                                            # rule, path, ...


def main(argv: list[str] | None = None) -> int:
    ap = argparse.ArgumentParser(description=__doc__.split("\n\n")[0])
    ap.add_argument("--base", required=True, help="commit-ish the pull request targets")
    ap.add_argument("--file", action="append", help="baseline file (repeatable; default: both)")
    ap.add_argument("--root", type=Path, default=ROOT)
    args = ap.parse_args(argv)

    root = args.root.resolve()
    merge_base = _git(root, "merge-base", args.base, "HEAD")
    if merge_base.returncode != 0 or not merge_base.stdout.strip():
        print(f"check_baseline_growth: no merge base with {args.base!r}: {merge_base.stderr.strip()}",
              file=sys.stderr)
        return 2
    base_sha = merge_base.stdout.strip()
    failed = False
    for name in args.file or DEFAULT_FILES:
        path = root / name
        if not path.is_file():
            print(f"check_baseline_growth: {name}: missing", file=sys.stderr)
            return 2
        shown = _git(root, "show", f"{base_sha}:{name}")
        base_text = shown.stdout if shown.returncode == 0 else None
        if base_text is None:
            # The file did not exist at the merge base (the change that
            # introduces a check), so there is nothing it could have grown.
            print(f"check_baseline_growth: {name}: introduced by this change, "
                  f"nothing to compare with at {base_sha[:12]}")
            continue
        try:
            added = growth(base_text, path.read_text(encoding="utf-8"), name)
        except baseline_file.BaselineError as exc:
            print(f"check_baseline_growth: {exc}", file=sys.stderr)
            return 2
        total = len(baseline_file.parse(path.read_text(encoding="utf-8"))[1])
        print(f"check_baseline_growth: {name}: {total} entries, {len(added)} added since "
              f"{base_sha[:12]}")
        for line in added[:20]:
            print(f"  ADDED: {line}")
        if len(added) > 20:
            print(f"  ... and {len(added) - 20} more")
        failed = failed or bool(added)
    if failed:
        print("check_baseline_growth: FAIL - a baseline may only shrink; fix the finding "
              "instead of recording it")
        return 1
    print("check_baseline_growth: OK")
    return 0


if __name__ == "__main__":
    sys.exit(main())
