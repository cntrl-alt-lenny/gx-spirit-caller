"""Executes the real `.githooks/pre-push` script and proves it blocks.

`tests/test_install_git_hooks.py` pins the installer: hooksPath is set, the
hook file exists, the exec bit survives. It never *runs* the hook — so for the
lifetime of the guard, nothing verified that its blocking path executes.

It did not. The hook captured the checker's status as::

    if ! "${PYTHON}" tools/check_match_invariants.py ...; then
        rc=$?                      # <-- 0, the status of the NEGATION
        if [[ "${rc}" -eq 2 ]]; then

`!` inverts the pipeline status, so `$?` inside the `then` block is 0 and the
`-eq 2` branch was unreachable. The hook always fell through to `exit 0` and
had never blocked a push on invariant errors.

These tests drive the hook end to end with a stub interpreter whose exit code
we choose, asserting on the process's real exit status and stderr:

  * checker exit 2 (errors)   -> hook MUST block (non-zero) and say so
  * checker exit 1 (warnings) -> hook MUST allow (0); warnings are a known
    pre-existing backlog and blocking on them would make the guard useless
  * checker exit 0 (clean)    -> hook MUST allow (0)

The exit-2 case is the regression test proper: it fails against the pre-fix
hook. The exit-1 case is its adversarial twin — a "fix" that blocks on any
non-zero status would pass the first test and break every push.
"""

from __future__ import annotations

import os
import shutil
import stat
import subprocess
import tempfile
import unittest
from pathlib import Path

_ROOT = Path(__file__).resolve().parent.parent
_HOOK = _ROOT / ".githooks" / "pre-push"

# A ref-update line whose SHAs cannot resolve, so the hook's cheap fast-path
# cannot compute a diff base and runs the checker conservatively. That is the
# hook's own documented fallback, and it is what we want to exercise.
_BOGUS = "0" * 39 + "1"
_ZEROS = "0" * 40
_STDIN = f"refs/heads/t {_BOGUS} refs/heads/t {_ZEROS}\n"


def _bash() -> str | None:
    return shutil.which("bash")


@unittest.skipIf(_bash() is None, "bash unavailable; the hook is a bash script")
class TestPrePushBlocksOnInvariantErrors(unittest.TestCase):
    """Drive the real hook with a stub checker and assert on its exit status."""

    def _run_hook_with_checker_exiting(self, code: int) -> subprocess.CompletedProcess:
        """Run `.githooks/pre-push` with a stub interpreter exiting `code`."""
        tmp = Path(tempfile.mkdtemp(prefix="prepush-"))
        self.addCleanup(shutil.rmtree, tmp, ignore_errors=True)

        # The hook invokes: "$PYTHON" tools/check_match_invariants.py --version eur
        # The stub ignores its arguments and exits with the code under test,
        # printing a plausible report so the hook's awk filter has input.
        stub = tmp / "stub-python"
        stub.write_text(
            "#!/usr/bin/env bash\n"
            'echo "Found 1 issue(s): 1 error(s), 0 warning(s)."\n'
            'echo "== bad_extern (1) =="\n'
            'echo "  src/main/func_dead.c: extern points at nothing"\n'
            f"exit {code}\n",
            encoding="utf-8",
        )
        stub.chmod(stub.stat().st_mode | stat.S_IEXEC | stat.S_IXGRP | stat.S_IXOTH)

        env = dict(os.environ, PYTHON=str(stub))
        # Send bytes, not text: on Windows `text=True` rewrites the pipe to
        # CRLF, and a stray CR makes the hook's all-zeros SHA comparisons fail
        # so the checker never runs — the test would pass for the wrong reason.
        return subprocess.run(
            [_bash(), str(_HOOK)],
            input=_STDIN.encode("utf-8"),
            cwd=str(_ROOT),
            env=env,
            capture_output=True,
            timeout=120,
        )

    def test_checker_exit_2_blocks_the_push(self):
        """The whole point of the guard: errors must stop the push."""
        proc = self._run_hook_with_checker_exiting(2)
        self.assertNotEqual(
            0,
            proc.returncode,
            "pre-push allowed a push while the checker reported ERRORS "
            f"(exit 2). stdout={proc.stdout!r} stderr={proc.stderr!r}",
        )
        self.assertIn("ERROR", proc.stderr.decode("utf-8", "replace").upper())

    def test_checker_exit_1_allows_the_push(self):
        """Warnings are a known backlog — blocking on them breaks every push."""
        proc = self._run_hook_with_checker_exiting(1)
        self.assertEqual(
            0,
            proc.returncode,
            "pre-push blocked on warnings-only (exit 1); the documented "
            f"contract allows them. stderr={proc.stderr!r}",
        )

    def test_checker_exit_0_allows_the_push(self):
        proc = self._run_hook_with_checker_exiting(0)
        self.assertEqual(0, proc.returncode, proc.stderr)


class TestHookGuardIsActuallyExercised(unittest.TestCase):
    """Fail loudly if the blocking test can never run in this environment.

    A safety-mechanism test that silently skips is indistinguishable from one
    that passes. CI must know the difference.
    """

    def test_bash_is_available_or_explicitly_waived(self):
        if _bash() is not None:
            return
        self.assertTrue(
            os.environ.get("SPIRITCALLER_ALLOW_HOOK_TEST_SKIP") == "1",
            "bash is unavailable, so the pre-push blocking test cannot run. "
            "Set SPIRITCALLER_ALLOW_HOOK_TEST_SKIP=1 to acknowledge that this "
            "environment cannot verify the push guard.",
        )


if __name__ == "__main__":
    unittest.main()
