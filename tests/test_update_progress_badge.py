"""Unit tests for tools/update_progress_badge.py.

The tool reads `tools/progress.py --json` per region and rewrites
per-region shields.io badge URLs in README.md (one badge per region
in EUR / USA / JPN). Regressions would either:
  - Pick the wrong color band → badge looks misleadingly green at 1%
  - Mangle a region's URL → README renders a broken image for that region
  - Mis-parse the badge regex → false claim "no badge found"
  - Cross-region contamination → updating EUR overwrites the USA slot

Pinned cases:
  - color_for: every band boundary
  - render_badge_url: %25 escape for "%" character
  - _badge_re(region): matches that region's slot, ignores other regions
  - compute_pct: code-only formula; stub state returns 0
  - update_readme_for_region: idempotent when current; replaces text+color;
    bails on missing / duplicate slot
"""

from __future__ import annotations

import sys
import unittest
from pathlib import Path
from unittest import mock

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

from update_progress_badge import (  # noqa: E402
    REGIONS,
    REGION_LABEL,
    _badge_re,
    color_for,
    compute_pct,
    render_badge_url,
    update_readme_for_region,
)


class TestColorFor(unittest.TestCase):
    def test_full(self):
        self.assertEqual(color_for(100.0), "brightgreen")

    def test_high(self):
        self.assertEqual(color_for(75.0), "green")
        self.assertEqual(color_for(99.99), "green")

    def test_mid(self):
        self.assertEqual(color_for(50.0), "yellowgreen")
        self.assertEqual(color_for(74.99), "yellowgreen")

    def test_low_mid(self):
        self.assertEqual(color_for(25.0), "yellow")
        self.assertEqual(color_for(49.99), "yellow")

    def test_low(self):
        self.assertEqual(color_for(10.0), "orange")
        self.assertEqual(color_for(24.99), "orange")

    def test_floor(self):
        self.assertEqual(color_for(0.0), "red")
        self.assertEqual(color_for(9.99), "red")


class TestRenderBadgeUrl(unittest.TestCase):
    def test_percent_url_encoded(self):
        text, color = render_badge_url(42.5)
        # `%25` is the URL-encoded `%`. shields.io requires this.
        self.assertEqual(text, "42.50%25")
        self.assertEqual(color, "yellow")

    def test_two_decimal_places(self):
        text, _ = render_badge_url(3.4)
        self.assertEqual(text, "3.40%25")

    def test_zero_pct_red(self):
        text, color = render_badge_url(0.0)
        self.assertEqual(text, "0.00%25")
        self.assertEqual(color, "red")

    def test_full_pct_brightgreen(self):
        text, color = render_badge_url(100.0)
        self.assertEqual(color, "brightgreen")
        self.assertEqual(text, "100.00%25")


class TestRegionConstants(unittest.TestCase):
    def test_all_three_regions_listed(self):
        self.assertEqual(REGIONS, ("eur", "usa", "jpn"))

    def test_every_region_has_a_label(self):
        for region in REGIONS:
            self.assertIn(region, REGION_LABEL)
            self.assertEqual(REGION_LABEL[region], region.upper())


class TestBadgeRe(unittest.TestCase):
    def test_eur_regex_matches_eur_slot(self):
        url = "https://img.shields.io/badge/EUR-1.45%25-red?style=flat"
        m = _badge_re("eur").search(url)
        self.assertIsNotNone(m)
        self.assertEqual(m.group(2), "1.45%25")
        self.assertEqual(m.group(4), "red")

    def test_usa_regex_matches_usa_slot(self):
        url = "https://img.shields.io/badge/USA-0.00%25-red"
        m = _badge_re("usa").search(url)
        self.assertIsNotNone(m)
        self.assertEqual(m.group(2), "0.00%25")
        self.assertEqual(m.group(4), "red")

    def test_jpn_regex_matches_jpn_slot(self):
        url = "https://img.shields.io/badge/JPN-0.00%25-red"
        m = _badge_re("jpn").search(url)
        self.assertIsNotNone(m)

    def test_eur_regex_ignores_usa_slot(self):
        # Cross-region contamination guard: EUR regex must NOT match USA.
        url = "https://img.shields.io/badge/USA-0.00%25-red"
        self.assertIsNone(_badge_re("eur").search(url))

    def test_eur_regex_ignores_unrelated_shields_url(self):
        url = "https://img.shields.io/badge/License-MIT-blue"
        self.assertIsNone(_badge_re("eur").search(url))


