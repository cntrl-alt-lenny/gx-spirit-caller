#!/usr/bin/env python3
"""check_activation_invariant.py — mechanically gate sweep bookkeeping.

Failure mode (a real off-by-one on an earlier sweep): a PR can add one more
``.c`` than it deletes ``.s`` or flips in ``delinks.txt``.  The ROM can still
build byte-correct because the build graph has a filename fallback, so
``ninja sha1`` does not see the bookkeeping drift.  This checker makes the
three-way sweep count observable and fail-closed.

The invariant is intentionally limited to function TUs.  Data carves create
new symbols without a preceding ``func_*.s`` to remove, so data ``.c`` adds
are reported as informational and never fail the gate.  Routed function
conversions are accepted: ``func_X.s`` may become ``func_X.legacy.c``,
``func_X.legacy_sp3.c``, or ``func_X.thumb.c``.

Usage::

    python tools/check_activation_invariant.py
    python tools/check_activation_invariant.py origin/main..HEAD
    python tools/check_activation_invariant.py --repo C:/repo BASE..HEAD

Exit codes::

    0   function additions, removals, and delinks activations agree
    1   an invariant mismatch was found
    2   usage, git, or repository error
"""

from __future__ import annotations

import argparse
import re
import subprocess
import sys
from collections import Counter
from dataclasses import dataclass
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
_SOURCE_HEADER_RE = re.compile(r"^[+-]((?:src|libs)/\S+):\s*$")
_DIFF_FILE_RE = re.compile(
    r"^diff --git a/(config/.*/delinks\.txt) b/config/.*/delinks\.txt$"
)
_FUNC_S_RE = re.compile(r"^(func_[^.]+)\.s$")
_FUNC_C_RE = re.compile(
    r"^(func_[^.]+)(?:\.legacy|\.legacy_sp3|\.thumb)?\.c$"
)


@dataclass(frozen=True)
class RangeFiles:
    """The source-file delta relevant to the invariant."""

    added_c: tuple[str, ...]
    deleted_func_s: tuple[str, ...]


@dataclass(frozen=True)
class Activations:
    """Net source-header changes in delinks files."""

    added_c: tuple[str, ...]
    removed_func_s: tuple[str, ...]


@dataclass(frozen=True)
class InvariantReport:
    """All counts and mismatches for one git range."""

    git_range: str
    files: RangeFiles
    activations: Activations
    data_additions: tuple[str, ...]
    missing_c_activations: tuple[str, ...]
    missing_s_activations: tuple[str, ...]
    activation_flip_count: int
    count_mismatch: int

    @property
    def function_c_additions(self) -> tuple[str, ...]:
        return tuple(path for path in self.files.added_c if _func_key(path))

    @property
    def activation_flips(self) -> int:
        return self.activation_flip_count

    @property
    def ok(self) -> bool:
        return not (
            self.missing_c_activations
            or self.missing_s_activations
            or self.count_mismatch
        )


def _git(repo: Path, *args: str) -> str:
    try:
        result = subprocess.run(
            ["git", "-C", str(repo), *args],
            text=True,
            capture_output=True,
            check=True,
        )
    except (OSError, subprocess.CalledProcessError) as exc:
        detail = getattr(exc, "stderr", "") or str(exc)
        raise RuntimeError(f"git {' '.join(args)} failed: {detail.strip()}") from exc
    return result.stdout


def _path_key(path: str) -> tuple[str, str] | None:
    """Return ``(parent, function-address-stem)`` for a function source."""
    posix = path.replace("\\", "/")
    parent, _, name = posix.rpartition("/")
    match = _FUNC_S_RE.match(name) or _FUNC_C_RE.match(name)
    if not match:
        return None
    return parent, match.group(1)


def _func_key(path: str) -> tuple[str, str] | None:
    posix = path.replace("\\", "/")
    if not posix.startswith("src/"):
        return None
    return _path_key(posix)


def _is_data_c(path: str) -> bool:
    return path.startswith("src/") and path.endswith((".c", ".cpp")) and not _func_key(path)


def source_delta(repo: Path, git_range: str) -> RangeFiles:
    """Read added C and deleted function assembly paths from a git range."""
    raw = _git(repo, "diff", "--name-status", "--no-renames", git_range, "--", "src")
    added_c: list[str] = []
    deleted_func_s: list[str] = []
    for line in raw.splitlines():
        status, _, path = line.partition("\t")
        if status == "A" and path.endswith((".c", ".cpp")):
            added_c.append(path)
        elif status == "D" and path.endswith(".s") and _func_key(path):
            deleted_func_s.append(path)
    return RangeFiles(tuple(sorted(added_c)), tuple(sorted(deleted_func_s)))


