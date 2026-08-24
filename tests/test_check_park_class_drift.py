from __future__ import annotations

import csv
import sys
import tempfile
import unittest
from pathlib import Path

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

from check_park_class_drift import (  # noqa: E402
    drift_rows,
    load_rows,
    main,
    render,
)
from normalise_park_class import load_map  # noqa: E402


class TestCheckParkClassDrift(unittest.TestCase):
    def test_unmapped_value_is_reported_with_row_and_suggestion(self) -> None:
        rows = [{
            "addr": "0x02100010", "module": "ov002", "result": "parked",
            "park_class": "register-alloc-ish", "brief": "brief-new",
        }]
        drift = drift_rows(rows, load_map())
        output = render(drift, load_map())
        self.assertIn("UNMAPPED", output)
        self.assertIn("register-alloc-ish", output)
        self.assertIn("ov002/0x02100010", output)
        self.assertIn("suggestion=", output)

    def test_shipped_and_empty_values_are_not_drift(self) -> None:
        rows = [
            {"result": "shipped", "park_class": "unknown"},
            {"result": "parked", "park_class": ""},
        ]
        self.assertEqual(drift_rows(rows, load_map()), {})

    def test_cli_check_changes_from_red_to_clean_after_mapping(self) -> None:
        fields = ("addr", "module", "result", "park_class", "brief")
        with tempfile.TemporaryDirectory() as temp:
            root = Path(temp)
            ledger = root / "attempts.tsv"
            mapping = root / "map.tsv"
            row = {
                "addr": "0x02100010", "module": "ov002", "result": "parked",
                "park_class": "new-fake-wall", "brief": "brief-new",
            }
            with ledger.open("w", encoding="utf-8", newline="") as handle:
                writer = csv.DictWriter(handle, fieldnames=fields, delimiter="\t")
                writer.writeheader()
                writer.writerow(row)
            mapping.write_text(
                "raw\tfamily\tqualifier\trows\n"
                "reg-alloc\tPROVISIONAL:register-allocation\treg-alloc\t1\n",
                encoding="utf-8",
            )
            self.assertEqual(main([
                "--ledger", str(ledger), "--map", str(mapping), "--check",
            ]), 1)
            with mapping.open("a", encoding="utf-8") as handle:
                handle.write("new-fake-wall\tP-20\tmanual review\t1\n")
            self.assertEqual(main([
                "--ledger", str(ledger), "--map", str(mapping), "--check",
            ]), 0)

    def test_live_report_has_shape_without_pinning_ledger_counts(self) -> None:
        report = drift_rows(load_rows(), load_map())
        self.assertIsInstance(report, dict)
        self.assertTrue(all(raw for raw in report))


if __name__ == "__main__":
    unittest.main()
