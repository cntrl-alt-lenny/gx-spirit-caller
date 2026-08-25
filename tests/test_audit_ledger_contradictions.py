from __future__ import annotations

import sys
import unittest
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "tools"))

import audit_ledger_contradictions as audit  # noqa: E402


def _row(**values: str) -> dict[str, str]:
    row = {
        "module": "ov002",
        "addr": "0x02100010",
        "brief": "brief-a",
        "result": "parked",
        "park_class": "reg-alloc",
        "match_pct": "50",
        "attempts": "",
    }
    row.update(values)
    return row


class TestLedgerContradictions(unittest.TestCase):
    def test_module_aliases_share_a_key_instead_of_false_duplicate(self) -> None:
        rows = [_row(module="ov002"), _row(module="overlay002", brief="brief-b")]
        groups = audit.audit_rows(rows)
        self.assertEqual(groups[0].key, ("ov002", "0x02100010"))
        self.assertEqual(groups[0].classification, "LEGITIMATE")

    def test_region_module_is_not_folded_into_main_module(self) -> None:
        self.assertEqual(
            audit.audit_rows([_row(module="main"), _row(module="ov002")]), []
        )

    def test_park_then_ship_is_legitimate(self) -> None:
        rows = [
            _row(brief="PR#1414:aaaaaaaa"),
            _row(brief="PR#1435:bbbbbbbb", result="shipped", park_class="n/a"),
        ]
        self.assertEqual(audit.audit_rows(rows)[0].classification, "LEGITIMATE")

    def test_shipped_twice_is_contradictory(self) -> None:
        rows = [_row(result="shipped"), _row(brief="brief-b", result="shipped")]
        group = audit.audit_rows(rows)[0]
        self.assertEqual(group.classification, "CONTRADICTORY")
        self.assertIn("more than one shipped", group.reason)

    def test_ship_then_park_is_contradictory(self) -> None:
        rows = [
            _row(brief="PR#1435:bbbbbbbb", result="shipped"),
            _row(brief="PR#1440:cccccccc"),
        ]
        self.assertEqual(audit.audit_rows(rows)[0].classification, "CONTRADICTORY")

    def test_same_brief_different_result_without_tool_anomaly_is_ambiguous(self) -> None:
        rows = [_row(), _row(result="shipped")]
        self.assertEqual(audit.audit_rows(rows)[0].classification, "AMBIGUOUS")

    def test_tool_anomaly_retry_then_ship_is_legitimate(self) -> None:
        rows = [
            _row(park_class="tool-anomaly"),
            _row(result="shipped", park_class="n/a"),
        ]
        self.assertEqual(audit.audit_rows(rows)[0].classification, "LEGITIMATE")

    def test_unprovenanced_ship_then_park_is_ambiguous(self) -> None:
        rows = [_row(result="shipped"), _row(brief="brief-b")]
        self.assertEqual(audit.audit_rows(rows)[0].classification, "AMBIGUOUS")

    def test_backfilled_park_then_ship_uses_pr_order_not_row_order(self) -> None:
        rows = [
            _row(brief="PR#1435:55bd0f94", result="shipped"),
            _row(brief="PR#1414:bb6e87a4"),
        ]
        group = audit.audit_rows(rows)[0]
        self.assertEqual(group.classification, "LEGITIMATE")

    def test_exact_repeat_is_ambiguous(self) -> None:
        group = audit.audit_rows([_row(), _row()])[0]
        self.assertEqual(group.classification, "AMBIGUOUS")

    def test_live_audit_has_shape_not_a_pinned_cardinality(self) -> None:
        groups = audit.audit_rows(audit.load_rows())
        self.assertTrue(groups)
        self.assertTrue({group.classification for group in groups} <= {
            "LEGITIMATE", "CONTRADICTORY", "AMBIGUOUS",
        })
        self.assertTrue(all(len(group.rows) > 1 for group in groups))
