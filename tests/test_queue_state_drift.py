"""Regression tests for queue/state drift detection."""

from __future__ import annotations

import sys
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(ROOT / "tools"))

from queue_state_drift import queue_findings, state_findings  # noqa: E402


class QueueDriftTests(unittest.TestCase):
    def test_shipped_artifact_under_todo_is_flagged(self):
        text = """### q-cross-region-alias-guard — guard [TODO]

Resolved and merged in `tools/port_to_region.py`.
"""
        findings = queue_findings(
            text, "queue.md", lambda value: value == "tools/port_to_region.py",
        )
        self.assertEqual(len(findings), 1)

    def test_historical_context_and_bookkeeping_paths_are_ignored(self):
        text = """### q-future — future [TODO]

Earlier waves shipped related work.
The queue remains live; see `docs/queue/codex-scaffolder.md`.
"""
        self.assertEqual(queue_findings(text, "queue.md", lambda _value: True), [])

    def test_negated_shipped_context_is_not_completion_evidence(self):
        text = """### q-future — future [TODO]

The fallback was fixed and nothing shipped wrong; see `tools/park_one.py`.
"""
        self.assertEqual(
            queue_findings(text, "queue.md", lambda _value: True), [],
        )


class StateDriftTests(unittest.TestCase):
    def test_parked_draft_is_excluded_from_active_count(self):
        findings, active, parked = state_findings(
            "**PR state — active vs merely open.** **active** count is **0**.\n",
            [{"number": 1020, "isDraft": True}],
        )
        self.assertEqual(findings, [])
        self.assertEqual((active, parked), (0, 1))

    def test_active_plus_draft_is_flagged_against_zero_claim(self):
        findings, active, parked = state_findings(
            "**PR state — active vs merely open.** **active** count is **0**.\n",
            [
                {"number": 1020, "isDraft": True},
                {"number": 1021, "isDraft": False},
            ],
        )
        self.assertEqual((active, parked), (1, 1))
        self.assertEqual(len(findings), 1)
        self.assertIn("active PRs: 0", findings[0].detail)

    def test_historical_open_claim_is_not_selected(self):
        state = """Current active count is **0**.

**Previously:** Open PRs: 99
"""
        findings, active, parked = state_findings(state, [])
        self.assertEqual(findings, [])
        self.assertEqual((active, parked), (0, 0))

    def test_open_claim_also_excludes_parked_drafts(self):
        findings, active, parked = state_findings(
            "Open PRs: 0\n",
            [{"number": 1020, "isDraft": True}],
        )
        self.assertEqual(findings, [])
        self.assertEqual((active, parked), (0, 1))


if __name__ == "__main__":
    unittest.main()
