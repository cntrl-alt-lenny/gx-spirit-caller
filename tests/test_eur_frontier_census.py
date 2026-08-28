"""Regression tests for tools/eur_frontier_census.py (q-eur-next-frontier)."""

from __future__ import annotations

import sys
import unittest
from pathlib import Path

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

from eur_frontier_census import (  # noqa: E402
    BANDS,
    DISPATCH_MIN_BL_BLX,
    _all_candidate_files,
    _in_band,
    band_totals,
)


class TestInBand(unittest.TestCase):
    def test_open_lower_bound(self):
        self.assertTrue(_in_band(50, None, 192))
        self.assertTrue(_in_band(192, None, 192))
        self.assertFalse(_in_band(193, None, 192))

    def test_open_upper_bound(self):
        self.assertTrue(_in_band(1024, 1024, None))
        self.assertTrue(_in_band(999999, 1024, None))
        self.assertFalse(_in_band(1023, 1024, None))

    def test_closed_range_inclusive_both_ends(self):
        self.assertTrue(_in_band(257, 257, 320))
        self.assertTrue(_in_band(320, 257, 320))
        self.assertFalse(_in_band(256, 257, 320))
        self.assertFalse(_in_band(321, 257, 320))


class TestAllCandidateFiles(unittest.TestCase):
    def test_flattens_every_module_and_file_kind(self):
        fake_per = {
            "main": {
                "coercible_files": [{"text_size": 10, "bl_blx": 1}],
                "unknown_files": [{"text_size": 20, "bl_blx": 5}],
                "no_marker_files": [{"text_size": None, "bl_blx": 0}],
                "permanent_files": [{"text_size": 999, "bl_blx": 9}],  # excluded
            },
            "ov005": {
                "coercible_files": [],
                "unknown_files": [{"text_size": 5, "bl_blx": 4}],
                "no_marker_files": [],
                "permanent_files": [],
            },
        }
        files = _all_candidate_files(fake_per)
        sizes = sorted(int(f.get("text_size") or 0) for f in files)
        self.assertEqual(sizes, [0, 5, 10, 20])
        # permanent_files must never be counted as a candidate.
        self.assertNotIn(999, sizes)


class TestBandTotals(unittest.TestCase):
    def _file(self, size, bl_blx):
        return {"text_size": size, "bl_blx": bl_blx}

    def test_dispatch_ready_requires_min_bl_blx(self):
        files = [
            self._file(200, DISPATCH_MIN_BL_BLX),      # meets threshold
            self._file(200, DISPATCH_MIN_BL_BLX - 1),  # just under
        ]
        totals = band_totals(files)
        row = next(r for r in totals if r["band"] == "193-256 B")
        self.assertEqual(row["dispatch_ready"]["candidates"], 1)
        self.assertEqual(row["dispatch_ready"]["bytes"], 200)
        self.assertEqual(row["size_only"]["candidates"], 2)
        self.assertEqual(row["size_only"]["bytes"], 400)

    def test_missing_bl_blx_key_treated_as_zero_not_a_crash(self):
        files = [{"text_size": 200}]  # no "bl_blx" key at all
        totals = band_totals(files)
        row = next(r for r in totals if r["band"] == "193-256 B")
        self.assertEqual(row["dispatch_ready"]["candidates"], 0)
        self.assertEqual(row["size_only"]["candidates"], 1)

    def test_every_band_from_the_module_constant_is_present_and_ordered(self):
        totals = band_totals([])
        self.assertEqual([r["band"] for r in totals], [b[0] for b in BANDS])

    def test_boundary_file_counted_in_exactly_one_band(self):
        # 192 is the top of "<=192 B" and must not also land in "193-256 B".
        files = [self._file(192, 10)]
        totals = band_totals(files)
        counts = {r["band"]: r["size_only"]["candidates"] for r in totals}
        self.assertEqual(counts["<=192 B"], 1)
        self.assertEqual(counts["193-256 B"], 0)

    def test_unbounded_top_band_includes_arbitrarily_large_file(self):
        files = [self._file(50_000, 10)]
        totals = band_totals(files)
        row = next(r for r in totals if r["band"] == ">=1024 B")
        self.assertEqual(row["size_only"]["candidates"], 1)
        self.assertEqual(row["size_only"]["bytes"], 50_000)


if __name__ == "__main__":
    unittest.main()
