from __future__ import annotations

import csv
import sys
import tempfile
import unittest
from pathlib import Path
from unittest.mock import patch

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "tools"))

import park_one  # noqa: E402
import record_shipped  # noqa: E402


class TestRecordShipped(unittest.TestCase):
    def test_record_shipped_writes_explicit_attempts(self) -> None:
        with tempfile.TemporaryDirectory() as temp:
            root = Path(temp)
            c_rel = "src/main/func_02000020.c"
            delinks = root / "config/eur/arm9/delinks.txt"
            ledger = root / "docs/research/campaign-analytics/attempts.tsv"
            (root / c_rel).parent.mkdir(parents=True)
            delinks.parent.mkdir(parents=True)
            ledger.parent.mkdir(parents=True)
            (root / c_rel).write_text("shipped source\n", encoding="utf-8")
            delinks.write_text(
                f"{c_rel}:\n"
                "    complete\n"
                "    .text start:0x02000020 end:0x02000038\n",
                encoding="utf-8",
            )
            ledger.write_text(
                "addr\tmodule\ttext_size\ttier\tshape\tresult\tmatch_pct\t"
                "park_class\tpark_family\tbrief\tattempts\n",
                encoding="utf-8",
            )

            with patch.object(record_shipped, "ROOT", root), patch.object(
                record_shipped, "_is_already_applied", return_value=delinks
            ), patch.object(park_one, "ROOT", root):
                result = record_shipped.record_shipped(
                    c_rel, "eur", brief="brief-ship", attempts=3,
                )

            self.assertEqual(result, 0)
            with ledger.open(newline="", encoding="utf-8") as stream:
                row = list(csv.DictReader(stream, delimiter="\t"))[0]
            self.assertEqual(row["result"], "shipped")
            self.assertEqual(row["attempts"], "3")
