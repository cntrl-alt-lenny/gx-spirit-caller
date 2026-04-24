"""Unit tests for tools/generate_tool_index.py.

Pins the extraction + rendering behaviour. The `--check` mode
doubles as a pre-commit hook / CI gate to catch stale indexes
before they land.
"""

from __future__ import annotations

import sys
import unittest
from pathlib import Path

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

from generate_tool_index import (  # noqa: E402
    CATEGORY_ORDER,
    Tool,
    _category_for,
    _split_title_summary,
    render,
    scan_tools,
)


class TestCategoryFor(unittest.TestCase):
    def test_ci_format_prefix(self):
        self.assertEqual(_category_for("ci_format_diff"), "ci-formatters")
        self.assertEqual(
            _category_for("ci_format_rename_cascades"), "ci-formatters",
        )

    def test_nitro_prefix(self):
        self.assertEqual(
            _category_for("nitro_suggest_renames"), "rename-support",
        )
        self.assertEqual(_category_for("nitro_dict"), "rename-support")

    def test_find_prefix(self):
        self.assertEqual(_category_for("find_cascades"), "analysis")
        self.assertEqual(_category_for("find_callsites"), "analysis")

    def test_exact_stem_beats_prefix(self):
        # `rename_symbol` matches exact-stem in CATEGORIES. Without
        # the exact-match branch, it would fall to the generic
        # rename-support prefix anyway, but pin the intent.
        self.assertEqual(_category_for("rename_symbol"), "rename-support")

    def test_unknown_stem_falls_back(self):
        self.assertEqual(_category_for("totally_novel_tool"),
                         "uncategorised")


class TestSplitTitleSummary(unittest.TestCase):
    def test_clean_docstring(self):
        ds = "find_cascades.py — predict tier promotions from renames.\n\nSome longer paragraph of summary."
        title, summary = _split_title_summary(ds)
        self.assertEqual(title, "predict tier promotions from renames.")
        self.assertIn("longer paragraph", summary)

    def test_strips_filename_prefix(self):
        # Multiple separators supported (—, -, –).
        for sep in (" — ", " - ", " – "):
            ds = f"foo.py{sep}the real title.\n"
            title, _ = _split_title_summary(ds)
            self.assertEqual(title, "the real title.")

    def test_no_separator_preserves_full_line(self):
        ds = "standalone title line\n"
        title, _ = _split_title_summary(ds)
        self.assertEqual(title, "standalone title line")

    def test_summary_trimmed_at_paragraph_break(self):
        ds = (
            "tool.py — first line.\n"
            "\n"
            "Paragraph one continues.\n"
            "And this line is part of the same paragraph.\n"
            "\n"
            "Second paragraph should be cut.\n"
        )
        title, summary = _split_title_summary(ds)
        self.assertEqual(title, "first line.")
        self.assertIn("Paragraph one continues", summary)
        self.assertIn("same paragraph", summary)
        self.assertNotIn("Second paragraph", summary)

    def test_long_summary_truncated(self):
        ds = "tool.py — title.\n\n" + ("x" * 500)
        _, summary = _split_title_summary(ds)
        # Trim to ≤240 chars ending in ellipsis.
        self.assertLessEqual(len(summary), 240)
        self.assertTrue(summary.endswith("…"))

    def test_empty_docstring(self):
        title, summary = _split_title_summary(None)
        self.assertEqual(title, "(no docstring)")
        self.assertEqual(summary, "")

        title, summary = _split_title_summary("")
        self.assertEqual(title, "(no docstring)")


class TestScanAndRender(unittest.TestCase):
    def test_scans_real_tools_dir_nonempty(self):
        # Smoke: the real tools/ has ≥30 .py files with docstrings.
        tools = scan_tools(_TOOLS)
        self.assertGreater(len(tools), 30)
        # Every tool has a non-empty title.
        for t in tools:
            self.assertTrue(
                t.title,
                f"{t.name} has empty title",
            )

    def test_render_groups_by_category(self):
        tools = [
            Tool(name="a", path=Path("a"), title="T1",
                 summary="s1", category="analysis"),
            Tool(name="b", path=Path("b"), title="T2",
                 summary="s2", category="ci-formatters"),
        ]
        out = render(tools)
        self.assertIn("## Analysis / worklist", out)
        self.assertIn("## CI formatters", out)
        # Category order follows CATEGORY_ORDER.
        self.assertLess(
            out.find("Analysis / worklist"),
            out.find("CI formatters"),
        )

    def test_render_contains_tool_title_and_summary(self):
        tools = [Tool(
            name="demo", path=Path("demo"),
            title="short title",
            summary="full paragraph summary",
            category="analysis",
        )]
        out = render(tools)
        self.assertIn("`tools/demo.py`", out)
        self.assertIn("short title", out)
        self.assertIn("full paragraph summary", out)

    def test_empty_categories_hidden(self):
        tools = [Tool(
            name="a", path=Path("a"), title="T",
            summary="s", category="analysis",
        )]
        out = render(tools)
        # Other categories aren't emitted at all if empty.
        self.assertNotIn("## CI formatters", out)
        self.assertNotIn("## Uncategorised", out)


class TestGeneratedIndexIsCurrent(unittest.TestCase):
    """Regression pin: the committed docs/tools-index.md must be
    up to date. If a tool's docstring changes, the CI gate (run
    via `python tools/generate_tool_index.py --check`) catches it
    at merge time. Running the same logic here catches it earlier."""

    def test_committed_index_matches_regeneration(self):
        committed_path = Path(__file__).resolve().parent.parent / "docs" / "tools-index.md"
        if not committed_path.is_file():
            self.skipTest(
                "docs/tools-index.md not present — run "
                "`python tools/generate_tool_index.py` first.",
            )
        tools = scan_tools(_TOOLS)
        expected = render(tools)
        actual = committed_path.read_text(encoding="utf-8")
        self.assertEqual(
            actual, expected,
            "docs/tools-index.md is stale. Run "
            "`python tools/generate_tool_index.py` and commit.",
        )


class TestCategoryOrderSanity(unittest.TestCase):
    def test_uncategorised_is_last(self):
        # Rendering the "unknown" bucket at the bottom keeps the
        # index readable — new tools surface in their natural
        # category, rejects fall to the end.
        self.assertEqual(CATEGORY_ORDER[-1], "uncategorised")


if __name__ == "__main__":
    unittest.main()
