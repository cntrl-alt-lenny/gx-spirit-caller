from __future__ import annotations

import sys
from pathlib import Path
from unittest import TestCase
from unittest.mock import patch

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))

import park_one  # noqa: E402


class ParkOneLedgerTests(TestCase):
    def test_park_one_restores_and_records_attempt(self) -> None:
        import tempfile

        with tempfile.TemporaryDirectory() as temp:
            root = Path(temp)
            c_rel = "src/main/func_02000010.c"
            s_rel = "src/main/func_02000010.s"
            c_path = root / c_rel
            s_path = root / s_rel
            delinks = root / "config/eur/arm9/delinks.txt"
            ledger = root / "docs/research/campaign-analytics/attempts.tsv"
            c_path.parent.mkdir(parents=True)
            delinks.parent.mkdir(parents=True)
            ledger.parent.mkdir(parents=True)
            c_path.write_text("draft\n", encoding="utf-8")
            s_path.write_text("original\n", encoding="utf-8")
            delinks.write_text(
                f"{c_rel}:\n"
                "    complete\n"
                "    .text start:0x02000010 end:0x02000028\n",
                encoding="utf-8",
            )
            ledger.write_text(
                "addr\tmodule\ttext_size\ttier\tshape\tresult\tmatch_pct\tpark_class\tbrief\n",
                encoding="utf-8",
            )

            with patch.object(park_one, "ROOT", root), patch.object(
                park_one,
                "_is_already_applied",
                return_value=delinks,
            ):
                result = park_one.park_one(
                    c_rel,
                    "eur",
                    shape="guard-chain",
                    match_pct="75.0",
                    park_class="reg-alloc",
                    brief="brief-test",
                )

            self.assertEqual(result, 0)
            self.assertFalse(c_path.exists())
            self.assertEqual(s_path.read_text(encoding="utf-8"), "original\n")
            self.assertIn(f"{s_rel}:\n", delinks.read_text(encoding="utf-8"))
            rows = ledger.read_text(encoding="utf-8").splitlines()
            self.assertEqual(
                rows[-1],
                "0x02000010\tmain\t24\tdefault\tguard-chain\tparked\t75.0\treg-alloc\tbrief-test",
            )

