from __future__ import annotations

import sys
import unittest
from pathlib import Path

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

from ledger_analytics import render, select_rows, summarize  # noqa: E402


def _row(brief: str, match_pct: str, **values: str) -> dict[str, str]:
    row = {
        "brief": brief, "match_pct": match_pct, "park_class": "reg-alloc",
        "result": "parked", "text_size": "128", "attempts": "",
    }
    row.update(values)
    return row


class TestLedgerAnalytics(unittest.TestCase):
    def test_summary_has_thresholds_mean_median_bytes_and_attempts(self) -> None:
        report = summarize([
            _row("one", "90", result="shipped", text_size="12", attempts="2"),
            _row("one", "40", park_class="structural", attempts="3"),
            _row("one", "unknown"),
        ])
        self.assertEqual(report["n"], 2)
        self.assertEqual(report["numeric_match_pct"], 1)
        self.assertEqual(report["at_least_85"], 0)
        self.assertEqual(report["at_least_75"], 0)
        self.assertEqual(report["below_50"], 1)
        self.assertEqual(report["shipped_bytes"], 12)
        self.assertEqual(report["attempts_recorded"], 1)
        self.assertEqual(report["attempts_excluded"], 1)
        self.assertEqual(report["effort_strata"][2]["shipped"], 1)
        self.assertEqual(report["effort_strata"][3]["numeric_match_pct"], 1)
        self.assertIn("reg-alloc", report["park_class"])

    def test_effort_strata_excludes_blank_and_flags_mixed_brief(self) -> None:
        rows = [
            _row("lane", "40", attempts="1"),
            _row("lane", "80", attempts="3"),
            _row("lane", "unknown"),
        ]
        report = summarize(rows)
        self.assertEqual(report["attempts_excluded"], 1)
        self.assertEqual(set(report["effort_strata"]), {1, 3})
        self.assertEqual(report["effort_strata"][1]["ship_rate"], 0)
        self.assertEqual(report["effort_inhomogeneous"]["lane"], (1, 3))

    def test_select_rows_preserves_comparison_order(self) -> None:
        rows = [_row("b", "20"), _row("a", "80")]
        selected = select_rows(rows, ["a", "b"])
        self.assertEqual(list(selected), ["a", "b"])
        self.assertEqual(selected["a"][0]["match_pct"], "80")

    def test_render_always_states_self_reported_caveat(self) -> None:
        output = render({"one": [_row("one", "50")]})
        self.assertIn("agent-reported", output)
        self.assertIn("park_class", output)
        self.assertIn("Effort-stratified views", output)
        self.assertIn("attempts excluded (blank/non-integer) = 1", output)
        self.assertIn("effort-inhomogeneous briefs: none", output)

    def test_live_brief_can_be_selected_without_pinning_cardinality(self) -> None:
        from ledger_analytics import load_rows

        rows = load_rows()
        briefs = sorted({row.get("brief", "") for row in rows if row.get("brief")})
        self.assertTrue(briefs)
        selected = select_rows(rows, briefs[:1])
        self.assertTrue(selected[briefs[0]])


if __name__ == "__main__":
    unittest.main()
