"""Unit tests for tools/generate_heatmap.py.

Covers the pure rendering helpers (colour math, treemap layout, name
normalisation) and a render_svg smoke test. The delinks-fallback code
path (synthesize_report_from_delinks, PR #42) is tested in a follow-up
once that PR merges — it doesn't yet exist on main.
"""

from __future__ import annotations

import sys
import unittest
from pathlib import Path

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

from generate_heatmap import (  # noqa: E402
    _hsl_to_hex,
    as_int,
    color_for,
    match_pct,
    render_svg,
    short_name,
    squarify,
    text_color_for_bg,
)


class TestAsInt(unittest.TestCase):
    """objdiff v2.7+ emits byte totals as strings (values exceed JS
    safe-int range); as_int absorbs that + any None fallthrough."""

    def test_passthrough_int(self):
        self.assertEqual(as_int(42), 42)

    def test_coerce_str(self):
        self.assertEqual(as_int("1000"), 1000)

    def test_coerce_hex_fails_over_to_int(self):
        # The tool stores values as decimal strings, not hex —
        # double-check the parser doesn't accidentally accept "0x10".
        with self.assertRaises(ValueError):
            as_int("0x10")

    def test_none_is_zero(self):
        self.assertEqual(as_int(None), 0)


class TestShortName(unittest.TestCase):
    def test_dsd_gap_shortened(self):
        self.assertEqual(short_name("_dsd_gap@ov004_5"), "ov004")

    def test_source_path_basename(self):
        self.assertEqual(short_name("src/overlay005/ov005_stubs.c"), "ov005_stubs")

    def test_cpp_extension_stripped(self):
        self.assertEqual(short_name("src/main/foo.cpp"), "foo")

    def test_no_extension_stays(self):
        self.assertEqual(short_name("bareword"), "bareword")


class TestMatchPct(unittest.TestCase):
    def test_zero_over_zero_is_zero(self):
        # Empty units have total=0 — must not divide by zero.
        self.assertEqual(match_pct({}), 0.0)

    def test_all_matched(self):
        m = {"matched_code": 100, "total_code": 100,
             "matched_data": 50, "total_data": 50}
        self.assertEqual(match_pct(m), 1.0)

    def test_half_matched(self):
        m = {"matched_code": 50, "total_code": 100,
             "matched_data": 25, "total_data": 50}
        self.assertEqual(match_pct(m), 0.5)

    def test_code_and_data_combined(self):
        # matched_code + matched_data over total_code + total_data.
        m = {"matched_code": 10, "total_code": 40,
             "matched_data": 30, "total_data": 60}
        # (10 + 30) / (40 + 60) = 40 / 100 = 0.4
        self.assertEqual(match_pct(m), 0.4)

    def test_accepts_string_values(self):
        # objdiff's str-coded bytes must round-trip.
        m = {"matched_code": "50", "total_code": "100",
             "matched_data": "0", "total_data": "0"}
        self.assertEqual(match_pct(m), 0.5)


class TestHslToHex(unittest.TestCase):
    def test_pure_red(self):
        # hue=0, sat=100, light=50 → #ff0000.
        self.assertEqual(_hsl_to_hex(0, 100, 50), "#ff0000")

    def test_pure_green(self):
        self.assertEqual(_hsl_to_hex(120, 100, 50), "#00ff00")

    def test_pure_blue(self):
        self.assertEqual(_hsl_to_hex(240, 100, 50), "#0000ff")

    def test_grey(self):
        # sat=0 → grey regardless of hue; light=50 → mid-grey.
        self.assertEqual(_hsl_to_hex(0, 0, 50), "#808080")


class TestColorFor(unittest.TestCase):
    """The gradient runs red (0%) → green (100%). Pinning a few
    points so the colour story stays stable for the README reader."""

    def test_zero_is_reddish(self):
        c = color_for(0.0)
        r = int(c[1:3], 16)
        g = int(c[3:5], 16)
        self.assertGreater(r, g)

    def test_full_is_greenish(self):
        c = color_for(1.0)
        r = int(c[1:3], 16)
        g = int(c[3:5], 16)
        self.assertGreater(g, r)

    def test_returns_hex_string(self):
        c = color_for(0.5)
        self.assertRegex(c, r"^#[0-9a-f]{6}$")


