"""Tests for tools/generate_dashboard.py.

The dashboard is committed and drift-gated exactly like docs/state-table.md
(same mechanism, mirrored on purpose per the class-0-for-3 rule on inventing a
new freshness check — see test_generate_state_table.py): `--check` must
genuinely fail on a stale file, and every number must trace back to a function
this project already trusts elsewhere, never a new metric implementation.

No hardcoded counts, SHAs, or row totals here — the committed dashboard's own
numbers will drift every round by design; these tests assert SHAPE (a table
has the right columns, a reproduce-command line is present, the branch-link
caveat exists) not cardinality.
"""
from __future__ import annotations

import subprocess
import sys
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
TOOL = ROOT / "tools" / "generate_dashboard.py"
OUT = ROOT / "docs" / "dashboard.md"

sys.path.insert(0, str(ROOT / "tools"))
import generate_dashboard as gd  # noqa: E402


def _run(*args: str) -> subprocess.CompletedProcess:
    return subprocess.run([sys.executable, str(TOOL), *args],
                          capture_output=True, text=True, cwd=ROOT)


class TestCommittedDashboardIsCurrent(unittest.TestCase):
    def test_check_passes_on_the_committed_dashboard(self):
        r = _run("--check")
        self.assertEqual(
            r.returncode, 0,
            msg="docs/dashboard.md is stale — run "
                "`python tools/generate_dashboard.py` and commit.\n" + r.stderr,
        )

    def test_check_fails_on_a_stale_dashboard(self):
        """The regression that matters: --check must actually be able to
        fail (the class of check-that-cannot-fail this project has shipped
        three times before — #1499/#1505/#1520)."""
        original = OUT.read_text(encoding="utf-8")
        try:
            OUT.write_text(original + "\nstale line\n", encoding="utf-8")
            r = _run("--check")
            self.assertEqual(r.returncode, 1)
            self.assertIn("out of date", r.stderr)
        finally:
            OUT.write_text(original, encoding="utf-8")

    def test_stdout_mode_does_not_write(self):
        before = OUT.read_text(encoding="utf-8")
        r = _run("--stdout")
        self.assertEqual(r.returncode, 0)
        self.assertIn("Project dashboard", r.stdout)
        self.assertEqual(OUT.read_text(encoding="utf-8"), before)

    def test_missing_file_is_reported_not_crashed(self):
        original = OUT.read_text(encoding="utf-8")
        try:
            OUT.unlink()
            r = _run("--check")
            self.assertEqual(r.returncode, 1)
            self.assertIn("missing", r.stderr)
        finally:
            OUT.write_text(original, encoding="utf-8")


class TestRenderShape(unittest.TestCase):
    """Assert the page has the sections/columns the spec requires, and that
    every section names its own reproducing command — never cardinality."""

    @classmethod
    def setUpClass(cls):
        cls.text = gd.render()

    def test_headline_section_present_with_reproduce_command(self):
        self.assertIn("## Headline: natural-C by region", self.text)
        self.assertIn("c_code_bytes_by_class", self.text)
        self.assertIn("| region | natural-C | natural-C % | asm-C |", self.text)

    def test_trend_section_present_with_reproduce_command(self):
        self.assertIn("## Trend: EUR natural-C over time", self.text)
        self.assertIn("git log --follow", self.text)
        self.assertIn("git show <sha>", self.text)

    def test_band_section_present_with_bl_caveat(self):
        self.assertIn("## Remaining candidate pools by size band", self.text)
        self.assertIn("wall_aware_headroom.py", self.text)
        # The honesty requirement: the size-only table must not be
        # presented as the real dispatch pool.
        self.assertIn("NOT the dispatch-ready pools", self.text)
        self.assertIn("bl", self.text)

    def test_data_readability_section_present_with_reproduce_command(self):
        self.assertIn("## Data readability (EUR)", self.text)
        self.assertIn("summarize_data_readability", self.text)
        self.assertIn("Typed-array", self.text)
        self.assertIn("Named-struct", self.text)
        self.assertIn("zero-reader data pool", self.text)

    def test_honest_ceiling_section_links_both_docs(self):
        self.assertIn("## The honest ceiling", self.text)
        self.assertIn("rnd-swarm-2026-07-24-r8.md", self.text)
        self.assertIn("post-small-pool-strategy.md", self.text)

    def test_no_ninja_or_build_invocation_anywhere_in_the_tool_source(self):
        """This item's own scope rule: no ROM build to regenerate this page."""
        source = TOOL.read_text(encoding="utf-8")
        self.assertNotIn("ninja", source.lower())
        self.assertNotIn("configure.py", source)


