"""Regression tests for metadata-driven source discovery in port_census."""

from __future__ import annotations

import sys
import tempfile
import unittest
from pathlib import Path
from unittest import mock

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

import port_census  # noqa: E402
from port_census import (  # noqa: E402
    scan_eur_tree,
    scan_tree,
    summarize_backlog,
    summarize_nofile,
)


class TestRecursiveSourceDiscovery(unittest.TestCase):
    def test_empty_eur_baseline_fails_closed(self):
        with tempfile.TemporaryDirectory() as td:
            root = Path(td)
            (root / "src").mkdir()
            with mock.patch.object(port_census, "ROOT", root):
                rc = port_census.main()

            self.assertEqual(rc, 2)

    def test_region_scan_finds_one_level_down_source(self):
        with tempfile.TemporaryDirectory() as td:
            root = Path(td) / "src" / "usa"
            nested = root / "overlay005" / "data"
            nested.mkdir(parents=True)
            (nested / "ov005_021b1100.s").write_text("", encoding="utf-8")

            found, unparsed = scan_tree(root)

            self.assertEqual(found[("ov005", 0x021B1100)], {"s"})
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


class PortCensusMetadataTests(unittest.TestCase):
    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory()
        self.root = Path(self.tmp.name)
        (self.root / "config/eur/arm9/overlays/ov006").mkdir(parents=True)
        (self.root / "src/overlay006").mkdir(parents=True)
        symbols = "\n".join([
            "func_ov006_021b2ee4 kind:function(arm,size=0x8) addr:0x021b2ee4",
            "__sinit_ov006_021b2eec kind:function(arm,size=0x8) addr:0x021b2eec",
            "func_ov006_021b2ef4 kind:function(arm,size=0x4) addr:0x021b2ef4",
            "func_ov006_021b2ef8 kind:function(arm,size=0x4) addr:0x021b2ef8",
            "data_ov006_021b2efc kind:data(any) addr:0x021b2efc",
        ]) + "\n"
        (self.root / "config/eur/arm9/overlays/ov006/symbols.txt").write_text(symbols)
        delinks = "\n".join([
            "src/overlay006/ov006_021b2ee4.c:",
            "    complete",
            "    .text start:0x021b2ee4 end:0x021b2eec",
            "",
            "src/overlay006/sinit_ov006_021b2eec.c:",
            "    complete",
            "    .init start:0x021b2eec end:0x021b2ef4",
            "",
            "src/overlay006/ov006_stubs_2ef4.c:",
            "    complete",
            "    .text start:0x021b2ef4 end:0x021b2efc",
            "",
            "src/overlay006/data_ov006_021b2efc.c:",
            "    complete",
            "    .data start:0x021b2efc end:0x021b2f00",
            "",
        ])
        (self.root / "config/eur/arm9/overlays/ov006/delinks.txt").write_text(delinks)
        for name in (
            "ov006_021b2ee4.c",
            "sinit_ov006_021b2eec.c",
            "ov006_stubs_2ef4.c",
            "data_ov006_021b2efc.c",
        ):
            (self.root / "src/overlay006" / name).write_text("/* fixture */\n")
        self.old_root = port_census.ROOT
        port_census.ROOT = self.root

    def tearDown(self):
        port_census.ROOT = self.old_root
        self.tmp.cleanup()

    def test_noncanonical_shapes_resolve_from_delinks_and_symbols(self):
        mapping = port_census.source_function_addresses("eur")
        self.assertEqual(mapping["src/overlay006/ov006_021b2ee4.c"],
                         [("ov006", 0x021B2EE4)])
        self.assertEqual(mapping["src/overlay006/sinit_ov006_021b2eec.c"],
                         [("ov006", 0x021B2EEC)])
        self.assertEqual(mapping["src/overlay006/ov006_stubs_2ef4.c"], [
            ("ov006", 0x021B2EF4),
            ("ov006", 0x021B2EF8),
        ])
        self.assertNotIn("src/overlay006/data_ov006_021b2efc.c", mapping)

    def test_census_counts_functions_not_data_tus(self):
        entries, unresolved = port_census.scan_eur_tree(self.root / "src")
        self.assertEqual(
            {(module, addr) for module, addr, _ in entries},
            {
                ("ov006", 0x021B2EE4),
                ("ov006", 0x021B2EEC),
                ("ov006", 0x021B2EF4),
                ("ov006", 0x021B2EF8),
            },
        )
        self.assertEqual(len(unresolved), 1)
        self.assertTrue(unresolved[0].endswith("data_ov006_021b2efc.c"))


class TestPortCensusSummaries(unittest.TestCase):
    def test_backlog_summary_preserves_module_bytes_and_unknown_sim(self) -> None:
        summary = summarize_backlog([
            {"module": "main", "size": 12, "byte_sim": 1.0},
            {"module": "main", "size": 8, "byte_sim": 0.97},
            {"module": "ov002", "size": 4, "byte_sim": None},
        ])
        self.assertEqual(summary["count"], 3)
        self.assertEqual(summary["bytes"], 24)
        self.assertEqual(summary["by_module"]["main"], {"count": 2, "bytes": 20})
        self.assertEqual(
            summary["by_byte_sim"]["unavailable"],
            {"count": 1, "bytes": 4},
        )
        self.assertEqual(
            summary["by_byte_sim"]["byte-identical"],
            {"count": 1, "bytes": 12},
        )

    def test_no_target_summary_is_separate_new_work_cost(self) -> None:
        summary = summarize_nofile([
            {"module": "main", "size": 16},
            {"module": "ov002", "size": 6},
        ])
        self.assertEqual(summary["count"], 2)
        self.assertEqual(summary["bytes"], 22)
        self.assertEqual(summary["by_module"]["ov002"], {"count": 1, "bytes": 6})


if __name__ == "__main__":
    unittest.main()