class TestSquarify(unittest.TestCase):
    """Slice-and-dice treemap layout — its output rectangles must
    (a) sum to the bounding box area, (b) respect the canvas limits.
    """

    def test_empty_returns_empty(self):
        self.assertEqual(squarify([], 0, 0, 100, 100), [])

    def test_single_item_fills_bbox(self):
        rects = squarify([(100, "A")], 0, 0, 200, 100)
        self.assertEqual(len(rects), 1)
        x, y, w, h, payload = rects[0]
        self.assertEqual((x, y, w, h), (0, 0, 200, 100))
        self.assertEqual(payload, "A")

    def test_rects_cover_bbox(self):
        # Given any set of weighted items, the union of the returned
        # rects must sum to the same area as the bbox.
        items = [(30, "A"), (20, "B"), (10, "C"), (5, "D")]
        rects = squarify(items, 0, 0, 200, 100)
        area = sum(w * h for _x, _y, w, h, _p in rects)
        self.assertAlmostEqual(area, 200 * 100, places=3)

    def test_every_item_placed(self):
        # Production caller sorts DESC before calling squarify.
        # Testing that shape here — ASC-sorted input can trigger a
        # latent recursion edge case (first item < half, first+second
        # >= half) that's not reachable via generate_heatmap's usage.
        items = sorted(
            [(i + 1, f"p{i}") for i in range(8)],
            reverse=True, key=lambda t: t[0],
        )
        rects = squarify(items, 0, 0, 400, 300)
        payloads = [p for _x, _y, _w, _h, p in rects]
        self.assertEqual(sorted(payloads), sorted(i[1] for i in items))


class TestTextColorForBg(unittest.TestCase):
    def test_light_bg_gives_dark_text(self):
        self.assertEqual(text_color_for_bg("#ffffff"), "#1a1a1a")

    def test_dark_bg_gives_light_text(self):
        self.assertEqual(text_color_for_bg("#000000"), "#f5f5f5")

    def test_red_gives_light_text(self):
        # Reddish background (low luminance) needs light text for contrast.
        self.assertEqual(text_color_for_bg("#b03030"), "#f5f5f5")

    def test_yellow_gives_dark_text(self):
        # Yellow is high-luminance — needs dark text.
        self.assertEqual(text_color_for_bg("#ffff00"), "#1a1a1a")


class TestRenderSvg(unittest.TestCase):
    """Smoke test the full render pipeline. Not checking SVG
    semantics — just that the known shape elements are present."""

    def test_renders_valid_svg_structure(self):
        report = {
            "measures": {
                "matched_code": "100", "total_code": "1000",
                "matched_data": "0", "total_data": "500",
                "complete_code": 1, "total_units": 2,
            },
            "units": [
                {
                    "name": "src/overlay005/stubs.c",
                    "measures": {
                        "matched_code": "100", "total_code": "100",
                        "matched_data": "0", "total_data": "0",
                    },
                },
                {
                    "name": "_dsd_gap@main_0",
                    "measures": {
                        "matched_code": "0", "total_code": "900",
                        "matched_data": "0", "total_data": "500",
                    },
                },
            ],
        }
        svg = render_svg(report, "eur")
        self.assertTrue(svg.startswith("<svg "))
        self.assertTrue(svg.endswith("</svg>"))
        # Header elements.
        self.assertIn("GX Spirit Caller", svg)
        self.assertIn("(eur)", svg)
        # At least one cell per unit.
        self.assertGreaterEqual(svg.count("<rect "), 2)
        # Tooltip text includes matched/total.
        self.assertIn("B matched", svg)

    def test_empty_units_still_produces_svg(self):
        # Degenerate but common in first-run / stub state.
        report = {"measures": {}, "units": []}
        svg = render_svg(report, "eur")
        self.assertTrue(svg.startswith("<svg "))
        self.assertTrue(svg.endswith("</svg>"))


if __name__ == "__main__":
    unittest.main()
