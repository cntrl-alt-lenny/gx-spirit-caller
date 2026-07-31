#!/usr/bin/env python3
"""Cleanly park (abandon) a single decompilation attempt.

Flips the function's delinks.txt entry back to `.s:` via a surgical
single-line edit (reusing batch_sha1's `_flip_delinks`), then restores
the original `.s` file from git HEAD and removes the abandoned `.c`.

This replaces the `git checkout -- <module>/delinks.txt <file>.s` idiom,
which restores the ENTIRE delinks.txt to HEAD and silently discards any
other already-shipped candidate's uncommitted edit to the same shared
file in the same worktree session — hit independently twice in
cm-ov002-unknown-sweep-8 (see
docs/research/cm-ov002-unknown-sweep-8-2026-07-31.md). Reverting the
single `.s` file via `git checkout` remains safe on its own (each
function owns exactly one `.s` file, no cross-function collision) —
only delinks.txt, a file shared by every function in its module, needed
the surgical fix.

Usage: python tools/park_one.py src/main/func_02012345.c [--region eur]
"""
from __future__ import annotations

import argparse
import subprocess
import sys
from pathlib import Path

from batch_sha1 import ROOT, _c_to_s_rel, _flip_delinks, _is_already_applied


def park_one(c_rel: str, region: str) -> int:
    """Ordered so the riskiest, most failure-prone step (restoring the .s
    from git) happens BEFORE any mutation — a failure here leaves the
    tree completely untouched instead of a half-flipped delinks.txt."""
    if not (ROOT / c_rel).is_file():
        print(f"ERROR: {c_rel} does not exist", file=sys.stderr)
        return 1

    s_rel = _c_to_s_rel(c_rel)

    delinks_path = _is_already_applied(c_rel, region)
    if delinks_path is None:
        print(
            f"ERROR: {c_rel} is not the active delinks.txt entry for "
            f"region {region} (nothing to flip — maybe already parked, "
            f"or never applied)",
            file=sys.stderr,
        )
        return 1

    s_path = ROOT / s_rel
    if not s_path.is_file():
        result = subprocess.run(
            ["git", "checkout", "--", s_rel], cwd=ROOT, capture_output=True, text=True,
        )
        if result.returncode != 0:
            print(
                f"ERROR restoring {s_rel} from git HEAD: {result.stderr.strip()}\n"
                f"Nothing was changed — delinks.txt was not touched. If {s_rel} was "
                f"committed away in an earlier commit this session (not just an "
                f"uncommitted draft), restore it explicitly first, e.g.\n"
                f"  git checkout <commit-before-it-was-removed> -- {s_rel}",
                file=sys.stderr,
            )
            return 1
        print(f"restored {s_rel} from git HEAD")
    else:
        print(f"{s_rel} already present on disk, left untouched")

    if not _flip_delinks(delinks_path, c_rel, s_rel):
        print(f"ERROR: could not find header line '{c_rel}:' in {delinks_path}", file=sys.stderr)
        return 1
    print(f"flipped {delinks_path}: {c_rel}: -> {s_rel}:")

    (ROOT / c_rel).unlink()
    print(f"removed {c_rel}")
    return 0


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("c_path", help="Path to the .c file to abandon (relative to repo root, or absolute)")
    parser.add_argument("--region", default="eur", choices=("eur", "usa", "jpn"))
    args = parser.parse_args(argv)

    c_path = Path(args.c_path)
    c_rel = str(c_path.relative_to(ROOT) if c_path.is_absolute() else c_path).replace("\\", "/")

    return park_one(c_rel, args.region)


if __name__ == "__main__":
    raise SystemExit(main())
