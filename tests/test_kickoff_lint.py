"""Tests for tools/kickoff_lint.py (R&D r8 §4).

Pure text analysis — no build, CI-safe. A known-good kickoff (modeled on the
brief-610 naming campaign: preflight + canary + explicit effort + paste-a-real-
artifact + worktree retry-loop) must lint clean; kickoffs missing each guard
must fail the corresponding required check.
"""

from __future__ import annotations

import sys
import unittest
from pathlib import Path

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

from kickoff_lint import lint  # noqa: E402


# A well-formed kickoff (indented code blocks, no triple-backticks).
GOOD = """
Brief 610 — name the SDK layer. SET YOUR REASONING EFFORT TO HIGH.
Setup + PREFLIGHT:
    ls tools/nitro_suggest_renames.py && echo PREFLIGHT-OK || { echo "preflight failed"; exit 1; }
    for i in 1 2 3 4 5; do git worktree add ../codex-610 -b codex/naming-610 origin/main && break || { echo retry; sleep 3; }; done
CANARY: rename ONE function, then run dsd check — it MUST stay green.
Finish: paste the total names added + the final dsd check green line for all 3 regions.
Reply with the PR URL + the sha1 result.
"""


class TestGoodKickoff(unittest.TestCase):
    def test_all_required_pass(self):
        failed = [c for c in lint(GOOD) if c.required and not c.ok]
        self.assertEqual(failed, [], f"good kickoff should lint clean, got: {[c.key for c in failed]}")

    def test_no_advisory_warnings(self):
        warns = [c for c in lint(GOOD) if not c.required and not c.ok]
        self.assertEqual(warns, [], f"good kickoff tripped advisories: {[c.key for c in warns]}")


class TestMissingGuards(unittest.TestCase):
    def _fail_keys(self, text: str) -> set[str]:
        return {c.key for c in lint(text) if c.required and not c.ok}

    def test_missing_canary(self):
        self.assertIn("canary", self._fail_keys(GOOD.replace("CANARY", "note")))

    def test_missing_effort(self):
        self.assertIn("effort-tag", self._fail_keys(GOOD.replace("SET YOUR REASONING EFFORT TO HIGH", "go")))

    def test_preflight_without_hard_stop_fails(self):
        # PREFLIGHT mentioned but no `exit 1` / `|| {…}` guard → not a real stop.
        text = "PREFLIGHT: check the files exist.\nCANARY: first rename dsd check.\nHIGH effort. paste the sha1."
        self.assertIn("preflight", self._fail_keys(text))

    def test_self_report_without_artifact_fails(self):
        # A reply requested, but not tied to a tool-derived artifact → self-report.
        text = ("PREFLIGHT: ls tool || exit 1\nCANARY first item check\nHIGH effort\n"
                "Reply with a summary of what you did.")
        self.assertIn("paste-control", self._fail_keys(text))

    def test_worktree_add_without_retry_fails(self):
        text = ("PREFLIGHT: ls || exit 1\nCANARY first check\nHIGH effort\npaste the sha1\n"
                "git worktree add ../w -b br origin/main")
        self.assertIn("worktree-retry", self._fail_keys(text))

    def test_worktree_retry_not_required_when_absent(self):
        # No worktree add → the retry check does not apply, must not fail.
        text = "PREFLIGHT: ls || exit 1\nCANARY first check\nHIGH effort\npaste the sha1 line"
        self.assertNotIn("worktree-retry", self._fail_keys(text))


class TestAdvisory(unittest.TestCase):
    def test_nested_backticks_warn_but_dont_fail(self):
        text = GOOD + "\n```\ncode\n```\n"
        checks = lint(text)
        bt = next(c for c in checks if c.key == "no-nested-backticks")
        self.assertFalse(bt.ok)
        self.assertFalse(bt.required)  # advisory only
        # still no *required* failure
        self.assertEqual([c.key for c in checks if c.required and not c.ok], [])


if __name__ == "__main__":
    unittest.main()
