"""Unit tests for tools/generate_briefs_index.py.

Pins the brief-parsing + rendering behaviour. The `--check` mode (run
via `.github/workflows/generated-files-drift.yml`) catches drift at
merge time; running the same logic here catches it earlier.
"""

from __future__ import annotations

import sys
import tempfile
import unittest
from pathlib import Path

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

from generate_briefs_index import (  # noqa: E402
    BRIEFS_DIR,
    INDEX_PATH,
    _truncate_balanced,
    parse_brief,
    render_index,
)


class TestParseBrief(unittest.TestCase):
    def test_parses_well_formed_brief(self):
        with tempfile.TemporaryDirectory() as td:
            path = Path(td) / "001-foo-feature.md"
            path.write_text(
                "### branch/foo-feature\n"
                "\n"
                "**Goal:** ship the foo feature, the way.\n"
                "\n"
                "Some other text.\n",
                encoding="utf-8",
            )
            parsed = parse_brief(path)
            self.assertIsNotNone(parsed)
            self.assertEqual(parsed["number"], "001")
            self.assertEqual(parsed["slug"], "foo-feature")
            self.assertEqual(parsed["heading"], "branch/foo-feature")
            self.assertIn("ship the foo feature", parsed["goal"])

    def test_filename_doesnt_match_returns_none(self):
        with tempfile.TemporaryDirectory() as td:
            path = Path(td) / "not-a-brief.md"
            path.write_text("### whatever\n\n**Goal:** x", encoding="utf-8")
            self.assertIsNone(parse_brief(path))

    def test_multi_line_goal_joined(self):
        with tempfile.TemporaryDirectory() as td:
            path = Path(td) / "002-multi.md"
            path.write_text(
                "### branch/multi\n"
                "\n"
                "**Goal:** first line\n"
                "second line\n"
                "third line\n"
                "\n"
                "Body paragraph.\n",
                encoding="utf-8",
            )
            parsed = parse_brief(path)
            self.assertEqual(
                parsed["goal"], "first line second line third line",
            )

    def test_missing_goal_yields_empty(self):
        with tempfile.TemporaryDirectory() as td:
            path = Path(td) / "003-no-goal.md"
            path.write_text(
                "### branch/no-goal\n\nSome random body.\n",
                encoding="utf-8",
            )
            parsed = parse_brief(path)
            self.assertEqual(parsed["goal"], "")


class TestRenderIndex(unittest.TestCase):
    def test_table_columns_present(self):
        briefs = [{
            "number": "001",
            "slug": "foo",
            "heading": "branch/foo",
            "goal": "do the thing",
            "filename": "001-foo.md",
        }]
        out = render_index(briefs)
        self.assertIn("# Decomp Briefs", out)
        self.assertIn("| #", out)         # table header
        self.assertIn("| 001 |", out)
        self.assertIn("[`branch/foo`](001-foo.md)", out)
        self.assertIn("do the thing", out)

    def test_pipes_in_goal_escaped_for_table(self):
        briefs = [{
            "number": "001",
            "slug": "foo",
            "heading": "branch/foo",
            "goal": "alt|nat goal",
            "filename": "001-foo.md",
        }]
        out = render_index(briefs)
        # Bare pipes would split the cell; require the literal
        # backslash-pipe escape.
        self.assertIn(r"alt\|nat goal", out)

    def test_long_goal_truncated(self):
        briefs = [{
            "number": "001",
            "slug": "foo",
            "heading": "branch/foo",
            "goal": "x" * 500,
            "filename": "001-foo.md",
        }]
        out = render_index(briefs)
        self.assertIn("...", out)
        # Should be capped near 200 chars.
        # Find the line with the goal and check its rough length.
        goal_line = next(
            line for line in out.splitlines()
            if "001-foo.md" in line
        )
        self.assertLess(len(goal_line), 300)


class TestTruncateBalanced(unittest.TestCase):
    """Pin the balanced-truncation helper. Markdownlint MD038 flags
    unclosed backtick code spans inside table cells; the helper walks
    back to a balanced state to avoid the false alarm. Mirror of the
    research-index helper's tests in
    `tests/test_generate_research_index.py` — kept in sync by
    convention."""

    def test_short_string_passthrough(self):
        self.assertEqual(_truncate_balanced("short", 100), "short")

    def test_simple_truncation_keeps_balance(self):
        s = "no backticks here, just regular text " * 10
        out = _truncate_balanced(s, 50)
        self.assertTrue(out.endswith("..."))
        self.assertLessEqual(len(out), 50)
        self.assertEqual(out.count("`"), 0)

    def test_truncation_preserves_balanced_backticks(self):
        # Cut would land mid-codespan; helper walks back to keep the
        # backticks balanced.
        s = "abc `defghij` xxxxxxxxxx `unclosed_at_cut_xxxxxxxxxxxxxx"
        out = _truncate_balanced(s, 30)
        self.assertTrue(out.endswith("..."))
        self.assertEqual(out.count("`") % 2, 0)

    def test_drops_trailing_open_bracket(self):
        s = "ab [link-text-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
        out = _truncate_balanced(s, 7)
        self.assertNotIn("[...", out)
        self.assertTrue(out.endswith("..."))

    def test_brief_017_unbalanced_backtick_repro(self):
        # Concrete regression case from docs/briefs/017-cluster-prop-
        # 020085d4.md's goal — pre-fix output truncated to
        # "... `propagate_template`'s missing `--substitute..."
        # leaving 5 backticks (unclosed code span). Helper walks back
        # past the dangling backtick.
        s = (
            "Round 3 of the cluster-propagation pilot. Pick the cluster "
            "the decomper's brief 016 PR explicitly recommended: an "
            "**offset-0, no-literal anchor**, where `propagate_template`'s "
            "missing `--substitute-name flag forced the wave to fall back "
            "to manual cloning."
        )
        out = _truncate_balanced(s, 200)
        self.assertEqual(out.count("`") % 2, 0)


class TestCommittedIndexIsCurrent(unittest.TestCase):
    """Regression pin: the committed docs/briefs/README.md must be
    up to date. CI gate runs `--check` and fails the workflow if
    drifted; running the same logic here catches it earlier."""

    def test_committed_index_matches_regeneration(self):
        if not INDEX_PATH.is_file():
            self.skipTest(
                "docs/briefs/README.md not present — run "
                "`python tools/generate_briefs_index.py` first.",
            )
        # Mirror the main() collection logic.
        briefs: list[dict] = []
        for path in sorted(BRIEFS_DIR.glob("*.md")):
            if path.name == "README.md":
                continue
            parsed = parse_brief(path)
            if parsed is None:
                continue
            briefs.append(parsed)
        if not briefs:
            self.skipTest("no briefs in docs/briefs/")
        expected = render_index(briefs)
        actual = INDEX_PATH.read_text(encoding="utf-8")
        self.assertEqual(
            actual, expected,
            "docs/briefs/README.md is stale. Run "
            "`python tools/generate_briefs_index.py` and commit.",
        )


if __name__ == "__main__":
    unittest.main()
