#!/usr/bin/env python3

"""
prune_worktrees.py — cap the number of ephemeral claude-NNN task worktrees.

The multi-agent convention (AGENTS.md § Worktree convention) spins up a new
numbered sibling worktree per task session (`claude-525`, `claude-526`, ...).
Nothing retires them automatically, so the count only ever grows — 27+ were
observed accumulated in one sweep. Anthropic's own Claude Code has an open
bug (github.com/anthropics/claude-code/issues/55724) where dispatching many
`isolation: worktree` subagents at once causes `.git/index.lock` contention;
a worktree whose commit silently failed can still look "clean" and gets
swept by unrelated cleanup logic, losing the agent's work. This tool takes
the opposite, conservative stance: it only ever removes a worktree it has
independently confirmed has nothing uncommitted to lose.

Only worktrees matching `claude-<digits>` are candidates — the named,
permanent role worktrees (brain, decomper, scaffolder, and any
`scaffolder-claude-NNN` variant) are never touched, matched or not.

Safety model:
  - "Clean" (no uncommitted or untracked changes) is verified with
    `git status --porcelain` immediately before eviction, not assumed from
    the initial scan — the check and the removal happen back-to-back.
  - A dirty worktree is never auto-removed. With `--apply` alone it's
    skipped and reported. Only `--apply --force-dirty` will evict a dirty
    worktree, and even then only after snapshotting `git diff` + the
    untracked-file list to a patch under `.prune-backups/` first — the same
    "snapshot before evicting" precedent Codex's own worktree cap uses.
  - Age is the candidate's HEAD commit timestamp, not directory mtime
    (mtime drifts on every unrelated filesystem touch; commit time doesn't).
  - Merged-PR status is informational only (best-effort via `gh`, degrades
    silently if `gh` is unavailable or unauthenticated) — it is never the
    safety gate. A clean worktree is safe to remove whether or not its
    branch's PR has merged, since `git worktree remove` only deletes the
    checkout; the branch and its commits remain in the shared object store.

Usage:

    python tools/prune_worktrees.py                    # report only
    python tools/prune_worktrees.py --cap 10            # different cap
    python tools/prune_worktrees.py --apply             # evict clean excess
    python tools/prune_worktrees.py --apply --force-dirty  # + snapshot-evict dirty excess

Default cap is 15, matching the reference point in the framework-research
comparison this tool came out of (the OpenAI Codex app's own worktree cap).
"""

from __future__ import annotations

import argparse
import re
import subprocess
import sys
from dataclasses import dataclass
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
CLAUDE_NNN_RE = re.compile(r"^claude-\d+$")
DEFAULT_CAP = 15
BACKUP_DIR_NAME = ".prune-backups"


@dataclass
class Worktree:
    path: Path
    branch: str
    head_ts: int  # HEAD commit's committer-date, unix seconds


def _run(cmd: list[str], cwd: Path | None = None) -> tuple[int, str, str]:
    proc = subprocess.run(
        cmd, capture_output=True, text=True, cwd=str(cwd) if cwd else None,
    )
    return proc.returncode, proc.stdout, proc.stderr


def list_worktrees() -> list[Worktree]:
    """Return every git-registered worktree whose directory name matches
    `claude-<digits>`, via `git worktree list --porcelain` — the
    authoritative source, independent of whether worktrees live as Mac-style
    siblings or Windows-style nested `.claude/worktrees/<auto-name>/`
    checkouts (both mechanisms register the same way in git)."""
    rc, out, err = _run(["git", "worktree", "list", "--porcelain"], cwd=ROOT)
    if rc != 0:
        raise RuntimeError(f"git worktree list failed: {err.strip()}")

    candidates: list[Worktree] = []
    current_path: Path | None = None
    current_branch = ""
    for line in out.splitlines():
        if line.startswith("worktree "):
            current_path = Path(line.removeprefix("worktree ").strip())
            current_branch = ""
        elif line.startswith("branch "):
            current_branch = line.removeprefix("branch ").strip()
            current_branch = current_branch.removeprefix("refs/heads/")
        elif line == "" and current_path is not None:
            if CLAUDE_NNN_RE.match(current_path.name):
                ts = _head_timestamp(current_path)
                if ts is not None:
                    candidates.append(Worktree(current_path, current_branch, ts))
            current_path = None
    return candidates