def activation_delta(repo: Path, git_range: str) -> Activations:
    """Read source-header replacements from changed ``delinks.txt`` files."""
    raw = _git(
        repo,
        "diff",
        "--unified=0",
        "--no-renames",
        git_range,
        "--",
        "config",
    )
    added_c: list[str] = []
    removed_func_s: list[str] = []
    in_delinks = False
    for line in raw.splitlines():
        if line.startswith("diff --git "):
            in_delinks = bool(_DIFF_FILE_RE.match(line))
            continue
        if not in_delinks:
            continue
        if line.startswith("+++") or line.startswith("---"):
            continue
        match = _SOURCE_HEADER_RE.match(line)
        if not match:
            continue
        path = match.group(1)
        if line.startswith("+") and path.endswith((".c", ".cpp")):
            added_c.append(path)
        elif line.startswith("-") and path.endswith(".s") and _func_key(path):
            removed_func_s.append(path)
    return Activations(tuple(sorted(added_c)), tuple(sorted(removed_func_s)))


def _paired_flip_count(activations: Activations) -> int:
    """Count ``func_*.s`` -> C-header replacements, including routed C."""
    removed = Counter(_func_key(path) for path in activations.removed_func_s)
    added = Counter(_func_key(path) for path in activations.added_c)
    keys = (set(removed) | set(added)) - {None}
    return sum(min(removed[key], added[key]) for key in keys)


def check_range(repo: Path, git_range: str) -> InvariantReport:
    files = source_delta(repo, git_range)
    activations = activation_delta(repo, git_range)
    added_by_key = Counter(_func_key(path) for path in activations.added_c)
    # Data additions are deliberately informational only.  They have no
    # preceding function .s to replace, so they must not make a correct data
    # carve fail the function invariant.  Function C additions still require
    # a matching activation by parent directory + address stem.
    missing_c = tuple(
        path for path in files.added_c
        if _func_key(path) and _func_key(path) not in added_by_key
    )
    activated_c_by_key = Counter(_func_key(path) for path in activations.added_c)
    missing_s = tuple(
        path for path in files.deleted_func_s
        if activated_c_by_key[_func_key(path)] == 0
    )
    flips = _paired_flip_count(activations)
    function_c_count = sum(bool(_func_key(path)) for path in files.added_c)
    deleted_s_count = len(files.deleted_func_s)
    # A flip count is only valid when it accounts for both sides of the
    # function conversion.  Expose the drift as a single failure count while
    # the detailed missing lists explain which side is absent.
    unmatched = abs(function_c_count - flips) + abs(deleted_s_count - flips)
    return InvariantReport(
        git_range=git_range,
        files=files,
        activations=activations,
        data_additions=tuple(path for path in files.added_c if _is_data_c(path)),
        missing_c_activations=tuple(sorted(set(missing_c))),
        missing_s_activations=tuple(sorted(set(missing_s))),
        activation_flip_count=flips,
        count_mismatch=unmatched,
    )


def print_report(report: InvariantReport) -> None:
    function_count = len(report.function_c_additions)
    deleted_count = len(report.files.deleted_func_s)
    print(f"range: {report.git_range}")
    print(f"function .c added:       {function_count}")
    print(f"function .s deleted:     {deleted_count}")
    print(f"delinks activations:     {report.activation_flips}")
    print(f"data .c additions:       {len(report.data_additions)} (informational)")
    if report.data_additions:
        for path in report.data_additions:
            state = "activation present" if path in report.activations.added_c else "no activation (informational)"
            print(f"  DATA: {path} [{state}]")
    for path in report.missing_c_activations:
        print(f"MISSING delinks activation for added C: {path}")
    for path in report.missing_s_activations:
        print(f"MISSING delinks activation for deleted S: {path}")
    if report.ok:
        print("check_activation_invariant: OK")
    else:
        print("check_activation_invariant: FAIL")


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    parser.add_argument("git_range", nargs="?", default="origin/main..HEAD")
    parser.add_argument(
        "--repo",
        type=Path,
        default=ROOT,
        help="repository to inspect (default: this repository; for local fixtures)",
    )
    args = parser.parse_args(argv)
    repo = args.repo.resolve()
    if not (repo / ".git").exists():
        print(f"check_activation_invariant: no git repository at {repo}", file=sys.stderr)
        return 2
    try:
        report = check_range(repo, args.git_range)
    except RuntimeError as exc:
        print(f"check_activation_invariant: {exc}", file=sys.stderr)
        return 2
    print_report(report)
    return 0 if report.ok else 1


if __name__ == "__main__":
    raise SystemExit(main())
