"""Unit tests for tools/generate_research_index.py.

Pins the research-note-parsing + rendering behaviour. The
`--check` mode (run via `.github/workflows/generated-files-drift.yml`)
catches drift at merge time; running the same logic here catches it
earlier. Mirrors `tests/test_generate_briefs_index.py`.
"""

from __future__ import annotations

import sys
import tempfile
import unittest
from pathlib import Path

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

from generate_research_index import (  # noqa: E402
    INDEX_PATH,
    RESEARCH_DIR,
    _truncate_balanced,
    parse_research_note,
    render_index,
)


class TestParseResearchNote(unittest.TestCase):
    def test_parses_well_formed_note(self):
        with tempfile.TemporaryDirectory() as td:
            path = Path(td) / "ov006-cluster-stuck.md"
            path.write_text(
                "# ov006-cluster-stuck\n"
                "\n"
                "**Asked:** brain noted that two ov006 clusters have sat\n"
                "at the top of the unmatched-cluster ranking.\n"
                "\n"
                "**Short answer:** the clusters are heterogeneous bags.\n",
                encoding="utf-8",
            )
            parsed = parse_research_note(path)
            self.assertIsNotNone(parsed)
            self.assertEqual(parsed["filename"], "ov006-cluster-stuck.md")
            self.assertEqual(parsed["heading"], "ov006-cluster-stuck")
            self.assertIn("brain noted", parsed["summary"])
            self.assertIn("clusters", parsed["summary"])

    def test_no_h1_returns_none(self):
        with tempfile.TemporaryDirectory() as td:
            path = Path(td) / "no-heading.md"
            path.write_text("Just body text.\n", encoding="utf-8")
            self.assertIsNone(parse_research_note(path))

    def test_skips_single_line_italic_byline(self):
        # Pattern from nitro-rename-suggestions-round2.md.
        with tempfile.TemporaryDirectory() as td:
            path = Path(td) / "round2.md"
            path.write_text(
                "# Round 2\n"
                "\n"
                "_Generated 2026-04-23 by `cloud` on brain's request._\n"
                "\n"
                "**Run provenance**: Tool: foo. Dict: bar. Real summary text.\n",
                encoding="utf-8",
            )
            parsed = parse_research_note(path)
            # Italic byline should NOT appear in the summary.
            self.assertNotIn("Generated 2026-04-23", parsed["summary"])
            self.assertIn("Run provenance", parsed["summary"])

    def test_skips_multi_line_italic_byline(self):
        # Pattern from cascade-3-dryrun.md.
        with tempfile.TemporaryDirectory() as td:
            path = Path(td) / "multi.md"
            path.write_text(
                "# Multi-line byline\n"
                "\n"
                "_Generated 2026-04-24 by cloud on brain's request after\n"
                "PR #190 landed. Preview of what brief 016's PR would\n"
                "look like._\n"
                "\n"
                "Real summary content begins here.\n",
                encoding="utf-8",
            )
            parsed = parse_research_note(path)
            self.assertNotIn("Generated 2026-04-24", parsed["summary"])
            self.assertNotIn("Preview of what", parsed["summary"])
            self.assertIn("Real summary content", parsed["summary"])

    def test_chains_paragraphs_when_first_is_label_only(self):
        # Pattern: "**Run provenance**:" alone followed by a bullet
        # list. The first prose is too short to be a useful summary;
        # the chaining heuristic should pull in the bullet content.
        with tempfile.TemporaryDirectory() as td:
            path = Path(td) / "labelled.md"
            path.write_text(
                "# Labelled\n"
                "\n"
                "**Run provenance**:\n"
                "\n"
                "- Tool: `tools/nitro_suggest_renames.py`\n"
                "- Dict: `tools/nitro_dict.py build` against ntrtwl @ abc123\n"
                "- Config: config/eur @ main 7da7f39\n"
                "\n"
                "## Headline finding\n"
                "\n"
                "(More content past the H2 — should not appear.)\n",
                encoding="utf-8",
            )
            parsed = parse_research_note(path)
            self.assertIn("Run provenance", parsed["summary"])
            # Bullet content should chain in (label-only is too short).
            self.assertIn("nitro_suggest_renames", parsed["summary"])
            # Bullet markers must be stripped.
            self.assertNotIn("- Tool", parsed["summary"])
            # H2 content must NOT appear.
            self.assertNotIn("Headline finding", parsed["summary"])
            self.assertNotIn("More content", parsed["summary"])

    def test_stops_at_h2(self):
        with tempfile.TemporaryDirectory() as td:
            path = Path(td) / "h2-cut.md"
            path.write_text(
                "# Heading\n"
                "\n"
                "First paragraph with enough content to clearly satisfy "
                "the substantive-summary threshold the parser enforces.\n"
                "\n"
                "## Next section\n"
                "\n"
                "Should NOT appear in summary.\n",
                encoding="utf-8",
            )
            parsed = parse_research_note(path)
            self.assertIn("First paragraph", parsed["summary"])
            self.assertNotIn("Next section", parsed["summary"])
            self.assertNotIn("Should NOT", parsed["summary"])

    def test_stops_after_substantive_paragraph(self):
        # If the first paragraph is already substantive (≥50 chars),
        # don't keep chaining into subsequent paragraphs.
        with tempfile.TemporaryDirectory() as td:
            path = Path(td) / "long-first.md"
            path.write_text(
                "# Long first\n"
                "\n"
                "This is a substantive first paragraph that is plenty\n"
                "long to satisfy the parser's >= 50-char threshold and\n"
                "should not chain into the second paragraph.\n"
                "\n"
                "Second paragraph that should NOT appear.\n",
                encoding="utf-8",
            )
            parsed = parse_research_note(path)
            self.assertIn("substantive first paragraph", parsed["summary"])
            self.assertNotIn("Second paragraph", parsed["summary"])

    def test_handles_status_label_pattern(self):
        # Pattern from thumb-align-wall.md / mwld-pool-word-wall.md.
        with tempfile.TemporaryDirectory() as td:
            path = Path(td) / "status.md"
            path.write_text(
                "# Status-style\n"
                "\n"
                "**Status:** research writeup, cloud-written. Brain to review.\n",
                encoding="utf-8",
            )
            parsed = parse_research_note(path)
            self.assertIn("Status", parsed["summary"])
            self.assertIn("research writeup", parsed["summary"])


