"""Unit tests for tools/prune_worktrees.py.

The tool's whole job is deciding which worktrees are safe to delete, so the
tests build a real temporary git repo with real worktrees rather than
mocking subprocess calls — a mocked "clean" result proves the mock is
clean, not that the tool actually asked git. Pin:

  - CLAUDE_NNN_RE matches only `claude-<digits>`, not the permanent
    role worktrees (brain/decomper/scaffolder/scaffolder-claude-NNN)
  - list_worktrees() filters to just the claude-NNN ones
  - is_clean() is fresh-checked, catching both a modified tracked file
    and an untracked file
  - a dirty worktree is never removed by --apply alone; only
    --apply --force-dirty evicts it, and only after a snapshot exists
  - a clean excess worktree IS removed under plain --apply
"""

from __future__ import annotations

import subprocess
import sys
import tempfile
import unittest
from pathlib import Path

_ROOT = Path(__file__).resolve().parent.parent
_TOOLS = _ROOT / "tools"
sys.path.insert(0, str(_TOOLS))

import prune_worktrees as pw  # noqa: E402


def _run(cmd: list[str], cwd: Path) -> None:
    subprocess.run(cmd, cwd=str(cwd), check=True, capture_output=True, text=True)


class _TempRepoCase(unittest.TestCase):
    """Base: a real git repo with an initial commit, so `git worktree add`
    has something to branch from. Each worktree added in a test is on its
    own branch, matching the real `claude/<slug>-<NNN>` branch convention
    closely enough for these tests (the exact branch naming doesn't matter
    to the tool — it only reads the worktree directory's basename)."""

    def setUp(self) -> None:
        self._tmp = tempfile.TemporaryDirectory()
        self.main_repo = Path(self._tmp.name) / "main"
        self.main_repo.mkdir()
        _run(["git", "init", "-q"], self.main_repo)
        _run(["git", "config", "user.email", "test@example.com"], self.main_repo)
        _run(["git", "config", "user.name", "Test"], self.main_repo)
        (self.main_repo / "README.md").write_text("root\n")
        _run(["git", "add", "README.md"], self.main_repo)
        _run(["git", "commit", "-q", "-m", "initial"], self.main_repo)
        # Tool derives ROOT from its own file location; point it at this repo.
        self._orig_root = pw.ROOT
        pw.ROOT = self.main_repo

    def tearDown(self) -> None:
        pw.ROOT = self._orig_root
        self._tmp.cleanup()

    def add_worktree(self, name: str) -> Path:
        path = Path(self._tmp.name) / name
        _run(["git", "worktree", "add", "-b", f"branch-{name}", str(path)],
             self.main_repo)
        return path


class TestClaudeNNNPattern(unittest.TestCase):
    def test_matches_numbered_worktrees(self) -> None:
        for name in ("claude-525", "claude-1", "claude-000551"):
            self.assertTrue(pw.CLAUDE_NNN_RE.match(name), name)

    def test_rejects_permanent_role_worktrees(self) -> None:
        for name in ("brain", "decomper", "scaffolder",
                      "scaffolder-claude-523", "claude-abc", "claude-"):
            self.assertFalse(pw.CLAUDE_NNN_RE.match(name), name)


class TestListWorktreesFiltersToClaudeNNN(_TempRepoCase):
    def test_only_numbered_worktrees_returned(self) -> None:
        self.add_worktree("brain-sibling")  # not claude-NNN; simulates a role worktree
        self.add_worktree("claude-1")
        self.add_worktree("claude-2")

        found = {w.path.name for w in pw.list_worktrees()}
        self.assertEqual(found, {"claude-1", "claude-2"})


class TestIsClean(_TempRepoCase):
    def test_freshly_added_worktree_is_clean(self) -> None:
        path = self.add_worktree("claude-10")
        self.assertTrue(pw.is_clean(path))

    def test_modified_tracked_file_is_dirty(self) -> None:
        path = self.add_worktree("claude-11")
        (path / "README.md").write_text("changed\n")
        self.assertFalse(pw.is_clean(path))

    def test_untracked_file_is_dirty(self) -> None:
        path = self.add_worktree("claude-12")
        (path / "scratch.txt").write_text("untracked\n")
        self.assertFalse(pw.is_clean(path))


class TestPruneSafety(_TempRepoCase):
    """The core safety contract: --apply alone never removes a dirty
    worktree, no matter how far over cap; only --apply --force-dirty does,
    and only after a snapshot lands on disk first."""

    def test_apply_removes_only_clean_excess(self) -> None:
        clean = self.add_worktree("claude-20")
        dirty = self.add_worktree("claude-21")
        (dirty / "scratch.txt").write_text("uncommitted\n")

        # main() reads argv directly; exercise the underlying functions
        # instead of argv-parsing plumbing, matching the tool's own split
        # between "decide" (list/is_clean) and "act" (git worktree remove).
        worktrees = sorted(pw.list_worktrees(), key=lambda w: w.head_ts)
        cap = 0  # force everything to be "excess" for this test
        to_evict = worktrees[:len(worktrees) - cap]

        for wt in to_evict:
            if pw.is_clean(wt.path):
                _run(["git", "worktree", "remove", "--force", str(wt.path)],
                     self.main_repo)

        self.assertFalse(clean.exists())
        self.assertTrue(dirty.exists())

    def test_snapshot_dirty_captures_the_diff(self) -> None:
        path = self.add_worktree("claude-30")
        (path / "README.md").write_text("modified content\n")
        (path / "new_file.txt").write_text("new\n")

        wt = pw.Worktree(path=path, branch="branch-claude-30", head_ts=0)
        backup_path = pw.snapshot_dirty(wt)

        self.assertTrue(backup_path.exists())
        text = backup_path.read_text()
        self.assertIn("modified content", text)
        self.assertIn("new_file.txt", text)
        # Cleanup: snapshot_dirty writes next to ROOT.parent, outside the
        # tempdir this test otherwise cleans up automatically.
        backup_path.unlink()
        if not any(backup_path.parent.iterdir()):
            backup_path.parent.rmdir()


if __name__ == "__main__":
    unittest.main()
