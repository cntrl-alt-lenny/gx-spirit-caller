"""Focused tests for gate3's non-vacuous decision contract."""

from __future__ import annotations

import sys
import unittest
from pathlib import Path

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

import gate3  # noqa: E402


class TestVerdict(unittest.TestCase):
    def test_zero_checks_are_vacuous_exit_two(self):
        self.assertEqual(
            gate3.verdict(failed=[], checks_run=0, tests_ok=True),
            ("VACUOUS", 2),
        )

    def test_failed_check_is_real_failure(self):
        self.assertEqual(
            gate3.verdict(failed=["eur"], checks_run=1, tests_ok=True),
            ("FAIL", 1),
        )

    def test_observed_passing_check_passes(self):
        self.assertEqual(
            gate3.verdict(failed=[], checks_run=1, tests_ok=True),
            ("PASS", 0),
        )


class TestArgumentGuard(unittest.TestCase):
    def test_tests_scope_no_tests_is_rejected(self):
        with self.assertRaises(SystemExit) as ctx:
            gate3.main(["--scope", "tests", "--no-tests"])
        self.assertEqual(ctx.exception.code, 2)



class TestDsdBinaryProbe(unittest.TestCase):
    """Windows ships dsd.exe; probing only the extensionless name made every
    Windows worktree fail the preflight in ~0s with a message that reads like a
    content divergence, while the build ran dsd fine (CreateProcess appends
    .exe). Guard both spellings."""

    def _probe(self, root):
        # Mirror check_dsd_binary's candidate resolution against a fake root.
        return next((c for c in (root / "dsd", root / "dsd.exe") if c.exists()), None)

    def test_exe_only_root_is_found(self):
        import tempfile
        with tempfile.TemporaryDirectory() as d:
            root = Path(d)
            (root / "dsd.exe").write_bytes(b"x")
            self.assertIsNotNone(self._probe(root), "dsd.exe must satisfy the probe")

    def test_extensionless_only_root_is_found(self):
        import tempfile
        with tempfile.TemporaryDirectory() as d:
            root = Path(d)
            (root / "dsd").write_bytes(b"x")
            self.assertIsNotNone(self._probe(root), "posix ./dsd must satisfy the probe")

    def test_empty_root_is_missing(self):
        import tempfile
        with tempfile.TemporaryDirectory() as d:
            self.assertIsNone(self._probe(Path(d)), "no binary at all must still fail loud")

    def test_real_repo_root_resolves(self):
        self.assertIsNotNone(self._probe(Path(gate3.ROOT)),
                             "this checkout must expose a dsd binary under either spelling")

if __name__ == "__main__":
    unittest.main()
