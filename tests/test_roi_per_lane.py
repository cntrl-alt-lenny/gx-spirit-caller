from __future__ import annotations

import csv
import tempfile
import unittest
from pathlib import Path

import sys

ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(ROOT / "tools"))

from roi_per_lane import (  # noqa: E402
    aggregate_rows,
    build_rows,
    load_evidence,
    select_rounds,
)


def _write_tsv(path: Path, fieldnames: list[str], rows: list[dict[str, str]]) -> None:
    with path.open("w", encoding="utf-8", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fieldnames, delimiter="\t")
        writer.writeheader()
        writer.writerows(rows)


class TestRoiPerLane(unittest.TestCase):
    def test_blank_attempts_are_excluded_not_zero(self) -> None:
        with tempfile.TemporaryDirectory() as raw:
            root = Path(raw)
            evidence_path = root / "evidence.tsv"
            ledger_path = root / "ledger.tsv"
            evidence_fields = [
                "round", "lane", "item", "source", "full_gate_runs",
                "ledger_prefix", "candidates", "shipped", "shipped_bytes",
            ]
            _write_tsv(evidence_path, evidence_fields, [{
                "round": "r1", "lane": "CC-D", "item": "item",
                "source": "research.md", "full_gate_runs": "1",
                "ledger_prefix": "brief", "candidates": "",
                "shipped": "", "shipped_bytes": "",
            }])
            _write_tsv(ledger_path, ["brief", "result", "text_size", "attempts"], [
                {"brief": "brief", "result": "shipped", "text_size": "12", "attempts": ""},
                {"brief": "brief", "result": "parked", "text_size": "20", "attempts": "2"},
            ])
            evidence = load_evidence(evidence_path)
            with ledger_path.open(encoding="utf-8", newline="") as handle:
                ledger = list(csv.DictReader(handle, delimiter="\t"))
            rows = build_rows(evidence, ledger, ["r1"])
            self.assertEqual(rows[0]["attempts_recorded"], 1)
            self.assertEqual(rows[0]["attempts_excluded"], 1)
            self.assertEqual(rows[0]["attempt_sum"], 2)

    def test_last_selection_uses_round_labels_without_pinning_counts(self) -> None:
        evidence = load_evidence()
        selected = select_rounds(evidence, None, last=3)
        self.assertEqual(len(selected), 3)
        self.assertEqual(selected, sorted(selected, key=lambda value: (int("".join(c for c in value if c.isdigit())), value)))

    def test_explicit_round_selection_rejects_unknown_round(self) -> None:
        with self.assertRaises(ValueError):
            select_rounds(load_evidence(), ["not-a-round"])

    def test_output_is_per_lane_per_round(self) -> None:
        rows = aggregate_rows([
            {
                "round": "r1", "lane": "CC-D", "item": "a", "candidates": 2,
                "shipped": 1, "bytes": 10, "full_gate_runs": 1,
                "gate_region_runs": 3, "attempts_recorded": 2,
                "attempts_excluded": 0, "attempt_sum": 3,
            },
            {
                "round": "r1", "lane": "CC-D", "item": "b", "candidates": 1,
                "shipped": 0, "bytes": 0, "full_gate_runs": 1,
                "gate_region_runs": 3, "attempts_recorded": 1,
                "attempts_excluded": 0, "attempt_sum": 1,
            },
        ])
        self.assertEqual(len(rows), 1)
        self.assertEqual(rows[0]["candidates"], 3)
        self.assertEqual(rows[0]["shipped"], 1)
        self.assertEqual(rows[0]["attempt_sum"], 4)


if __name__ == "__main__":
    unittest.main()
