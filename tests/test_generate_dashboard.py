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


def _is_shallow() -> bool:
    """True when the checkout has no real history (CI uses depth 1)."""
    r = subprocess.run(["git", "rev-parse", "--is-shallow-repository"],
                       capture_output=True, text=True, cwd=ROOT)
    return r.stdout.strip() == "true"


class TestCommittedDashboardIsCurrent(unittest.TestCase):
    def test_check_passes_on_the_committed_dashboard(self):
        # The dashboard's trend section is derived from `git log --follow` over
        # docs/state-table.md, so regenerating it in a SHALLOW clone produces a
        # different (historyless) document and --check fails for a reason that
        # has nothing to do with staleness. CI checks out at depth 1
        # (actions/checkout@v4, no fetch-depth). Skip rather than assert against
        # history the checkout does not have -- the same choice
        # tests/test_kickoff_lint.py already makes for its history fixture.
        # (Brain fix at merge, round 0824: green locally, red in CI.)
        if _is_shallow():
            self.skipTest("shallow clone: dashboard trend needs real git history")
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

    def test_module_census_separates_permanent_and_unassessed(self):
        self.assertIn("### Remaining unmatched `.text` by module", self.text)
        self.assertIn("| module | permanent count | permanent bytes |", self.text)
        self.assertIn("unassessed count", self.text)
        self.assertIn("--json --exclude-attempted", self.text)

    def test_data_readability_section_present_with_reproduce_command(self):
        self.assertIn("## Data readability (EUR)", self.text)
        self.assertIn("summarize_data_readability", self.text)
        self.assertIn("Typed-array", self.text)
        self.assertIn("Named-struct", self.text)
        self.assertIn("zero-reader data pool", self.text)

    def test_data_opportunity_section_is_explicit_about_unknown_split(self):
        self.assertIn("### Data opportunity disposition", self.text)
        self.assertIn("data_worklist.py --version eur --include-data-readers", self.text)
        self.assertIn("proven recipe currently shippable", self.text)
        self.assertIn("blank", self.text)

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


class TestDashboardIsCurrent(unittest.TestCase):
    """q-derived-artifact-selfreference: `--check` must tolerate ONLY a
    squash-merge-rewritten SHA on the trend table's trailing row, and
    nothing else -- these are the pure-function tests; see
    TestCheckToleratesSquashMergedTrailingSha below for the real
    subprocess-level regression demonstrating the actual failure mode."""

    HEADER = (
        "## Trend: EUR natural-C over time\n\n"
        "| commit | date | EUR natural-C | EUR natural-C % | Δ bytes |\n"
        "| --- | --- | ---: | ---: | ---: |\n"
    )

    def _doc(self, rows: list[str]) -> str:
        return "prefix section\n\n" + self.HEADER + "".join(rows) + "\nsuffix section\n"

    def test_exact_match_is_current(self):
        doc = self._doc(["| `abc123456` | 2026-08-01 | 100 | 1.00% |  |\n"])
        ok, detail = gd._dashboard_is_current(doc, doc)
        self.assertTrue(ok)
        self.assertEqual(detail, "exact match")

    def test_trailing_row_sha_only_difference_is_current(self):
        committed = self._doc([
            "| `aaa000000` | 2026-08-01 | 100 | 1.00% |  |\n",
            "| `bbb111111` | 2026-08-02 | 200 | 2.00% | +100 |\n",
        ])
        fresh = self._doc([
            "| `aaa000000` | 2026-08-01 | 100 | 1.00% |  |\n",
            "| `ccc222222` | 2026-08-02 | 200 | 2.00% | +100 |\n",
        ])
        ok, detail = gd._dashboard_is_current(committed, fresh)
        self.assertTrue(ok)
        self.assertIn("bbb111111", detail)
        self.assertIn("ccc222222", detail)

    def test_trailing_row_content_difference_is_stale(self):
        """The real staleness case: the trailing row's BYTES moved, not
        just its SHA -- must still fail, squash-merge tolerance or not."""
        committed = self._doc(["| `aaa000000` | 2026-08-01 | 100 | 1.00% |  |\n"])
        fresh = self._doc(["| `bbb111111` | 2026-08-01 | 999 | 9.00% |  |\n"])
        ok, detail = gd._dashboard_is_current(committed, fresh)
        self.assertFalse(ok)

    def test_non_trailing_row_sha_difference_is_stale(self):
        """Already-merged history must never legitimately drift -- only
        the LAST row gets the tolerance."""
        committed = self._doc([
            "| `aaa000000` | 2026-08-01 | 100 | 1.00% |  |\n",
            "| `bbb111111` | 2026-08-02 | 200 | 2.00% | +100 |\n",
        ])
        fresh = self._doc([
            "| `zzz999999` | 2026-08-01 | 100 | 1.00% |  |\n",
            "| `bbb111111` | 2026-08-02 | 200 | 2.00% | +100 |\n",
        ])
        ok, detail = gd._dashboard_is_current(committed, fresh)
        self.assertFalse(ok)

    def test_two_differences_including_trailing_sha_is_stale(self):
        """A legitimate trailing-SHA drift must not mask an UNRELATED real
        staleness elsewhere in the document."""
        committed = (
            "prefix section OLD\n\n" + self.HEADER
            + "| `aaa000000` | 2026-08-01 | 100 | 1.00% |  |\n"
            + "\nsuffix section\n"
        )
        fresh = (
            "prefix section NEW\n\n" + self.HEADER
            + "| `bbb111111` | 2026-08-01 | 100 | 1.00% |  |\n"
            + "\nsuffix section\n"
        )
        ok, detail = gd._dashboard_is_current(committed, fresh)
        self.assertFalse(ok)
        self.assertIn("2 line(s)", detail)

    def test_no_trend_rows_falls_back_to_stale_on_any_difference(self):
        committed = "prefix section\n\nno trend table here\n"
        fresh = "prefix section\n\nno trend table here, different\n"
        ok, detail = gd._dashboard_is_current(committed, fresh)
        self.assertFalse(ok)

    def test_middle_row_sha_change_disguised_as_trailing_is_stale(self):
        """If the fresh render's row COUNT differs (e.g. a new row was
        added since the committed file was generated), the differing line
        cannot be validated as "the trailing row" and must fail."""
        committed = self._doc([
            "| `aaa000000` | 2026-08-01 | 100 | 1.00% |  |\n",
        ])
        fresh = self._doc([
            "| `aaa000000` | 2026-08-01 | 100 | 1.00% |  |\n",
            "| `bbb111111` | 2026-08-02 | 200 | 2.00% | +100 |\n",
        ])
        ok, detail = gd._dashboard_is_current(committed, fresh)
        self.assertFalse(ok)


