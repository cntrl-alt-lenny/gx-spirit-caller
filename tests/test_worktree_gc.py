"""Safety tests for worktree_gc using real temporary git worktrees."""

from __future__ import annotations

import contextlib
import io
import subprocess
import sys
import tempfile
import unittest
from pathlib import Path

_ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(_ROOT / "tools"))

import worktree_gc as gc  # noqa: E402


def _run(args: list[str], cwd: Path) -> subprocess.CompletedProcess[str]:
    return subprocess.run(args, cwd=str(cwd), capture_output=True, text=True, check=True)


class _RepoCase(unittest.TestCase):
    def setUp(self) -> None:
        self._tmp = tempfile.TemporaryDirectory()
        parent = Path(self._tmp.name)
        self.repo = parent / "repo"
        self.repo.mkdir()
        _run(["git", "init", "-q"], self.repo)
        _run(["git", "config", "user.email", "test@example.com"], self.repo)
        _run(["git", "config", "user.name", "Test"], self.repo)
        (self.repo / "README.md").write_text("initial\n", encoding="utf-8")
        _run(["git", "add", "README.md"], self.repo)
        _run(["git", "commit", "-q", "-m", "initial"], self.repo)
        _run(["git", "branch", "main"], self.repo)
        _run(["git", "update-ref", "refs/remotes/origin/main", "HEAD"], self.repo)
        self._old_root = gc.ROOT
        gc.ROOT = self.repo

    def tearDown(self) -> None:
        gc.ROOT = self._old_root
        self._tmp.cleanup()

    def add_worktree(self, name: str, branch: str | None = None) -> Path:
        path = self.repo.parent / name
        branch = branch or f"branch-{name}"
        _run(["git", "worktree", "add", "-b", branch, str(path), "main"], self.repo)
        return path

    def run_tool(self, *args: str) -> str:
        output = io.StringIO()
        with contextlib.redirect_stdout(output):
            gc.main(list(args))
        return output.getvalue()


class TestDangerousCases(_RepoCase):
    def test_dirty_worktree_is_held_even_with_prune(self) -> None:
        path = self.add_worktree("dirty")
        (path / "README.md").write_text("uncommitted\n", encoding="utf-8")

        output = self.run_tool("--prune")

        self.assertTrue(path.exists())
        self.assertIn("HELD", output)
        self.assertIn("dirty", output)

    def test_unmerged_worktree_is_held_even_with_prune(self) -> None:
        path = self.add_worktree("unmerged")
        (path / "new.txt").write_text("unmerged commit\n", encoding="utf-8")
        _run(["git", "add", "new.txt"], path)
        _run(["git", "commit", "-q", "-m", "unmerged"], path)

        output = self.run_tool("--prune")

        self.assertTrue(path.exists())
        self.assertIn("HELD", output)
        self.assertIn("unmerged from origin/main", output)


class TestClassificationAndPrune(_RepoCase):
    def test_keep_set_uses_basename_and_extra_keep(self) -> None:
        standing = self.add_worktree("brain")
        extra = self.add_worktree("local-lane")

        entries = gc.registered_worktrees(self.repo)
        by_name = {entry.path.name: entry for entry in entries}
        self.assertEqual(gc.classify_worktree(by_name[standing.name], self.repo).state, "KEEP")
        self.assertEqual(
            gc.classify_worktree(by_name[extra.name], self.repo, {"local-lane"}).state,
            "KEEP",
        )

    def test_clean_merged_worktree_is_removed_only_with_prune(self) -> None:
        path = self.add_worktree("merged")
        report = self.run_tool()
        self.assertTrue(path.exists())
        self.assertIn("REMOVABLE", report)

        self.run_tool("--prune")
        self.assertFalse(path.exists())

    def test_locked_worktree_is_held(self) -> None:
        path = self.add_worktree("locked")
        _run(["git", "worktree", "lock", "--reason", "review in progress", str(path)], self.repo)

        output = self.run_tool("--prune")

        self.assertTrue(path.exists())
        self.assertIn("HELD", output)
        self.assertIn("locked", output)


class TestOrphanReporting(_RepoCase):
    def test_unregistered_worktree_like_directory_is_reported_not_removed(self) -> None:
        orphan = self.repo.parent / "orphan-sweep"
        (orphan / "src").mkdir(parents=True)
        (orphan / "tools").mkdir()
        (orphan / "src" / "uncommitted.c").write_text("human work\n", encoding="utf-8")

        output = self.run_tool("--prune")

        self.assertTrue(orphan.exists())
        self.assertIn("ORPHAN", output)
        self.assertIn(str(orphan), output)
        self.assertIn("never deleted", output)


if __name__ == "__main__":
    unittest.main()
