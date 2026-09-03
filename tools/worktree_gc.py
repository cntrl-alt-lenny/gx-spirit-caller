#!/usr/bin/env python3
"""Report and safely prune stale registered git worktrees.

Only a clean worktree whose HEAD is an ancestor of ``origin/main`` can be
removed.  Unregistered worktree-like directories are reported for human
review and are never removed by this tool.
"""

from __future__ import annotations

import argparse
import os
import re
import subprocess
from dataclasses import dataclass
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent

# WHY THIS IS A PATTERN AND NOT A LIST OF DIRECTORY NAMES.
#
# It used to be a literal list, and it drifted from reality without anything
# noticing. The list named `decomper` / `scaffolder` -- the role names
# `AGENTS.md` documents -- while the live Mac worktrees were
# `claude-decomper-queue` and `claude-scaffolder-queue`. Neither was on it, so
# both classified REMOVABLE ("clean and merged into origin/main") and a single
# `--prune` would have deleted two live lanes. The tool's own test looked like
# it covered this (`test_mac_lane_basenames_keep_live_lanes_...`) but exercised
# the two `codex-` names that WERE on the list, so it stayed green throughout.
#
# The polarity was the real defect. `tools/prune_worktrees.py` -- the sibling
# that does this job safely -- only ever considers `claude-<digits>` sandboxes
# for removal and touches nothing else, so an unrecognised directory is safe by
# default. Here an unrecognised directory was *deletable* by default, which put
# the burden of safety on a hand-maintained list staying in sync with four
# machines. It did not.
#
# So: derive lane protection from the ROLE vocabulary AGENTS.md declares
# normative, and let any provider prefix or queue suffix wrap it. That covers
# `claude-decomper-queue`, `codex-scaffolder-queue`, a bare `decomper` after a
# rename, and a `gemini-scaffolder-queue` nobody has created yet, without
# anyone remembering to edit this file.
#
# `tests/test_worktree_gc.py` pins LANE_ROLES against `make_kickoff.py`'s own
# lane table so the two cannot diverge silently.
LANE_ROLES = frozenset({"brain", "decomper", "scaffolder", "kb-map", "kb-types"})
_PROVIDER_PREFIX = r"(?:[a-z0-9]+-)?"
# `-queue` is the Mac lane suffix; `-claude-<digits>` is the sandbox variant
# `tools/prune_worktrees.py` also treats as permanent -- keep the two tools
# agreeing about what a lane looks like.
_QUEUE_SUFFIX = r"(?:-queue|-claude-\d+)?"
LANE_BASENAME_RE = re.compile(
    rf"^{_PROVIDER_PREFIX}(?:{'|'.join(sorted(re.escape(r) for r in LANE_ROLES))})"
    rf"{_QUEUE_SUFFIX}$"
)

# Explicit additions for anything the pattern cannot express. Kept so a host
# can pin an oddly-named standing worktree; NOT the safety mechanism any more.
KEEP_BASENAMES: frozenset[str] = frozenset()
WORKTREE_MARKERS = frozenset({"config", "include", "libs", "src", "tests", "tools"})


def is_lane_basename(name: str) -> bool:
    """True for a standing lane worktree, whatever provider named it."""
    return bool(LANE_BASENAME_RE.match(name))


@dataclass(frozen=True)
class WorktreeEntry:
    path: Path
    head: str
    branch: str | None
    locked: str | None = None
    prunable: str | None = None


@dataclass(frozen=True)
class Classification:
    entry: WorktreeEntry
    state: str
    reason: str


def _run(args: list[str], cwd: Path | None = None) -> subprocess.CompletedProcess[str]:
    actual_cwd = ROOT if cwd is None else cwd
    return subprocess.run(args, cwd=str(actual_cwd), capture_output=True, text=True)


def _parse_worktree_list(output: str) -> list[WorktreeEntry]:
    entries: list[WorktreeEntry] = []
    fields: dict[str, str] = {}

    def finish() -> None:
        if "worktree" not in fields or "HEAD" not in fields:
            return
        entries.append(
            WorktreeEntry(
                path=Path(fields["worktree"]),
                head=fields["HEAD"],
                branch=fields.get("branch"),
                locked=fields.get("locked"),
                prunable=fields.get("prunable"),
            )
        )

    for line in output.splitlines():
        if not line:
            finish()
            fields = {}
            continue
        key, _, value = line.partition(" ")
        if key == "worktree":
            fields[key] = value
        elif key == "HEAD":
            fields[key] = value
        elif key == "branch":
            fields[key] = value.removeprefix("refs/heads/")
        elif key in {"locked", "prunable"}:
            fields[key] = value or "(no reason given)"
    finish()
    return entries


