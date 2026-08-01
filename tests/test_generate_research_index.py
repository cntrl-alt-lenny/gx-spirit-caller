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
    collect_notes,
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
            self.assertEqual(parsed["relpath"], "ov006-cluster-stuck.md")
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
                "_Generated 2026-04-23 by `scaffolder` on brain's request._\n"
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
                "_Generated 2026-04-24 by scaffolder on brain's request after\n"
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
                "**Status:** research writeup, scaffolder-written. Brain to review.\n",
                encoding="utf-8",
            )
            parsed = parse_research_note(path)
            self.assertIn("Status", parsed["summary"])
            self.assertIn("research writeup", parsed["summary"])

    def test_relpath_falls_back_to_bare_name_outside_research_dir(self):
        # All the tests above use an isolated tempdir, not a path under
        # RESEARCH_DIR -- relpath must fall back to the bare filename
        # rather than raising, so this function stays usable standalone.
        with tempfile.TemporaryDirectory() as td:
            path = Path(td) / "outside.md"
            path.write_text("# Outside\n\nSome real summary content here.\n",
                             encoding="utf-8")
            parsed = parse_research_note(path)
            self.assertEqual(parsed["relpath"], "outside.md")

    def test_relpath_is_relative_to_research_dir_for_a_real_subdir_file(self):
        # A file genuinely under RESEARCH_DIR, nested one level --
        # relpath must be the subdir-qualified path, not the bare name,
        # since that's what the index needs to link to correctly.
        subdir = RESEARCH_DIR / "_test_scratch_subdir"
        subdir.mkdir(exist_ok=True)
        path = subdir / "nested.md"
        try:
            path.write_text("# Nested\n\nSome real summary content here.\n",
                             encoding="utf-8")
            parsed = parse_research_note(path)
            self.assertEqual(parsed["relpath"], "_test_scratch_subdir/nested.md")
        finally:
            path.unlink()
            subdir.rmdir()


class TestRenderIndex(unittest.TestCase):
    def test_table_columns_present(self):
        notes = [{
            "relpath": "foo.md",
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
            "relpath": "foo.md",
            "heading": "Foo",
            "summary": "alt|nat summary",
        }]
        out = render_index(notes)
        self.assertIn(r"alt\|nat summary", out)

    def test_pipes_in_heading_escaped_for_table(self):
        # A heading like "ldmia | ldmib" mid-text would otherwise
        # split the table cell.
        notes = [{
            "relpath": "foo.md",
            "heading": "Heading with | bar",
            "summary": "x",
        }]
        out = render_index(notes)
        self.assertIn(r"Heading with \| bar", out)

    def test_long_summary_truncated(self):
        notes = [{
            "relpath": "foo.md",
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
            '**Status**: research writeup, scaffolder-written. Brain to scope as '
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
            self.fail(
                "docs/research/README.md is missing — run "
                "`python tools/generate_research_index.py` and commit.",
            )
        notes = collect_notes()
        if not notes:
            self.fail(
                "no research notes in docs/research/ — generated index "
                "cannot be validated",
            )
        expected = render_index(notes)
        actual = INDEX_PATH.read_text(encoding="utf-8")
        self.assertEqual(
            actual, expected,
            "docs/research/README.md is stale. Run "
            "`python tools/generate_research_index.py` and commit.",
        )


class TestCollectNotesRecursion(unittest.TestCase):
    """Regression tests for the recursive-glob fix: 15+ real notes
    already live under docs/research/<subdir>/*.md (e.g. wave 3's own
    cm-data-inference-3-2026-07-25.md), silently un-indexed by the old
    non-recursive `glob("*.md")`. These exercise the real RESEARCH_DIR,
    not a temp dir, since the bug was specifically about directory
    structure `collect_notes()` must actually walk."""

    def test_finds_a_real_subdirectory_note(self):
        notes = collect_notes()
        relpaths = {n["relpath"] for n in notes}
        subdir_notes = [r for r in relpaths if "/" in r]
        self.assertGreater(
            len(subdir_notes), 0,
            "collect_notes() found zero notes in any subdirectory of "
            "docs/research/ -- the recursive glob regressed back to "
            "top-level-only.",
        )

    def test_every_indexed_relpath_actually_resolves(self):
        # The bug this whole fix started from: a bare filename used as
        # the link href is wrong for anything not directly in
        # RESEARCH_DIR. Confirm every relpath collect_notes() emits is
        # a real, resolvable path under RESEARCH_DIR.
        notes = collect_notes()
        for n in notes:
            resolved = RESEARCH_DIR / n["relpath"]
            self.assertTrue(
                resolved.is_file(),
                f"relpath {n['relpath']!r} does not resolve to a real file",
            )

    def test_index_md_excluded_at_every_depth(self):
        # docs/research/data/INDEX.md and 8 siblings are separately-
        # maintained navigational catalogs ("Do NOT regenerate -- the
        # brain handles the index at merge"), never research notes.
        notes = collect_notes()
        relpaths = {n["relpath"] for n in notes}
        index_md_entries = [r for r in relpaths if r.endswith("INDEX.md")]
        self.assertEqual(
            index_md_entries, [],
            f"INDEX.md file(s) leaked into the note index: {index_md_entries}",
        )

    def test_readme_excluded_at_every_depth(self):
        # docs/research/archive/README.md, not just the top-level one.
        notes = collect_notes()
        relpaths = {n["relpath"] for n in notes}
        readme_entries = [r for r in relpaths if r.endswith("README.md")]
        self.assertEqual(
            readme_entries, [],
            f"README.md file(s) leaked into the note index: {readme_entries}",
        )

    def test_same_basename_different_directories_both_indexed_distinctly(self):
        # docs/research/campaign-analytics/path-to-100-coverage.md (a
        # superseded-note stub) and docs/research/archive/
        # path-to-100-coverage.md (its archived copy) share a basename.
        # Both must appear, each linked to ITS OWN full relative path --
        # a bare-filename link would either 404 for one of them or,
        # worse, silently point both rows at the same wrong target.
        notes = collect_notes()
        relpaths = {n["relpath"] for n in notes}
        self.assertIn("campaign-analytics/path-to-100-coverage.md", relpaths)
        self.assertIn("archive/path-to-100-coverage.md", relpaths)

    def test_sort_order_is_platform_independent_plain_string_sort(self):
        # Real regression, caught by CI (not local testing -- Windows'
        # WindowsPath.__lt__ sorts case-INsensitively; PosixPath, what
        # every CI runner uses, sorts case-SENSITIVELY). Sorting raw
        # Path objects straight out of rglob() -- rather than the
        # parsed notes' relpath strings -- produced a genuinely
        # different order on Windows than on Linux once enough mixed-
        # case directory names existed for it to matter, and --check
        # (byte-for-byte) correctly flagged that as drift. Pin: the
        # notes list must already be in the same order a plain `str`
        # sort of the relpaths would produce, on ANY platform.
        notes = collect_notes()
        relpaths = [n["relpath"] for n in notes]
        self.assertEqual(relpaths, sorted(relpaths))


if __name__ == "__main__":
    unittest.main()
