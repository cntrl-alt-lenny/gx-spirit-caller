import importlib.util
import sys
import tempfile
import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
SPEC = importlib.util.spec_from_file_location("build_master_ledger", ROOT / "tools/build_master_ledger.py")
LEDGER = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(LEDGER)


class BuildMasterLedgerTest(unittest.TestCase):
    def test_two_modules_three_functions(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            main_symbols = root / "main-symbols.txt"
            main_delinks = root / "main-delinks.txt"
            ov_symbols = root / "ov-symbols.txt"
            ov_delinks = root / "ov-delinks.txt"
            main_symbols.write_text(
                "func_main_a kind:function(arm,size=0x40) addr:0x02000010\n"
                "func_main_b kind:function(arm,size=0x20) addr:0x02000050\n"
            )
            main_delinks.write_text("    .text start:0x02000050 end:0x02000070\n")
            ov_symbols.write_text(
                "func_ov002_c kind:function(thumb,size=0x100) addr:0x021aa010\n"
            )
            ov_delinks.write_text("")
            rows = LEDGER.build_region_rows(
                "eur",
                [("main", main_symbols, main_delinks), ("ov002", ov_symbols, ov_delinks)],
                dossiers={("ov002", 0x021AA010)},
                twins={("eur", "ov002", 0x021AA010): "func_ov002_twin"},
            )
        self.assertEqual(len(rows), 2)
        self.assertEqual(rows[0], {
            "region": "eur", "module": "main", "name": "func_main_a",
            "addr": "0x02000010", "size": 0x40, "bucket": "<0x100",
            "mode": "arm", "has_dossier": False, "twin": None,
            "attempted": False, "park_reason": None,
        })
        self.assertEqual(rows[1]["mode"], "thumb")
        self.assertEqual(rows[1]["has_dossier"], True)
        self.assertEqual(rows[1]["twin"], "func_ov002_twin")


if __name__ == "__main__":
    unittest.main()