def registered_worktrees(repo: Path | None = None) -> list[WorktreeEntry]:
    repo = ROOT if repo is None else repo
    result = _run(["git", "worktree", "list", "--porcelain"], cwd=repo)
    if result.returncode:
        raise RuntimeError(result.stderr.strip() or "git worktree list failed")
    return _parse_worktree_list(result.stdout)


def _is_clean(entry: WorktreeEntry, repo: Path) -> bool:
    result = _run(["git", "-C", str(entry.path), "status", "--porcelain"], cwd=repo)
    return result.returncode == 0 and not result.stdout.strip()


def _is_ancestor(entry: WorktreeEntry, repo: Path) -> tuple[bool, str | None]:
    result = _run(
        ["git", "merge-base", "--is-ancestor", entry.head, "origin/main"],
        cwd=repo,
    )
    if result.returncode == 0:
        return True, None
    if result.returncode == 1:
        return False, "unmerged from origin/main"
    return False, "could not verify origin/main"


def classify_worktree(
    entry: WorktreeEntry,
    repo: Path | None = None,
    keep: set[str] | frozenset[str] = frozenset(),
) -> Classification:
    """Classify one registered worktree without changing repository state."""
    repo = ROOT if repo is None else repo
    name = entry.path.name
    if name in KEEP_BASENAMES | set(keep):
        return Classification(entry, "KEEP", "pinned basename")
    if is_lane_basename(name):
        return Classification(entry, "KEEP", "standing lane basename")
    reasons: list[str] = []
    if entry.locked is not None:
        reasons.append(f"locked: {entry.locked}")
    if not _is_clean(entry, repo):
        reasons.append("dirty")
    ancestor, ancestor_reason = _is_ancestor(entry, repo)
    if not ancestor and ancestor_reason:
        reasons.append(ancestor_reason)
    if reasons:
        return Classification(entry, "HELD", "; ".join(reasons))
    return Classification(entry, "REMOVABLE", "clean and merged into origin/main")


def _directory_size(path: Path) -> int:
    total = 0
    for root, dirs, files in os.walk(path, followlinks=False):
        dirs[:] = [name for name in dirs if not (Path(root) / name).is_symlink()]
        for name in files:
            try:
                total += (Path(root) / name).stat().st_size
            except OSError:
                continue
    return total


def _human_size(size: int) -> str:
    value = float(size)
    for unit in ("B", "KiB", "MiB", "GiB", "TiB"):
        if value < 1024 or unit == "TiB":
            return f"{value:.1f} {unit}" if unit != "B" else f"{size} B"
        value /= 1024
    return f"{size} B"


def _looks_like_worktree(path: Path) -> bool:
    names = {child.name for child in path.iterdir() if child.is_dir()}
    return len(names & WORKTREE_MARKERS) >= 2


def orphan_directories(repo: Path, entries: list[WorktreeEntry]) -> list[tuple[Path, int]]:
    registered = {entry.path.resolve() for entry in entries}
    found: list[tuple[Path, int]] = []
    for candidate in repo.parent.iterdir():
        if not candidate.is_dir() or candidate.name.startswith("."):
            continue
        if candidate.resolve() in registered or not _looks_like_worktree(candidate):
            continue
        found.append((candidate, _directory_size(candidate)))
    return sorted(found, key=lambda item: str(item[0]).lower())


def _format_classification(item: Classification) -> str:
    branch = item.entry.branch or "(detached)"
    return f"{item.state:<10} {item.entry.path} [{branch}] — {item.reason}"


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--keep", action="append", default=[], metavar="BASENAME")
    parser.add_argument("--prune", action="store_true", help="remove REMOVABLE worktrees")
    args = parser.parse_args(argv)

    entries = registered_worktrees()
    classifications = [classify_worktree(entry, keep=set(args.keep)) for entry in entries]
    print("REGISTERED WORKTREES")
    for item in classifications:
        print(_format_classification(item))

    orphans = orphan_directories(ROOT, entries)
    print("UNREGISTERED WORKTREE-LIKE DIRECTORIES")
    if not orphans:
        print("(none)")
    for path, size in orphans:
        print(f"ORPHAN      {path} — {_human_size(size)} ({size} bytes); never deleted")

    if not args.prune:
        print("REPORT ONLY: no worktrees removed.")
        return 0

    exit_code = 0
    for item in classifications:
        if item.state != "REMOVABLE":
            continue
        result = _run(["git", "worktree", "remove", str(item.entry.path)])
        if result.returncode:
            print(f"REMOVE FAILED {item.entry.path}: {result.stderr.strip()}")
            exit_code = 1
        else:
            print(f"REMOVED      {item.entry.path}")
    return exit_code


if __name__ == "__main__":
    raise SystemExit(main())