class TestDashboardIsCurrentRowAddition(unittest.TestCase):
    """q-wall-overblock-audit: `--check` must ALSO tolerate one new
    trend-table row appended at the end (plus its required point-count
    bump) -- the self-reference's OTHER form, first hit when the round
    0831 brain PR landed a genuine new commit on docs/state-table.md
    after this file had already been generated. PR #1593's tolerance only
    covered a same-line-count SHA rewrite (TestDashboardIsCurrent above);
    it fails closed on this case with "stale (line count differs)",
    exactly the failure this class demonstrates is now fixed -- while the
    negative tests below prove the fix does NOT accept anything broader
    than exactly one clean trailing addition."""

    HEADER = (
        "## Trend: EUR natural-C over time\n\n"
        "| commit | date | EUR natural-C | EUR natural-C % | Δ bytes |\n"
        "| --- | --- | ---: | ---: | ---: |\n"
    )
    POINTS = "{n} points, one per commit that changed `docs/state-table.md` (oldest first)."

    def _doc(self, rows: list[str], n_points: int) -> str:
        return (
            "prefix section\n\n" + self.HEADER + "".join(rows)
            + "\n" + self.POINTS.format(n=n_points) + "\n"
            + "\nsuffix section\n"
        )

    def test_one_new_trailing_row_with_points_bump_is_current(self):
        committed = self._doc([
            "| `aaa000000` | 2026-08-01 | 100 | 1.00% |  |\n",
            "| `bbb111111` | 2026-08-02 | 200 | 2.00% | +100 |\n",
        ], n_points=2)
        fresh = self._doc([
            "| `aaa000000` | 2026-08-01 | 100 | 1.00% |  |\n",
            "| `bbb111111` | 2026-08-02 | 200 | 2.00% | +100 |\n",
            "| `ccc222222` | 2026-08-03 | 250 | 2.50% | +50 |\n",
        ], n_points=3)
        ok, detail = gd._dashboard_is_current(committed, fresh)
        self.assertTrue(ok, detail)
        self.assertIn("ccc222222", detail)

    def test_new_row_without_points_bump_is_stale(self):
        """The row was added but the summary count wasn't -- a real,
        partial regen that must not be waved through."""
        committed = self._doc(
            ["| `aaa000000` | 2026-08-01 | 100 | 1.00% |  |\n"], n_points=1,
        )
        fresh = self._doc([
            "| `aaa000000` | 2026-08-01 | 100 | 1.00% |  |\n",
            "| `bbb111111` | 2026-08-02 | 200 | 2.00% | +100 |\n",
        ], n_points=1)  # still says 1 -- not bumped
        ok, detail = gd._dashboard_is_current(committed, fresh)
        self.assertFalse(ok)

    def test_points_bump_without_new_row_is_stale(self):
        """The inverse partial-regen: count text changed but no row was
        actually added -- must not be tolerated either."""
        committed = self._doc(
            ["| `aaa000000` | 2026-08-01 | 100 | 1.00% |  |\n"], n_points=1,
        )
        fresh = self._doc(
            ["| `aaa000000` | 2026-08-01 | 100 | 1.00% |  |\n"], n_points=2,
        )
        # Same line count as committed -- goes through the SHA-rewrite path,
        # which must also reject it (no trend-row difference to tolerate).
        ok, detail = gd._dashboard_is_current(committed, fresh)
        self.assertFalse(ok)

    def test_two_new_trailing_rows_is_stale(self):
        """Only ONE new row is tolerable per check -- two real, unreviewed
        commits landing between generations must still fail closed."""
        committed = self._doc(
            ["| `aaa000000` | 2026-08-01 | 100 | 1.00% |  |\n"], n_points=1,
        )
        fresh = self._doc([
            "| `aaa000000` | 2026-08-01 | 100 | 1.00% |  |\n",
            "| `bbb111111` | 2026-08-02 | 200 | 2.00% | +100 |\n",
            "| `ccc222222` | 2026-08-03 | 250 | 2.50% | +50 |\n",
        ], n_points=3)
        ok, detail = gd._dashboard_is_current(committed, fresh)
        self.assertFalse(ok)

    def test_new_row_plus_unrelated_change_elsewhere_is_stale(self):
        """A legitimate trailing addition must not mask an unrelated real
        edit elsewhere in the document -- mirrors
        test_two_differences_including_trailing_sha_is_stale above."""
        committed = (
            "prefix section OLD\n\n" + self.HEADER
            + "| `aaa000000` | 2026-08-01 | 100 | 1.00% |  |\n"
            + "\n" + self.POINTS.format(n=1) + "\n\nsuffix section\n"
        )
        fresh = (
            "prefix section NEW\n\n" + self.HEADER
            + "| `aaa000000` | 2026-08-01 | 100 | 1.00% |  |\n"
            + "| `bbb111111` | 2026-08-02 | 200 | 2.00% | +100 |\n"
            + "\n" + self.POINTS.format(n=2) + "\n\nsuffix section\n"
        )
        ok, detail = gd._dashboard_is_current(committed, fresh)
        self.assertFalse(ok)

    def test_new_row_inserted_mid_history_not_at_trailing_position_is_stale(self):
        """A row that shows up BETWEEN two existing rows (not appended at
        the table's true end) must fail -- history must never reorder."""
        committed = self._doc([
            "| `aaa000000` | 2026-08-01 | 100 | 1.00% |  |\n",
            "| `ccc333333` | 2026-08-03 | 300 | 3.00% | +100 |\n",
        ], n_points=2)
        fresh = self._doc([
            "| `aaa000000` | 2026-08-01 | 100 | 1.00% |  |\n",
            "| `bbb111111` | 2026-08-02 | 200 | 2.00% | +100 |\n",  # inserted mid-history
            "| `ccc333333` | 2026-08-03 | 300 | 3.00% | +100 |\n",
        ], n_points=3)
        ok, detail = gd._dashboard_is_current(committed, fresh)
        self.assertFalse(ok)

    def test_historical_row_changed_alongside_a_valid_looking_addition_is_stale(self):
        """A changed historical row must not be laundered through by also
        appending a legitimate-looking new trailing row + points bump."""
        committed = self._doc([
            "| `aaa000000` | 2026-08-01 | 100 | 1.00% |  |\n",
        ], n_points=1)
        fresh = self._doc([
            "| `zzz999999` | 2026-08-01 | 100 | 1.00% |  |\n",  # SHA moved, not trailing
            "| `bbb111111` | 2026-08-02 | 200 | 2.00% | +100 |\n",
        ], n_points=2)
        ok, detail = gd._dashboard_is_current(committed, fresh)
        self.assertFalse(ok)


