"""Regression tests for recursive source discovery in port_census."""

from __future__ import annotations

import sys
import tempfile
import unittest
from pathlib import Path

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

from port_census import scan_eur_tree, scan_tree  # noqa: E402


class TestRecursiveSourceDiscovery(unittest.TestCase):
    def test_region_scan_finds_one_level_down_source(self):
        with tempfile.TemporaryDirectory() as td:
            root = Path(td) / "src" / "usa"
            nested = root / "overlay005" / "data"
            nested.mkdir(parents=True)
            (nested / "ov005_021b1100.s").write_text("", encoding="utf-8")

            found, unparsed = scan_tree(root)

            self.assertEqual(found[("ov005", 0x021b1100)], {"s"})
            self.assertEqual(unparsed, [])

    def test_eur_scan_finds_one_level_down_source(self):
        with tempfile.TemporaryDirectory() as td:
            root = Path(td) / "src"
            nested = root / "main" / "data"
            nested.mkdir(parents=True)
            (nested / "func_02001000.c").write_text("", encoding="utf-8")

            found, unparsed = scan_eur_tree(root)

            self.assertEqual(found, [("main", 0x02001000, nested / "func_02001000.c")])
            self.assertEqual(unparsed, [])


if __name__ == "__main__":
    unittest.main()
