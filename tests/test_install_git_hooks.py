"""Unit tests for tools/install_git_hooks.py.

Not much logic here — the tool is thin glue over `git config` —
but a regression that silently fails to set core.hooksPath would
leave brain's pre-push guard off without warning. Pin:

  - install() sets core.hooksPath to `.githooks`
  - install() is idempotent
  - uninstall() unsets it
  - uninstall() is a no-op when not set
  - the shipped pre-push hook is executable (mode bit pinned)
"""

from __future__ import annotations

import stat
import subprocess
import sys
import tempfile
import unittest
from pathlib import Path

_ROOT = Path(__file__).resolve().parent.parent
_TOOLS = _ROOT / "tools"
sys.path.insert(0, str(_TOOLS))

from install_git_hooks import HOOKS_DIR_NAME  # noqa: E402


class TestPrePushHookExecutable(unittest.TestCase):
    """Pin: the shipped hook must have the exec bit set. If it
    drifts (e.g. someone commits it via a Windows tool that strips
    perms), the install script re-applies it — but the fact that
    it shipped non-executable would still be a regression."""

    def test_pre_push_is_executable(self):
        hook = _ROOT / HOOKS_DIR_NAME / "pre-push"
        self.assertTrue(hook.is_file(), f"{hook} missing")
        # Check S_IXUSR directly rather than os.access(X_OK) — the
        # latter returns True for root regardless of mode, making
        # the test unreliable in sudo / containerised CI.
        self.assertTrue(
            hook.stat().st_mode & stat.S_IXUSR,
            f"{hook} is not marked executable (S_IXUSR); "
            "install_git_hooks.py will fix on next install but the "
            "commit itself should have the bit set",
        )


class TestInstallerEndToEnd(unittest.TestCase):
    """Run the installer against a throwaway git repo that has a
    copy of the real `.githooks/` dir + `tools/install_git_hooks.py`.

    Isolates the test from the developer's actual repo config so
    `core.hooksPath` there isn't perturbed."""

    def _setup_fake_repo(self, tmp: Path) -> Path:
        """Clone-by-copy a minimal working tree: git init + the
        committed hooks + the installer itself. No .git/ from the
        real repo is copied."""
        subprocess.run(
            ["git", "init", "-q", str(tmp)], check=True,
        )
        # Copy only what the installer touches: .githooks/ and the
        # installer script it invokes.
        real_hooks = _ROOT / HOOKS_DIR_NAME
        fake_hooks = tmp / HOOKS_DIR_NAME
        fake_hooks.mkdir(exist_ok=True)
        for h in real_hooks.iterdir():
            if h.is_file():
                (fake_hooks / h.name).write_text(h.read_text())
                (fake_hooks / h.name).chmod(h.stat().st_mode)
        (tmp / "tools").mkdir(exist_ok=True)
        installer = _TOOLS / "install_git_hooks.py"
        (tmp / "tools" / "install_git_hooks.py").write_text(
            installer.read_text(),
        )
        return tmp

    def _run_installer(self, cwd: Path, *extra: str) -> int:
        proc = subprocess.run(
            [sys.executable, "tools/install_git_hooks.py", *extra],
            cwd=str(cwd), capture_output=True, text=True,
        )
        return proc.returncode

    def _read_hooks_path(self, cwd: Path) -> str:
        proc = subprocess.run(
            ["git", "config", "--get", "core.hooksPath"],
            cwd=str(cwd), capture_output=True, text=True,
        )
        return proc.stdout.strip()

    def test_install_sets_hooks_path(self):
        with tempfile.TemporaryDirectory() as td:
            repo = self._setup_fake_repo(Path(td))
            rc = self._run_installer(repo)
            self.assertEqual(rc, 0)
            self.assertEqual(
                self._read_hooks_path(repo), HOOKS_DIR_NAME,
            )

    def test_install_is_idempotent(self):
        with tempfile.TemporaryDirectory() as td:
            repo = self._setup_fake_repo(Path(td))
            self._run_installer(repo)
            rc = self._run_installer(repo)
            self.assertEqual(rc, 0)
            self.assertEqual(
                self._read_hooks_path(repo), HOOKS_DIR_NAME,
            )

    def test_install_restores_exec_bit(self):
        with tempfile.TemporaryDirectory() as td:
            repo = self._setup_fake_repo(Path(td))
            # Strip exec bit; installer should re-apply.
            hook = repo / HOOKS_DIR_NAME / "pre-push"
            hook.chmod(hook.stat().st_mode & ~stat.S_IXUSR)
            # Check the mode bit directly (os.access returns True
            # for root regardless, so it's unreliable under sudo /
            # CI).
            self.assertFalse(
                hook.stat().st_mode & stat.S_IXUSR,
                "S_IXUSR should be stripped for this test",
            )
            self._run_installer(repo)
            self.assertTrue(
                hook.stat().st_mode & stat.S_IXUSR,
                "installer should restore S_IXUSR",
            )

    def test_uninstall_unsets_path(self):
        with tempfile.TemporaryDirectory() as td:
            repo = self._setup_fake_repo(Path(td))
            self._run_installer(repo)
            rc = self._run_installer(repo, "--uninstall")
            self.assertEqual(rc, 0)
            self.assertEqual(self._read_hooks_path(repo), "")

    def test_uninstall_noop_when_unset(self):
        with tempfile.TemporaryDirectory() as td:
            repo = self._setup_fake_repo(Path(td))
            rc = self._run_installer(repo, "--uninstall")
            # Clean exit even though nothing was set.
            self.assertEqual(rc, 0)


if __name__ == "__main__":
    unittest.main()
