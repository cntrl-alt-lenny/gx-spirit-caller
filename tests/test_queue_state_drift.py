"""Regression tests for queue/state drift detection."""

from __future__ import annotations

import sys
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(ROOT / "tools"))

from queue_state_drift import (  # noqa: E402
    queue_findings,
    state_findings,
    state_sha_findings,
)


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
The queue remains live; see `docs/queue/scaffolder.md`.
"""
        self.assertEqual(queue_findings(text, "queue.md", lambda _value: True), [])

    def test_negated_shipped_context_is_not_completion_evidence(self):
        text = """### q-future — future [TODO]

The fallback was fixed and nothing shipped wrong; see `tools/park_one.py`.
"""
        self.assertEqual(
            queue_findings(text, "queue.md", lambda _value: True), [],
        )


_CLAIM = "**PR state — active vs merely open.** **active** count is **0**.\n"
_DECLARED = _CLAIM + "<!-- parked-prs: 1020 -->\n"


class StateDriftTests(unittest.TestCase):
    def test_explicitly_declared_park_is_excluded_from_active_count(self):
        findings, active, parked = state_findings(
            _DECLARED, [{"number": 1020, "isDraft": True}],
        )
        self.assertEqual(findings, [])
        self.assertEqual((active, parked), (0, 1))

    def test_draft_alone_is_NOT_parked(self):
        """Regression: worker lanes publish active output as draft PRs.

        Equating isDraft with parked hid every active worker PR from the
        active count (#1467/#1468 were live output, not parked).
        """
        findings, active, parked = state_findings(
            _DECLARED,
            [
                {"number": 1020, "isDraft": True},   # declared parked
                {"number": 1467, "isDraft": True},   # active worker output
                {"number": 1468, "isDraft": True},   # active worker output
            ],
        )
        self.assertEqual((active, parked), (2, 1))
        self.assertEqual(len(findings), 1)
        self.assertIn("active PRs: 0", findings[0].detail)

    def test_parked_label_counts_as_explicit(self):
        _, active, parked = state_findings(
            _CLAIM,
            [{"number": 77, "isDraft": False, "labels": [{"name": "parked"}]}],
        )
        self.assertEqual((active, parked), (0, 1))

    def test_parked_title_marker_counts_as_explicit(self):
        _, active, parked = state_findings(
            _CLAIM, [{"number": 78, "isDraft": False, "title": "[parked] spike"}],
        )
        self.assertEqual((active, parked), (0, 1))

    def test_active_plus_declared_park_is_flagged_against_zero_claim(self):
        findings, active, parked = state_findings(
            _DECLARED,
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

    def test_open_claim_also_excludes_declared_parks(self):
        findings, active, parked = state_findings(
            "Open PRs: 0\n<!-- parked-prs: 1020 -->\n",
            [{"number": 1020, "isDraft": True}],
        )
        self.assertEqual(findings, [])
        self.assertEqual((active, parked), (0, 1))


class StateShaAnchorTests(unittest.TestCase):
    """The anchor catches a stale handoff doc with no PR-count claim at all."""

    def test_missing_anchor_is_flagged(self):
        findings = state_sha_findings("no anchor here\n", lambda _sha: (True, 0))
        self.assertEqual(len(findings), 1)
        self.assertIn("no `main-sha:` freshness anchor", findings[0].detail)

    def test_fresh_anchor_passes(self):
        findings = state_sha_findings(
            "<!-- main-sha: 750ad5120 -->\n", lambda _sha: (True, 0),
        )
        self.assertEqual(findings, [])

    def test_own_doc_pr_merge_is_tolerated(self):
        findings = state_sha_findings(
            "<!-- main-sha: 750ad5120 -->\n", lambda _sha: (True, 1),
        )
        self.assertEqual(findings, [])

    def test_followup_bookkeeping_pr_is_tolerated(self):
        """Round 0808 needed two doc-PRs: the repair, then a fix to its own
        PR-count claim. A tolerance of 1 turned that into a red required
        check on main, blocking every subsequent lane PR."""
        findings = state_sha_findings(
            "<!-- main-sha: 750ad5120 -->\n", lambda _sha: (True, 2),
        )
        self.assertEqual(findings, [])

    def test_three_merges_still_flagged(self):
        findings = state_sha_findings(
            "<!-- main-sha: 750ad5120 -->\n", lambda _sha: (True, 3),
        )
        self.assertEqual(len(findings), 1)
        self.assertIn("3 PR-merges behind", findings[0].detail)

    def test_stale_anchor_is_flagged(self):
        """The real failure: five PRs landed while state.md sat unchanged."""
        findings = state_sha_findings(
            "<!-- main-sha: c35d49d8d -->\n", lambda _sha: (True, 5),
        )
        self.assertEqual(len(findings), 1)
        self.assertIn("5 PR-merges behind", findings[0].detail)

    def test_anchor_that_never_landed_is_flagged(self):
        findings = state_sha_findings(
            "<!-- main-sha: deadbeef1 -->\n", lambda _sha: (False, 0),
        )
        self.assertEqual(len(findings), 1)
        self.assertIn("never landed", findings[0].detail)

    def test_historical_anchor_is_not_selected(self):
        state = """<!-- main-sha: 750ad5120 -->

**Previously:** <!-- main-sha: c35d49d8d -->
"""
        findings = state_sha_findings(state, lambda sha: (True, 0 if sha == "750ad5120" else 9))
        self.assertEqual(findings, [])


if __name__ == "__main__":
    unittest.main()
