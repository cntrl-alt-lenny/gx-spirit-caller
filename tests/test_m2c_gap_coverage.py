"""Regression tests for tools/m2c_gap_coverage.py (q-large-band-reachability,
q-find-object-persource)."""

from __future__ import annotations

import sys
import tempfile
import unittest
from pathlib import Path
from unittest import mock

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

from m2c_gap_coverage import (  # noqa: E402
    BANDS,
    band_for,
    build_state,
    coverage_by_band,
    module_to_src_dir,
    parse_func_headers,
)


class TestParseFuncHeaders(unittest.TestCase):
    """This exact function had a real bug during development: FUNC_HDR_RE
    without re.MULTILINE matched a single isolated line in a unit test but
    silently matched NOTHING against real multi-line objdump output,
    because bare ^/$ anchor to the whole string, not each line, without
    that flag. Every test here exercises MULTI-LINE input specifically,
    so a regression back to that bug fails loudly instead of passing on
    a misleadingly simple single-line fixture."""

    def test_extracts_function_header_from_multiline_output(self):
        text = (
            "build/eur/delinks/_dsd_gap@main_1.o:     file format elf32-littlearm\n"
            "\n"
            "Disassembly of section .text:\n"
            "\n"
            "00000000 <func_0207c9f0>:\n"
            "   0:\te92d4000 \tstmfd\tsp!, {lr}\n"
        )
        self.assertEqual(parse_func_headers(text), {"func_0207c9f0"})

    def test_extracts_multiple_headers_across_multiple_files_in_one_batch(self):
        text = (
            "a.o:     file format elf32-littlearm\n\n"
            "00000000 <func_02000100>:\n"
            "  0:\te1a00000 \tnop\n\n"
            "b.o:     file format elf32-littlearm\n\n"
            "00000000 <func_02000200>:\n"
            "  0:\te1a00000 \tnop\n"
        )
        self.assertEqual(parse_func_headers(text),
                          {"func_02000100", "func_02000200"})

    def test_excludes_internal_L_branch_target_labels(self):
        text = (
            "a.o:     file format elf32-littlearm\n\n"
            "00000000 <func_0207c9f0>:\n"
            "   0:\te59f1024 \tldr\tr1, [pc, #36]\t@ 4c <.L_0207ca3c>\n"
            "0000004c <.L_0207ca3c>:\n"
            "  4c:\te1a00000 \tnop\n"
        )
        result = parse_func_headers(text)
        self.assertEqual(result, {"func_0207c9f0"})
        self.assertNotIn(".L_0207ca3c", result)

    def test_named_function_header_is_captured(self):
        text = "a.o:     file format elf32-littlearm\n\n00000000 <OS_DisableIrq>:\n"
        self.assertEqual(parse_func_headers(text), {"OS_DisableIrq"})

    def test_empty_text_returns_empty_set(self):
        self.assertEqual(parse_func_headers(""), set())

    def test_no_function_definitions_data_only_object(self):
        text = (
            "a.o:     file format elf32-littlearm\n\n"
            "SYMBOL TABLE:\n"
            "00000000 g     O .data\t00000008 data_020c3fa8\n"
        )
        self.assertEqual(parse_func_headers(text), set())


class TestModuleToSrcDir(unittest.TestCase):
    def test_main(self):
        self.assertEqual(module_to_src_dir("main"), "main")

    def test_overlay_zero_padded(self):
        self.assertEqual(module_to_src_dir("ov005"), "overlay005")
        self.assertEqual(module_to_src_dir("ov002"), "overlay002")

    def test_unrecognized_module_passed_through(self):
        self.assertEqual(module_to_src_dir("itcm"), "itcm")


class TestBandFor(unittest.TestCase):
    def test_every_band_boundary_is_covered_exactly_once(self):
        # The published band edges: no gaps, no overlaps.
        boundaries = [0, 192, 193, 256, 257, 320, 321, 376, 377, 512,
                      513, 1023, 1024, 999999]
        for size in boundaries:
            label = band_for(size)
            self.assertIsNotNone(label, f"size {size} landed in no band")

    def test_192_is_top_of_first_band_not_second(self):
        self.assertEqual(band_for(192), "<=192 B")
        self.assertEqual(band_for(193), "193-256 B")

    def test_1024_is_bottom_of_unbounded_top_band(self):
        self.assertEqual(band_for(1024), ">=1024 B")
        self.assertEqual(band_for(1023), "513-1023 B")

    def test_arbitrarily_large_size_lands_in_top_band(self):
        self.assertEqual(band_for(50_000), ">=1024 B")


