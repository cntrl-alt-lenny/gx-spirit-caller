import sys
import unittest
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "tools"))

from naming_census import module_for, parse_symbols  # noqa: E402


class TestNamingCensus(unittest.TestCase):
    def test_parse_classifies_placeholders_and_real_names(self):
        text = "\n".join([
            "func_02000000 kind:function(arm,size=0x10) addr:0x02000000",
            "__sinit_main_02000010 kind:function(arm,size=0x8) addr:0x02000010",
            "Duel_Start kind:function(arm,size=0x20) addr:0x02000018",
            "data_02000038 kind:data(word) addr:0x02000038",
        ])
        self.assertEqual(parse_symbols(text), (3, 2, 1))

    def test_module_for_special_and_overlay_paths(self):
        root = Path("/tmp/config/eur")
        self.assertEqual(module_for(root / "arm9/symbols.txt", root), "main")
        self.assertEqual(module_for(root / "arm9/itcm/symbols.txt", root), "itcm")
        self.assertEqual(module_for(root / "arm9/overlays/ov004/symbols.txt", root), "ov004")


if __name__ == "__main__":
    unittest.main()