class TestHeadlineReusesProgressPy(unittest.TestCase):
    def test_headline_rows_match_progress_py_directly(self):
        """The dashboard must never disagree with the real metric — same
        check test_generate_state_table.py runs for its own table."""
        import progress
        cfg = ROOT / "config" / "eur"
        split = progress.c_code_bytes_by_class(cfg)
        rows = gd._headline_rows()
        eur_row = next(r for r in rows if r[0] == "eur")
        self.assertEqual(eur_row[1], split["natural-c"])


class TestTrendParsing(unittest.TestCase):
    """Pure-function tests against a synthetic state-table.md-shaped text,
    no real git history required."""

    def test_eur_row_regex_extracts_bytes_and_pct(self):
        fixture = (
            "| region | natural-C | natural-C % | asm-C | C-decompiled % |\n"
            "| --- | ---: | ---: | ---: | ---: |\n"
            "| eur | 12,345 | **6.78%** | 100 | 6.90% |\n"
            "| usa | 1 | **0.01%** | 0 | 0.01% |\n"
        )
        m = gd._EUR_ROW_RE.search(fixture)
        self.assertIsNotNone(m)
        self.assertEqual(m.group(1), "12,345")
        self.assertEqual(m.group(2), "6.78")

    def test_eur_row_regex_does_not_match_usa_row(self):
        fixture = "| usa | 1 | **0.01%** | 0 | 0.01% |\n"
        self.assertIsNone(gd._EUR_ROW_RE.search(fixture))


class TestBandTotals(unittest.TestCase):
    """Pure-logic tests of the band-bucketing arithmetic, against a fake
    scan() result — never against real repo counts (those drift every
    round by design). `_all_candidate_sizes()` calls the real (expensive)
    `scan()` exactly once; `_band_totals()` buckets its output in pure
    Python, so these two are tested separately."""

    def test_all_candidate_sizes_flattens_every_module_and_file_kind(self):
        fake_per = {
            "main": {
                "coercible_files": [{"text_size": 10}],
                "unknown_files": [{"text_size": 20}],
                "no_marker_files": [{"text_size": None}],
            },
            "ov005": {
                "coercible_files": [],
                "unknown_files": [{"text_size": 5}],
                "no_marker_files": [],
            },
        }
        import unittest.mock as mock
        with mock.patch.object(gd, "scan", return_value=fake_per) as m:
            sizes = gd._all_candidate_sizes()
        m.assert_called_once_with(None, None, True, None, None)
        self.assertEqual(sorted(sizes), [0, 5, 10, 20])

    def test_band_totals_buckets_by_inclusive_range(self):
        sizes = [10, 192, 193, 256, 257, 384, 500]
        self.assertEqual(gd._band_totals(sizes, None, 192), (2, 202))
        self.assertEqual(gd._band_totals(sizes, 193, 256), (2, 449))
        self.assertEqual(gd._band_totals(sizes, 257, 384), (2, 641))
        # An unfiltered high end (max_size=None) includes everything above lo.
        self.assertEqual(gd._band_totals(sizes, 257, None), (3, 1141))


if __name__ == "__main__":
    unittest.main()