class TestRenderIndex(unittest.TestCase):
    def test_table_columns_present(self):
        notes = [{
            "filename": "foo.md",
            "heading": "Foo title",
            "summary": "do the thing",
        }]
        out = render_index(notes)
        self.assertIn("# Research notes", out)
        self.assertIn("| File", out)         # table header
        self.assertIn("[`foo.md`](foo.md)", out)
        self.assertIn("Foo title", out)
        self.assertIn("do the thing", out)

    def test_pipes_in_summary_escaped_for_table(self):
        notes = [{
            "filename": "foo.md",
            "heading": "Foo",
            "summary": "alt|nat summary",
        }]
        out = render_index(notes)
        self.assertIn(r"alt\|nat summary", out)

    def test_pipes_in_heading_escaped_for_table(self):
        # A heading like "ldmia | ldmib" mid-text would otherwise
        # split the table cell.
        notes = [{
            "filename": "foo.md",
            "heading": "Heading with | bar",
            "summary": "x",
        }]
        out = render_index(notes)
        self.assertIn(r"Heading with \| bar", out)

    def test_long_summary_truncated(self):
        notes = [{
            "filename": "foo.md",
            "heading": "Foo",
            "summary": "x" * 500,
        }]
        out = render_index(notes)
        self.assertIn("...", out)
        # Find the line with the summary and check its rough length.
        summary_line = next(
            line for line in out.splitlines()
            if "foo.md" in line
        )
        self.assertLess(len(summary_line), 300)


class TestTruncateBalanced(unittest.TestCase):
    """Pin the balanced-truncation helper. Markdownlint MD038 flags
    unclosed backtick code spans inside table cells; the helper
    walks back to a balanced state to avoid the false alarm."""

    def test_short_string_passthrough(self):
        self.assertEqual(_truncate_balanced("short", 100), "short")

    def test_simple_truncation_keeps_balance(self):
        s = "no backticks here, just regular text " * 10
        out = _truncate_balanced(s, 50)
        self.assertTrue(out.endswith("..."))
        self.assertLessEqual(len(out), 50)
        # No backticks → trivially balanced.
        self.assertEqual(out.count("`"), 0)

    def test_truncation_preserves_balanced_backticks(self):
        # Cut would land mid-codespan; helper walks back to keep the
        # backticks balanced.
        s = "abc `defghij` xxxxxxxxxx `unclosed_at_cut_xxxxxxxxxxxxxx"
        out = _truncate_balanced(s, 30)
        # Must end in `...` and have an EVEN backtick count.
        self.assertTrue(out.endswith("..."))
        self.assertEqual(out.count("`") % 2, 0)

    def test_drops_trailing_open_bracket(self):
        # If truncation lands right after `[`, the helper should drop
        # the bracket so the table cell doesn't have a half-open
        # markdown link. Concretely: cut lands so the last
        # non-whitespace char is `[`.
        s = "ab cd [link-text-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
        # cut = max_chars - 3 = 7-3 = 4 → "ab c", no bracket.
        # Need cut that lands AT the `[` char.
        s = "ab [link-text-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
        # cut = max_chars - 3 = 7-3 = 4 → "ab [" → drop trailing `[`.
        out = _truncate_balanced(s, 7)
        self.assertNotIn("[...", out)
        self.assertTrue(out.endswith("..."))

    def test_brief_040_mwld_pool_word_wall_repro(self):
        # Concrete regression case: this summary triggered MD038
        # on first generation because the cut left an unclosed
        # backtick at position ~197.
        s = (
            '**Status**: research writeup, cloud-written. Brain to scope as '
            "followup to decomper's #208 finding, or close as \"won't fix, "
            "use workaround\" if the inline .c escape-hatch (direct `asm "
            "void` body) is deemed sufficient."
        )
        out = _truncate_balanced(s, 200)
        self.assertEqual(out.count("`") % 2, 0)


class TestCommittedIndexIsCurrent(unittest.TestCase):
    """Regression pin: the committed docs/research/README.md must be
    up to date. CI gate runs `--check` and fails the workflow if
    drifted; running the same logic here catches it earlier.
    """

    def test_committed_index_matches_regeneration(self):
        if not INDEX_PATH.is_file():
            self.skipTest(
                "docs/research/README.md not present — run "
                "`python tools/generate_research_index.py` first.",
            )
        notes: list[dict] = []
        for path in sorted(RESEARCH_DIR.glob("*.md")):
            if path.name == "README.md":
                continue
            parsed = parse_research_note(path)
            if parsed is None:
                continue
            notes.append(parsed)
        if not notes:
            self.skipTest("no research notes in docs/research/")
        expected = render_index(notes)
        actual = INDEX_PATH.read_text(encoding="utf-8")
        self.assertEqual(
            actual, expected,
            "docs/research/README.md is stale. Run "
            "`python tools/generate_research_index.py` and commit.",
        )


if __name__ == "__main__":
    unittest.main()