class TestCoverageByBand(unittest.TestCase):
    def _row(self, size, bl_blx=4, name="func_x", in_gap=True, persource=None):
        row = {"size": size, "bl_blx": bl_blx, "name": name, "in_gap": in_gap}
        if persource is not None:
            row["has_persource_obj"] = persource
        return row

    def test_below_dispatch_threshold_excluded(self):
        rows = [self._row(200, bl_blx=3)]  # below DISPATCH_MIN_BL_BLX=4
        out = coverage_by_band(rows)
        row = next(r for r in out if r["band"] == "193-256 B")
        self.assertEqual(row["dispatch_candidates"], 0)

    def test_unnamed_candidate_excluded(self):
        rows = [self._row(200, name=None)]
        out = coverage_by_band(rows)
        row = next(r for r in out if r["band"] == "193-256 B")
        self.assertEqual(row["dispatch_candidates"], 0)

    def test_coverage_percentage_by_count_and_bytes(self):
        rows = [
            self._row(200, in_gap=True),
            self._row(250, in_gap=False, persource=True),
        ]
        out = coverage_by_band(rows)
        row = next(r for r in out if r["band"] == "193-256 B")
        self.assertEqual(row["dispatch_candidates"], 2)
        self.assertEqual(row["in_gap_candidates"], 1)
        self.assertAlmostEqual(row["coverage_pct_by_count"], 50.0)
        self.assertEqual(row["not_in_gap_with_persource_object"], 1)
        self.assertEqual(row["not_in_gap_candidates"], 1)

    def test_empty_band_reports_none_not_zero_percent(self):
        out = coverage_by_band([])
        for row in out:
            self.assertIsNone(row["coverage_pct_by_count"])
            self.assertIsNone(row["coverage_pct_by_bytes"])

    def test_every_band_from_module_constant_present(self):
        out = coverage_by_band([])
        self.assertEqual([r["band"] for r in out], [b[0] for b in BANDS])


class TestBuildState(unittest.TestCase):
    """build_state() reports the counts a coverage run actually depends
    on (q-find-object-persource, brain round 0901) -- a tree whose gap
    objects are mostly-empty stubs reports ~0% coverage everywhere with
    the SAME code that reports 45-68% against a fully-populated tree;
    these two counts turn that silent dependency into a visible one."""

    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory()
        self.addCleanup(self.tmp.cleanup)
        self.root = Path(self.tmp.name)
        self.delinks = self.root / "build" / "eur" / "delinks"
        self.delinks.mkdir(parents=True)

    def test_counts_gap_objects_and_uses_passed_in_functions(self):
        (self.delinks / "_dsd_gap@main_1.o").write_bytes(b"")
        (self.delinks / "_dsd_gap@main_2.o").write_bytes(b"")
        with mock.patch("m2c_gap_coverage.ROOT", self.root):
            state = build_state("eur", gap_funcs={"func_a", "func_b", "func_c"})
        self.assertEqual(state["gap_object_count"], 2)
        self.assertEqual(state["gap_distinct_function_count"], 3)
        self.assertEqual(state["region"], "eur")

    def test_scans_functions_itself_when_not_passed(self):
        (self.delinks / "_dsd_gap@main_1.o").write_bytes(b"")
        with mock.patch("m2c_gap_coverage.subprocess.run") as run:
            run.return_value = mock.Mock(
                stdout="a.o:     file format elf32-littlearm\n\n00000000 <func_x>:\n"
            )
            with mock.patch("m2c_gap_coverage.ROOT", self.root):
                state = build_state("eur")
        self.assertEqual(state["gap_object_count"], 1)
        self.assertEqual(state["gap_distinct_function_count"], 1)

    def test_mostly_empty_gap_objects_report_low_function_count_not_error(self):
        # The exact shape that motivated this item: many objects, few
        # distinct functions -- 754 objects / 55 functions on the
        # integration tree that reproduced ~0% coverage everywhere.
        for n in range(5):
            (self.delinks / f"_dsd_gap@main_{n}.o").write_bytes(b"")
        with mock.patch("m2c_gap_coverage.ROOT", self.root):
            state = build_state("eur", gap_funcs={"func_only_one"})
        self.assertEqual(state["gap_object_count"], 5)
        self.assertEqual(state["gap_distinct_function_count"], 1)

    def test_zero_gap_objects_reports_zero_not_error(self):
        with mock.patch("m2c_gap_coverage.ROOT", self.root):
            state = build_state("eur", gap_funcs=set())
        self.assertEqual(state["gap_object_count"], 0)
        self.assertEqual(state["gap_distinct_function_count"], 0)


if __name__ == "__main__":
    unittest.main()
