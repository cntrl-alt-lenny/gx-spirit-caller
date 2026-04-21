"""Unit tests for generate_heatmap.synthesize_report_from_delinks.

Covers the CI fallback path that builds a report.json-shaped dict
from config/<ver>/**/delinks.txt when objdiff hasn't produced a real
report.json. The primary invariant under test is the one Codex
flagged on PR #42:

    Top-level totals MUST come from the module-level section map,
    not from the sum of TU ranges. Otherwise, modules that have
    only the module map (no TUs carved yet) contribute zero bytes
    and carved modules appear at inflated match percentages.
"""

from __future__ import annotations

import sys
import tempfile
import unittest
from pathlib import Path

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

from generate_heatmap import (  # noqa: E402
    _module_name_from_delinks_path,
    synthesize_report_from_delinks,
)


# ---- delinks.txt fixture helpers ---------------------------------------- #

MODULE_MAP_ONLY = """\
.text       start:0x02000000 end:0x02001000 kind:code align:4
.rodata     start:0x02001000 end:0x02001400 kind:data align:4
"""

MODULE_WITH_ONE_COMPLETE_TU = """\
.text       start:0x02000000 end:0x02001000 kind:code align:4
.rodata     start:0x02001000 end:0x02001400 kind:data align:4

src/main/foo.c:
    complete
    .text start:0x02000000 end:0x02000100
    .rodata start:0x02001000 end:0x02001080
"""

MODULE_WITH_PARTIAL_TU = """\
.text       start:0x02000000 end:0x02001000 kind:code align:4
.rodata     start:0x02001000 end:0x02001400 kind:data align:4

src/main/foo.c:
    complete
    .text start:0x02000000 end:0x02000200
"""

MODULE_WITH_FULL_TU_COVERAGE = """\
.text       start:0x02000000 end:0x02000400 kind:code align:4

src/main/foo.c:
    complete
    .text start:0x02000000 end:0x02000200
src/main/bar.c:
    complete
    .text start:0x02000200 end:0x02000400
"""


def _write_delinks(root: Path, rel: str, body: str) -> None:
    path = root / rel
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(body)


# ------------------------------------------------------------------------- #


class TestModuleNameFromDelinksPath(unittest.TestCase):
    def test_arm9_main(self):
        config = Path("/x/config/eur")
        p = config / "arm9" / "delinks.txt"
        self.assertEqual(_module_name_from_delinks_path(p, config), "arm9")

    def test_overlay(self):
        config = Path("/x/config/eur")
        p = config / "arm9" / "overlays" / "ov020" / "delinks.txt"
        self.assertEqual(_module_name_from_delinks_path(p, config), "ov020")

    def test_unrelated_path_does_not_raise(self):
        # If the path isn't under config_dir, fall back to a safe default
        # instead of raising. Belt-and-braces for unexpected layouts.
        p = Path("/tmp/loose/delinks.txt")
        name = _module_name_from_delinks_path(p, Path("/x/config/eur"))
        self.assertEqual(name, "loose")


