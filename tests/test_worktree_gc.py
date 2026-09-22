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
    def test_mac_lane_basenames_keep_live_lanes_and_classify_other_shapes(self) -> None:
        """The LIVE Mac lane names, not the two that happened to be listed.

        This test previously used `codex-decomper-queue` / `codex-scaffolder-queue`
        -- the two names that were already in the hardcoded keep list -- while
        the actual Mac lanes were `claude-decomper-queue` and
        `claude-scaffolder-queue`, which were NOT. So it read as coverage of
        "Mac lane basenames" and was green throughout, while `--prune` would
        have deleted both live lanes as "clean and merged into origin/main".
        """
        decomper = self.add_worktree("claude-decomper-queue")
        scaffolder = self.add_worktree("claude-scaffolder-queue")
        removable = self.add_worktree("mac-clean-merged")
        dirty = self.add_worktree("mac-dirty")
        (dirty / "README.md").write_text("uncommitted\n", encoding="utf-8")
        held = self.add_worktree("mac-unmerged")
        (held / "new.txt").write_text("unmerged\n", encoding="utf-8")
        _run(["git", "add", "new.txt"], held)
        _run(["git", "commit", "-q", "-m", "unmerged"], held)

        entries = {entry.path.name: entry for entry in gc.registered_worktrees(self.repo)}
        self.assertEqual(gc.classify_worktree(entries[decomper.name], self.repo).state, "KEEP")
        self.assertEqual(gc.classify_worktree(entries[scaffolder.name], self.repo).state, "KEEP")
        self.assertEqual(
            gc.classify_worktree(entries[removable.name], self.repo).state, "REMOVABLE",
        )
        self.assertEqual(gc.classify_worktree(entries[dirty.name], self.repo).state, "HELD")
        self.assertEqual(gc.classify_worktree(entries[held.name], self.repo).state, "HELD")

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


class TestNestedRoleWorktreesAreProtected(unittest.TestCase):
    """2026-09-21 framework adoption: one checkout per role nested under the
    primary checkout, at `.worktrees/<role>`. `classify_worktree` only ever
    looks at the basename (`entry.path.name`), so no live git repo is needed
    here -- this pins the actual nested paths the adoption produced, rather
    than relying only on the bare role name being covered incidentally."""

    def test_worktrees_verifier_decomper_scaffolder_classify_keep(self) -> None:
        for role in ("verifier", "decomper", "scaffolder"):
            with self.subTest(role=role):
                entry = gc.WorktreeEntry(
                    path=Path(f"/repo/.worktrees/{role}"),
                    head="0" * 40,
                    branch=None,
                )
                classification = gc.classify_worktree(entry, repo=Path("/repo"))
                self.assertEqual(classification.state, "KEEP")


class TestLaneProtectionIsDerivedNotListed(unittest.TestCase):
    """A hand-maintained keep list drifted from reality and nearly cost two lanes.

    Protection is now derived from the role vocabulary `AGENTS.md` declares
    normative, wrapped by any provider prefix and lane suffix. These cases pin
    both directions: every shape a lane is ever spelled in must be KEEP, and
    the ephemeral sandbox shapes `--prune` exists to collect must stay
    deletable -- a fix that protected everything would be no fix at all.
    """

    LANE_SHAPES = (
        "brain",
        "decomper",
        "scaffolder",
        "verifier",
        "kb-map",
        "kb-types",
        "claude-decomper-queue",
        "claude-scaffolder-queue",
        "codex-decomper-queue",
        "codex-scaffolder-queue",
        "gemini-scaffolder-queue",
        "scaffolder-claude-525",
    )

    DISPOSABLE_SHAPES = (
        "claude-525",
        "claude-1204",
        "sweep17-batch1",
        "mainsweep7-p2batch2",
        "scratch_stash",
        "merged",
    )

    def test_every_lane_spelling_is_protected(self) -> None:
        for name in self.LANE_SHAPES:
            with self.subTest(name=name):
                self.assertTrue(
                    gc.is_lane_basename(name),
                    f"{name!r} is a standing lane and must never be REMOVABLE",
                )

    def test_ephemeral_sandbox_shapes_stay_collectable(self) -> None:
        for name in self.DISPOSABLE_SHAPES:
            with self.subTest(name=name):
                self.assertFalse(
                    gc.is_lane_basename(name),
                    f"{name!r} is an ephemeral sandbox; over-protecting it "
                    "turns the tool into a no-op",
                )

    def test_lane_roles_cover_every_role_make_kickoff_can_dispatch(self) -> None:
        """The two files must not drift the way the keep list drifted.

        `make_kickoff.py` is what actually sends a worker to a directory. Any
        role it can emit a kickoff for is, by definition, a lane whose worktree
        must survive `--prune`.
        """
        import make_kickoff

        missing = set(make_kickoff.LANE_WORKTREES) - set(gc.LANE_ROLES)
        self.assertEqual(
            set(),
            missing,
            "make_kickoff.py dispatches roles that worktree_gc.py does not "
            f"protect: {sorted(missing)}. Add them to LANE_ROLES.",
        )

    def test_live_mac_lane_directories_are_all_protected(self) -> None:
        """Names taken from the Mac host on 2026-09-03, verbatim.

        The regression this file exists to prevent is specifically "the list
        said `decomper`, the disk said `claude-decomper-queue`". Pin the disk.
        """
        for name in (
            "brain",
            "claude-decomper-queue",
            "claude-scaffolder-queue",
            "codex-decomper-queue",
            "codex-scaffolder-queue",
        ):
            with self.subTest(name=name):
                self.assertTrue(gc.is_lane_basename(name))


if __name__ == "__main__":
    unittest.main()