class TestCheckToleratesSquashMergedTrailingSha(unittest.TestCase):
    """The real regression: reproduce the actual failure mode against the
    REAL committed docs/dashboard.md via the real --check subprocess (not
    just the pure helper), by simulating exactly what a squash-merge does
    -- rewrite the trailing trend row's SHA to something the committed
    file could not have predicted -- and showing `--check` now passes."""

    def test_check_passes_when_trailing_sha_is_squash_rewritten(self):
        if _is_shallow():
            self.skipTest("shallow clone: dashboard trend needs real git history")
        original = OUT.read_text(encoding="utf-8")
        try:
            m = gd._TREND_ROW_RE.search(original)
            if m is None:
                self.skipTest("no trend rows in the committed dashboard to mutate")
            # Simulate a squash-merge: replace ONLY the trailing row's SHA
            # (found by locating the LAST match) with a fake-but-well-formed
            # different one -- exactly what happens when GitHub squash-merges
            # the PR that introduced this exact row.
            all_matches = list(gd._TREND_ROW_RE.finditer(original))
            last = all_matches[-1]
            real_sha = last.group(1)
            fake_sha = ("f" if real_sha[0] != "f" else "e") + real_sha[1:]
            self.assertNotEqual(real_sha, fake_sha)
            mutated = (
                original[:last.start(1)] + fake_sha + original[last.end(1):]
            )
            OUT.write_text(mutated, encoding="utf-8")

            r = _run("--check")
            self.assertEqual(
                r.returncode, 0,
                msg="a trailing-row-only SHA rewrite (the exact effect of a "
                    "squash merge) must not be reported as staleness\n"
                    + r.stdout + r.stderr,
            )
            self.assertIn("current", r.stdout)
        finally:
            OUT.write_text(original, encoding="utf-8")