def _head_timestamp(path: Path) -> int | None:
    rc, out, _ = _run(["git", "log", "-1", "--format=%ct"], cwd=path)
    if rc != 0 or not out.strip():
        return None
    return int(out.strip())


def is_clean(path: Path) -> bool:
    """True only if there are zero uncommitted changes AND zero untracked
    files. Checked fresh at call time, never cached from an earlier scan."""
    rc, out, _ = _run(["git", "status", "--porcelain"], cwd=path)
    return rc == 0 and out.strip() == ""


def merged_pr_hint(branch: str) -> str:
    """Best-effort, informational only. Never gates removal."""
    rc, out, _ = _run(
        ["gh", "pr", "list", "--head", branch, "--state", "merged",
         "--json", "number", "--jq", ".[0].number"],
    )
    if rc == 0 and out.strip():
        return f"PR #{out.strip()} merged"
    return "no merged PR found (or gh unavailable)"


def snapshot_dirty(wt: Worktree) -> Path:
    """Save `git diff` + untracked-file contents for a dirty worktree
    before it's forcibly evicted. Returns the backup file path."""
    backup_root = ROOT.parent / BACKUP_DIR_NAME
    backup_root.mkdir(exist_ok=True)
    rc, head, _ = _run(["git", "rev-parse", "--short", "HEAD"], cwd=wt.path)
    short_sha = head.strip() if rc == 0 else "unknown"
    out_path = backup_root / f"{wt.path.name}-{short_sha}.patch"

    _, tracked_diff, _ = _run(["git", "diff", "HEAD"], cwd=wt.path)
    _, untracked, _ = _run(
        ["git", "ls-files", "--others", "--exclude-standard"], cwd=wt.path,
    )
    with out_path.open("w", encoding="utf-8") as f:
        f.write(f"# snapshot of {wt.path} (branch {wt.branch}) before prune\n")
        f.write(f"# HEAD at snapshot time: {short_sha}\n\n")
        f.write("## git diff HEAD\n\n")
        f.write(tracked_diff)
        f.write("\n\n## untracked files (contents not captured, names only)\n\n")
        f.write(untracked)
    return out_path


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--cap", type=int, default=DEFAULT_CAP)
    parser.add_argument("--apply", action="store_true",
                         help="actually remove excess worktrees (default: report only)")
    parser.add_argument("--force-dirty", action="store_true",
                         help="also evict dirty excess worktrees, after snapshotting")
    args = parser.parse_args()

    worktrees = sorted(list_worktrees(), key=lambda w: w.head_ts)
    excess = len(worktrees) - args.cap
    print(f"{len(worktrees)} claude-NNN worktree(s), cap {args.cap}.")
    if excess <= 0:
        print("Nothing to prune.")
        return 0

    to_evict = worktrees[:excess]
    print(f"{excess} over cap — oldest {excess} by HEAD commit time:\n")

    exit_code = 0
    for wt in to_evict:
        dirty = not is_clean(wt.path)
        hint = merged_pr_hint(wt.branch)
        state = "DIRTY" if dirty else "clean"
        print(f"  {wt.path.name}  [{wt.branch}]  {state}  ({hint})")

        if not args.apply:
            continue
        if dirty and not args.force_dirty:
            print("    SKIPPED — dirty, rerun with --force-dirty to snapshot-evict")
            exit_code = 1
            continue
        if dirty:
            backup = snapshot_dirty(wt)
            print(f"    snapshotted uncommitted changes to {backup}")
        rc, _, err = _run(["git", "worktree", "remove", "--force", str(wt.path)], cwd=ROOT)
        if rc != 0:
            print(f"    REMOVE FAILED: {err.strip()}")
            exit_code = 1
        else:
            print("    removed")

    if not args.apply:
        print("\nDry run — rerun with --apply to actually remove the clean ones above.")
    return exit_code


if __name__ == "__main__":
    sys.exit(main())
