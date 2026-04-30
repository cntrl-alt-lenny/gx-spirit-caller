"""Unit tests for tools/update_progress_badge.py.

The tool reads `tools/progress.py --json` and rewrites the
shields.io badge URL in README.md. Regressions would either:
  - Pick the wrong color band → badge looks misleadingly green at 1%
  - Mangle the URL → README renders broken image
  - Mis-parse the badge regex → false claim "no badge found"

Pinned cases:
  - color_for: every band boundary
  - render_badge_url: %25 escape for "%" character
  - update_readme: idempotent when the badge is already current
  - update_readme: replaces text + color preserving the URL prefix
  - update_readme: bails when no Progress badge exists
  - BADGE_RE: matches typical README spelling but not unrelated URLs
"""

from __future__ import annotations

import sys
import unittest
from pathlib import Path
from unittest import mock

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

from update_progress_badge import (  # noqa: E402
    BADGE_RE,
    color_for,
    render_badge_url,
    update_readme,
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


class TestBadgeRe(unittest.TestCase):
    def test_matches_typical_readme_spelling(self):
        url = "https://img.shields.io/badge/Progress-3.50%25-orange?style=flat"
        m = BADGE_RE.search(url)
        self.assertIsNotNone(m)
        self.assertEqual(m.group(2), "3.50%25")
        self.assertEqual(m.group(4), "orange")

    def test_no_match_on_unrelated_shields_url(self):
        url = "https://img.shields.io/badge/License-MIT-blue"
        self.assertIsNone(BADGE_RE.search(url))


class TestUpdateReadme(unittest.TestCase):
    """update_readme reads README.md from disk via the module-global
    ROOT — patch the module's README to point at a tempfile and
    re-import-after-patch isn't necessary because update_readme reads
    via the closure."""

    def _readme_with(self, contents: str) -> Path:
        from update_progress_badge import README  # path-typed
        README.parent.mkdir(parents=True, exist_ok=True)
        return README

    def test_idempotent_when_already_current(self):
        # Render the current state directly and verify update_readme
        # detects "no change" via summary == None.
        with mock.patch(
            "update_progress_badge.README",
        ) as mock_path:
            mock_path.read_text.return_value = (
                "# Repo\n"
                "![Progress](https://img.shields.io/badge/"
                "Progress-3.50%25-orange)\n"
            )
            new, summary = update_readme("3.50%25", "orange")
        self.assertIsNone(summary)
        # Contents returned unchanged.
        self.assertIn("3.50%25-orange", new)

    def test_replace_changes_text_and_color(self):
        with mock.patch(
            "update_progress_badge.README",
        ) as mock_path:
            mock_path.read_text.return_value = (
                "![Progress](https://img.shields.io/badge/"
                "Progress-3.50%25-orange)\n"
            )
            new, summary = update_readme("4.00%25", "orange")
        self.assertIsNotNone(summary)
        self.assertEqual(summary, "3.50%25-orange -> 4.00%25-orange")
        self.assertIn("4.00%25-orange", new)
        self.assertNotIn("3.50%25-orange", new)

    def test_color_change_alone_triggers_update(self):
        with mock.patch(
            "update_progress_badge.README",
        ) as mock_path:
            mock_path.read_text.return_value = (
                "![Progress](https://img.shields.io/badge/"
                "Progress-25.00%25-orange)\n"
            )
            new, summary = update_readme("25.00%25", "yellow")
        self.assertIn("25.00%25-yellow", new)
        self.assertEqual(
            summary, "25.00%25-orange -> 25.00%25-yellow",
        )

    def test_no_badge_raises_systemexit(self):
        with mock.patch(
            "update_progress_badge.README",
        ) as mock_path:
            mock_path.read_text.return_value = (
                "# Repo\n_no badge here_\n"
            )
            mock_path.relative_to = (
                lambda *a, **k: Path("README.md")
            )
            with self.assertRaises(SystemExit):
                update_readme("1.00%25", "red")

    def test_multiple_badges_raises_systemexit(self):
        with mock.patch(
            "update_progress_badge.README",
        ) as mock_path:
            mock_path.read_text.return_value = (
                "[![](https://img.shields.io/badge/"
                "Progress-1.00%25-red)] "
                "[![](https://img.shields.io/badge/"
                "Progress-2.00%25-red)]"
            )
            mock_path.relative_to = (
                lambda *a, **k: Path("README.md")
            )
            with self.assertRaises(SystemExit):
                update_readme("3.00%25", "red")


if __name__ == "__main__":
    unittest.main()