class TestCheckToleratesTrailingRowAddition(unittest.TestCase):
    """The real regression this round fixes: reproduce the actual round-
    0831 failure mode against the REAL committed docs/dashboard.md via the
    real --check subprocess. `--check` compares the ON-DISK committed file
    against a FRESH render computed from the real (unmutated) git history
    -- so to simulate "a genuine new commit landed since this file was
    last generated" we must make the ON-DISK file fall BEHIND, by deleting
    its own real trailing row(s) and un-crediting the point count, not by
    inventing fake future rows the fresh render could never independently
    reproduce. This exactly mirrors how TestCheckToleratesSquashMergedTrailingSha
    above simulates its case by mutating the on-disk SHA, not the git log.
    A second test proves the fix wasn't achieved by gutting the check:
    falling behind by two rows still fails."""

    def _mutate_by_removing_trailing_rows(self, original: str, n_remove: int) -> str:
        matches = list(gd._TREND_ROW_RE.finditer(original))
        self.assertGreaterEqual(len(matches), n_remove + 1,
                                 "not enough real trend rows in the committed "
                                 "dashboard to simulate falling behind by "
                                 f"{n_remove}")
        to_remove = matches[-n_remove:]
        mutated = original
        # Remove from the end backwards so earlier spans stay valid as the
        # string shrinks.
        for m in reversed(to_remove):
            line_start = mutated.rfind("\n", 0, m.start()) + 1
            line_end = mutated.index("\n", m.end()) + 1  # consume the row's own \n
            mutated = mutated[:line_start] + mutated[line_end:]
        points_m = gd._POINTS_LINE_RE.search(mutated)
        self.assertIsNotNone(points_m, "points-count line missing after mutation")
        old_n = int(points_m.group(1))
        mutated = (
            mutated[:points_m.start(1)] + str(old_n - n_remove)
            + mutated[points_m.end(1):]
        )
        return mutated

    def test_check_passes_when_committed_is_missing_one_trailing_row(self):
        if _is_shallow():
            self.skipTest("shallow clone: dashboard trend needs real git history")
        original = OUT.read_text(encoding="utf-8")
        try:
            if gd._TREND_ROW_RE.search(original) is None:
                self.skipTest("no trend rows in the committed dashboard to mutate")
            mutated = self._mutate_by_removing_trailing_rows(original, n_remove=1)
            self.assertNotEqual(original, mutated)
            OUT.write_text(mutated, encoding="utf-8")

            r = _run("--check")
            self.assertEqual(
                r.returncode, 0,
                msg="a committed file missing exactly its real trailing "
                    "trend row (plus the matching point-count credit) -- "
                    "exactly what a genuine new commit to "
                    "docs/state-table.md produces between generations -- "
                    "must not be reported as staleness\n" + r.stdout + r.stderr,
            )
            self.assertIn("current", r.stdout)
        finally:
            OUT.write_text(original, encoding="utf-8")

    def test_check_still_fails_when_committed_is_missing_two_trailing_rows(self):
        """Proves the fix is narrowly scoped, not a general "line count
        differs" waiver: falling behind by two real commits in one
        regeneration gap is still real, reviewable staleness and must
        still fail --check."""
        if _is_shallow():
            self.skipTest("shallow clone: dashboard trend needs real git history")
        original = OUT.read_text(encoding="utf-8")
        try:
            if len(gd._TREND_ROW_RE.findall(original)) < 3:
                self.skipTest("fewer than 3 real trend rows in the committed "
                               "dashboard to safely remove 2 from")
            mutated = self._mutate_by_removing_trailing_rows(original, n_remove=2)
            OUT.write_text(mutated, encoding="utf-8")

            r = _run("--check")
            self.assertEqual(
                r.returncode, 1,
                msg="a committed file missing its real trailing TWO trend "
                    "rows must still be reported as staleness -- the "
                    "tolerance covers exactly one\n" + r.stdout + r.stderr,
            )
        finally:
            OUT.write_text(original, encoding="utf-8")


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
