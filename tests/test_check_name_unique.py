"""Tests for the committed-symbol uniqueness gate."""

from __future__ import annotations

import tempfile
import unittest
from pathlib import Path
import sys

TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(TOOLS))

from check_name_unique import check, name_addresses  # noqa: E402


class TestCheckNameUnique(unittest.TestCase):
    def _tree(self, files: dict[str, str]) -> Path:
        tmp = Path(tempfile.mkdtemp())
        for relative, content in files.items():
            path = tmp / relative
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(content)
        self.addCleanup(lambda: __import__("shutil").rmtree(tmp))
        return tmp

    def test_scans_main_and_overlays(self):
        root = self._tree({
            "eur/arm9/symbols.txt":
                "MainThing kind:function(arm,size=0x4) addr:0x02000000\n",
            "eur/arm9/overlays/ov004/symbols.txt":
                "OverlayThing kind:function(arm,size=0x4) addr:0x021c0000\n"
                "Taken kind:function(arm,size=0x4) addr:0x021c0004\n",
        })
        symbols = name_addresses(root, "eur")
        self.assertEqual(symbols["MainThing"], {0x02000000})
        self.assertEqual(symbols["OverlayThing"], {0x021C0000})
        self.assertTrue(check(root, "eur", 0x02000010, "Taken").collision)

    def test_same_address_reuse_is_allowed(self):
        root = self._tree({
            "eur/arm9/symbols.txt":
                "Known kind:function(arm,size=0x4) addr:0x02000000\n",
        })
        result = check(root, "eur", 0x02000000, "Known")
        self.assertFalse(result.collision)

    def test_absent_name_is_unique(self):
        root = self._tree({
            "eur/arm9/symbols.txt":
                "Known kind:function(arm,size=0x4) addr:0x02000000\n",
        })
        self.assertFalse(check(root, "eur", 0x02000000, "NewName").collision)


if __name__ == "__main__":
    unittest.main()
