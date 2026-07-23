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


if __name__ == "__main__":
    unittest.main()