class TestComputePct(unittest.TestCase):
    """Pin the badge formula. Earlier versions used code+data which
    made the badge under-represent visible progress (0.39% vs
    progress.py's 1.18% headline on 2026-05-08). The current
    code-only formula matches what progress.py prints prominently in
    its text output."""

    def _stub_progress_json(self, payload: dict):
        """Patch subprocess.check_output to return the JSON payload
        update_progress_badge.compute_pct expects."""
        import json as _json
        return mock.patch(
            "update_progress_badge.subprocess.check_output",
            return_value=_json.dumps(payload),
        )

    def test_stub_state_returns_zero(self):
        # Non-bootstrapped regions return state:stub from progress.py.
        # The badge tool resolves them to 0.0 (red) without erroring.
        with self._stub_progress_json({"state": "stub"}):
            self.assertEqual(compute_pct("eur"), 0.0)
            self.assertEqual(compute_pct("usa"), 0.0)
            self.assertEqual(compute_pct("jpn"), 0.0)

    def test_code_only_ratio_tracks_code_not_data(self):
        # With the historical code+data formula this would be:
        # (28188 + 0) / (2388172 + 4776528) = 0.39%.
        # Current code-only formula: 28188 / 2388172 = 1.18%.
        # The 1.18% number is what progress.py prints as the headline.
        with self._stub_progress_json({
            "state": "delinks",
            "measures": {
                "matched_code": "28188",
                "total_code": "2388172",
                "matched_data": "0",
                "total_data": "4776528",
            },
        }):
            pct = compute_pct("eur")
        self.assertAlmostEqual(pct, 28188 / 2388172 * 100.0, places=4)
        self.assertGreater(pct, 1.0)
        self.assertLess(pct, 1.5)

    def test_data_field_ignored(self):
        # Defensive: with some matched_data the formula must still
        # ignore data so a future "data tier match" doesn't suddenly
        # change the badge interpretation.
        with self._stub_progress_json({
            "state": "delinks",
            "measures": {
                "matched_code": "100",
                "total_code": "1000",
                "matched_data": "9999",
                "total_data": "9999",
            },
        }):
            pct = compute_pct("eur")
        self.assertAlmostEqual(pct, 10.0, places=4)

    def test_zero_total_returns_zero(self):
        with self._stub_progress_json({
            "state": "delinks",
            "measures": {
                "matched_code": "0",
                "total_code": "0",
                "matched_data": "0",
                "total_data": "0",
            },
        }):
            self.assertEqual(compute_pct("eur"), 0.0)

    def test_int_or_string_measures(self):
        for matched, total in [("100", "1000"), (100, 1000)]:
            with self._stub_progress_json({
                "state": "delinks",
                "measures": {
                    "matched_code": matched,
                    "total_code": total,
                },
            }):
                self.assertEqual(compute_pct("eur"), 10.0)


class TestUpdateReadmeForRegion(unittest.TestCase):
    """update_readme_for_region takes the readme contents string +
    region name + text + color, and returns (new_contents, summary).
    summary is None when the badge is already current."""

    def _readme_with(self, badge_lines: dict[str, tuple[str, str]]) -> str:
        """Build a synthetic README body with one badge per provided
        region. ``badge_lines = {"eur": ("1.45%25", "red"), ...}``."""
        lines = ["# Repo\n"]
        for region, (text, color) in badge_lines.items():
            label = REGION_LABEL[region]
            lines.append(
                f"![{label}](https://img.shields.io/badge/"
                f"{label}-{text}-{color})\n"
            )
        return "".join(lines)

    def test_idempotent_when_already_current(self):
        contents = self._readme_with({"eur": ("1.45%25", "red")})
        new, summary = update_readme_for_region(contents, "eur", "1.45%25", "red")
        self.assertIsNone(summary)
        self.assertIn("EUR-1.45%25-red", new)

    def test_replace_changes_text_and_color(self):
        contents = self._readme_with({"eur": ("1.45%25", "red")})
        new, summary = update_readme_for_region(contents, "eur", "1.75%25", "red")
        self.assertIsNotNone(summary)
        self.assertEqual(summary, "EUR: 1.45%25-red -> 1.75%25-red")
        self.assertIn("EUR-1.75%25-red", new)
        self.assertNotIn("EUR-1.45%25-red", new)

    def test_color_change_alone_triggers_update(self):
        contents = self._readme_with({"eur": ("25.00%25", "orange")})
        new, summary = update_readme_for_region(contents, "eur", "25.00%25", "yellow")
        self.assertIn("EUR-25.00%25-yellow", new)
        self.assertEqual(summary, "EUR: 25.00%25-orange -> 25.00%25-yellow")

    def test_updates_only_the_targeted_region(self):
        # Cross-region contamination guard: updating EUR must NOT touch
        # USA or JPN slots, even if their numbers would also have a
        # match against the regex shape.
        contents = self._readme_with({
            "eur": ("1.45%25", "red"),
            "usa": ("0.00%25", "red"),
            "jpn": ("0.00%25", "red"),
        })
        new, summary = update_readme_for_region(contents, "eur", "1.50%25", "red")
        self.assertIsNotNone(summary)
        self.assertIn("EUR-1.50%25-red", new)
        # USA + JPN slots untouched.
        self.assertIn("USA-0.00%25-red", new)
        self.assertIn("JPN-0.00%25-red", new)

    def test_missing_region_slot_raises_systemexit(self):
        # Only EUR badge present; asking to update USA must error.
        contents = self._readme_with({"eur": ("1.45%25", "red")})
        with self.assertRaises(SystemExit):
            update_readme_for_region(contents, "usa", "1.00%25", "red")

    def test_duplicate_region_slot_raises_systemexit(self):
        # Two EUR badges in the same README → ambiguous, must error.
        contents = (
            "![EUR](https://img.shields.io/badge/EUR-1.00%25-red)\n"
            "![EUR2](https://img.shields.io/badge/EUR-2.00%25-red)\n"
        )
        with self.assertRaises(SystemExit):
            update_readme_for_region(contents, "eur", "3.00%25", "red")


if __name__ == "__main__":
    unittest.main()
