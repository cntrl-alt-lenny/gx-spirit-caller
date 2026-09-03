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


@unittest.skipIf(_bash() is None, "bash unavailable; the hook is a bash script")
class TestPrePushInvokesTheCheckerCorrectly(unittest.TestCase):
    """The stub above ignores its argv, so it could not see a malformed call.

    That blind spot hid a real, active defect for the guard's whole life: the
    line invoking the checker ended in a literal backslash followed by the
    letter ``n``, where a line continuation was meant. Bash reads that as the
    single character
    ``n``, so the process was launched as::

        check_match_invariants.py --version eur n

    ``check_match_invariants.py`` declares no positional argument, so argparse
    exited **2** -- which this hook reads as "the checker found ERRORS". Every
    push whose diff touched ``config/`` or ``src/`` was refused, citing a
    defect that did not exist. Confirmed byte-level with ``od -c``.

    Asserting on the *status* can never catch this; only asserting on the
    argv can. So this records it.
    """

    def _run_hook_recording_argv(self) -> list[str]:
        tmp = Path(tempfile.mkdtemp(prefix="prepush-argv-"))
        self.addCleanup(shutil.rmtree, tmp, ignore_errors=True)
        argv_out = tmp / "argv.txt"

        stub = tmp / "stub-python"
        stub.write_text(
            "#!/usr/bin/env bash\n"
            'printf "%s\\n" "$@" > "$ARGV_OUT"\n'
            "exit 0\n",
            encoding="utf-8",
        )
        stub.chmod(stub.stat().st_mode | stat.S_IEXEC | stat.S_IXGRP | stat.S_IXOTH)

        env = dict(os.environ, PYTHON=str(stub), ARGV_OUT=str(argv_out))
        proc = subprocess.run(
            [_bash(), str(_HOOK)],
            input=_STDIN.encode("utf-8"),
            cwd=str(_ROOT),
            env=env,
            capture_output=True,
            timeout=120,
        )
        self.assertTrue(
            argv_out.is_file(),
            "the hook never invoked the checker at all. "
            f"stdout={proc.stdout!r} stderr={proc.stderr!r}",
        )
        return argv_out.read_text(encoding="utf-8").splitlines()

    def test_checker_receives_exactly_the_documented_arguments(self):
        self.assertEqual(
            ["tools/check_match_invariants.py", "--version", "eur"],
            self._run_hook_recording_argv(),
        )

    def test_hook_source_has_no_literal_backslash_n(self):
        """Byte-level twin of the test above; names the remedy on failure.

        Read as BYTES. The hook carries three load-bearing literal CR
        characters, and universal-newline text decoding turns each into a
        newline -- which splits a comment into an executable line. Any tool
        that rewrites this file must use binary I/O.
        """
        raw = _HOOK.read_bytes()
        self.assertNotIn(
            b"\\n",
            raw,
            "`.githooks/pre-push` contains the two-byte sequence backslash-n. "
            "Bash reads that as the character `n`, not as a line continuation: "
            "it becomes a stray argument. Use a real backslash-newline.",
        )

    def test_hook_still_strips_carriage_returns_from_stdin(self):
        """Guards the CR bytes a text-mode rewrite silently destroys.

        The manifest parser strips a trailing CR with `${local_sha%%<CR>}`,
        where <CR> is a literal 0x0D byte in the source. Round-tripping this
        file through `Path.read_text()` / `write_text()` rewrites those bytes
        to newlines, splitting the comment that documents them into a line
        bash tries to execute (`makes: command not found`). Encountered for
        real while fixing the defect above.
        """
        raw = _HOOK.read_bytes()
        self.assertEqual(
            2,
            raw.count(b"%%\r"),
            "the literal CR strippers in `.githooks/pre-push` are gone or "
            "duplicated. If a rewrite tool ate them, it used text-mode I/O; "
            "redo the edit with read_bytes()/write_bytes().",
        )


@unittest.skipIf(_bash() is None, "bash unavailable; the hook is a bash script")
class TestPrePushInterpreterDiscoveryIsVersionGated(unittest.TestCase):
    """Resolving the name `python3` is not the same as being able to run.

    macOS ships Apple's python3 3.9.6. `check_match_invariants.py` imports
    `tools/progress.py`, which evaluates `dict | None` at import time -- 3.10+
    only. Under 3.9 that raises TypeError and the interpreter exits **1**,
    the hook's "warnings, allow the push" code. Measured on the Mac brain
    host: the hook exited 0 having never run the check, and said nothing.

    So auto-discovery must probe the *version*, not the name. An explicit
    `PYTHON=` override is still honoured verbatim -- the caller is naming the
    interpreter, and the stubs in this file could not answer a probe.
    """

    def _fake_interpreter(self, path: Path, *, supported: bool, argv_out: Path | None = None):
        # Behaves like a real interpreter for the hook's two invocations:
        # the `-c` version probe, and the actual checker run.
        probe_status = 0 if supported else 1
        body = "#!/usr/bin/env bash\n"
        body += f'if [[ "$1" == "-c" ]]; then exit {probe_status}; fi\n'
        if argv_out is not None:
            body += f'printf "%s\\n" "$@" > "{argv_out}"\n'
        body += "exit 0\n"
        path.write_text(body, encoding="utf-8")
        path.chmod(path.stat().st_mode | stat.S_IEXEC | stat.S_IXGRP | stat.S_IXOTH)

    def test_an_interpreter_that_fails_the_version_probe_is_skipped(self):
        tmp = Path(tempfile.mkdtemp(prefix="prepush-ver-"))
        self.addCleanup(shutil.rmtree, tmp, ignore_errors=True)
        argv_out = tmp / "argv.txt"

        # First candidate in the hook's own preference order, but too old.
        self._fake_interpreter(tmp / "python3.13", supported=False)
        # Next candidate, supported: this is the one that must be chosen.
        self._fake_interpreter(tmp / "python3.12", supported=True, argv_out=argv_out)

        env = dict(os.environ, PATH=f"{tmp}{os.pathsep}{os.environ['PATH']}")
        env.pop("PYTHON", None)
        proc = subprocess.run(
            [_bash(), str(_HOOK)],
            input=_STDIN.encode("utf-8"),
            cwd=str(_ROOT),
            env=env,
            capture_output=True,
            timeout=300,
        )
        self.assertEqual(0, proc.returncode, proc.stderr)
        self.assertTrue(
            argv_out.is_file(),
            "the supported interpreter was never reached -- discovery either "
            "accepted the too-old candidate or fell through it entirely. "
            f"stdout={proc.stdout!r} stderr={proc.stderr!r}",
        )


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