class TestSynthesizeReportFromDelinks(unittest.TestCase):
    def test_no_delinks_returns_none(self):
        with tempfile.TemporaryDirectory() as td:
            self.assertIsNone(synthesize_report_from_delinks(Path(td)))

    def test_module_map_only_synthesizes_gap_with_full_totals(self):
        # The bug Codex flagged: a module with only the section map
        # (no carved TUs yet) used to contribute ZERO bytes. Now it
        # should contribute its full section-map totals via a single
        # synthetic gap cell.
        with tempfile.TemporaryDirectory() as td:
            config = Path(td)
            _write_delinks(config, "arm9/delinks.txt", MODULE_MAP_ONLY)

            report = synthesize_report_from_delinks(config)
            self.assertIsNotNone(report)
            m = report["measures"]
            # .text is 0x1000 bytes = 4096.
            self.assertEqual(int(m["total_code"]), 0x1000)
            # .rodata is 0x400 bytes = 1024.
            self.assertEqual(int(m["total_data"]), 0x400)
            # Nothing matched yet.
            self.assertEqual(int(m["matched_code"]), 0)
            self.assertEqual(int(m["matched_data"]), 0)
            # One synthetic gap cell covering the whole module.
            self.assertEqual(len(report["units"]), 1)
            gap = report["units"][0]
            self.assertEqual(gap["name"], "_dsd_gap@arm9")
            self.assertEqual(int(gap["measures"]["total_code"]), 0x1000)
            self.assertEqual(int(gap["measures"]["total_data"]), 0x400)

    def test_full_tu_coverage_emits_no_gap(self):
        # When TUs cover the whole module, no synthetic gap should
        # appear — otherwise you'd get a zero-sized ghost cell.
        with tempfile.TemporaryDirectory() as td:
            config = Path(td)
            _write_delinks(
                config, "arm9/delinks.txt", MODULE_WITH_FULL_TU_COVERAGE,
            )
            report = synthesize_report_from_delinks(config)
            names = [u["name"] for u in report["units"]]
            self.assertEqual(names, ["src/main/foo.c", "src/main/bar.c"])
            # Totals: 0x400 code, 0 data.
            m = report["measures"]
            self.assertEqual(int(m["total_code"]), 0x400)
            self.assertEqual(int(m["total_data"]), 0)
            # Both complete → all matched.
            self.assertEqual(int(m["matched_code"]), 0x400)
            self.assertEqual(m["complete_code"], 2)

    def test_partial_tu_coverage_emits_remainder_gap(self):
        with tempfile.TemporaryDirectory() as td:
            config = Path(td)
            _write_delinks(
                config, "arm9/delinks.txt", MODULE_WITH_PARTIAL_TU,
            )
            report = synthesize_report_from_delinks(config)
            # TU + gap.
            names = [u["name"] for u in report["units"]]
            self.assertEqual(names, ["src/main/foo.c", "_dsd_gap@arm9"])
            # Totals mirror the module map, not the TU sum.
            m = report["measures"]
            self.assertEqual(int(m["total_code"]), 0x1000)
            self.assertEqual(int(m["total_data"]), 0x400)
            # Gap has the remainder.
            gap = report["units"][1]
            self.assertEqual(
                int(gap["measures"]["total_code"]), 0x1000 - 0x200,
            )
            self.assertEqual(int(gap["measures"]["total_data"]), 0x400)
            # Only the TU's 0x200 bytes count as matched.
            self.assertEqual(int(m["matched_code"]), 0x200)

    def test_top_level_totals_survive_empty_module(self):
        # This is the regression check for Codex's P1: two modules,
        # one has TUs one doesn't. Before the fix, the empty module
        # contributed 0 to totals → the carved one's percentage was
        # inflated to ~100%. After: totals honestly reflect both.
        with tempfile.TemporaryDirectory() as td:
            config = Path(td)
            # Module A: fully carved & complete.
            _write_delinks(
                config, "arm9/delinks.txt", MODULE_WITH_FULL_TU_COVERAGE,
            )
            # Module B: no TUs yet.
            _write_delinks(
                config, "arm9/overlays/ov020/delinks.txt", MODULE_MAP_ONLY,
            )

            report = synthesize_report_from_delinks(config)
            m = report["measures"]
            # A: 0x400 code. B: 0x1000 code + 0x400 data.
            self.assertEqual(int(m["total_code"]), 0x400 + 0x1000)
            self.assertEqual(int(m["total_data"]), 0x400)
            # Only A is matched.
            self.assertEqual(int(m["matched_code"]), 0x400)
            self.assertEqual(int(m["matched_data"]), 0)
            # Overall matched fraction: 0x400 / (0x400 + 0x1000 + 0x400)
            # = 1024 / 6144 ≈ 16.7%. Pre-fix: 100% of A alone = 100%.
            matched = int(m["matched_code"]) + int(m["matched_data"])
            total = int(m["total_code"]) + int(m["total_data"])
            self.assertLess(matched / total, 0.20)
            # Gap cell for ov020 exists.
            names = [u["name"] for u in report["units"]]
            self.assertIn("_dsd_gap@ov020", names)

    def test_gap_tu_in_delinks_is_not_double_gapped(self):
        # If dsd itself emitted a gap TU, don't double-count it when
        # synthesizing the remainder.
        module_with_dsd_gap = (
            ".text       start:0x02000000 end:0x02001000 kind:code align:4\n"
            "\n"
            "src/main/foo.c:\n"
            "    complete\n"
            "    .text start:0x02000000 end:0x02000200\n"
            "_dsd_gap@arm9_0:\n"
            "    .text start:0x02000200 end:0x02001000\n"
        )
        with tempfile.TemporaryDirectory() as td:
            config = Path(td)
            _write_delinks(config, "arm9/delinks.txt", module_with_dsd_gap)
            report = synthesize_report_from_delinks(config)
            # dsd's gap + the complete TU cover everything, so no
            # synthetic _dsd_gap@arm9 should be appended.
            names = [u["name"] for u in report["units"]]
            self.assertEqual(names, ["src/main/foo.c", "_dsd_gap@arm9_0"])
            m = report["measures"]
            self.assertEqual(int(m["total_code"]), 0x1000)
            self.assertEqual(int(m["matched_code"]), 0x200)


if __name__ == "__main__":
    unittest.main()
