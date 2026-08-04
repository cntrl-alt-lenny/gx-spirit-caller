"""Tests for tools/work_queue.py — the autonomous self-chaining work queue."""

from __future__ import annotations

import sys
import tempfile
import unittest
from pathlib import Path

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

import work_queue as q  # noqa: E402

SEED = """# lane

### a1 — first task [TODO]
do the first thing
**Gate:** pytest

### a2 — second task [TODO]
do the second thing
**Gate:** gate3
"""


class QueueTest(unittest.TestCase):
    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory()
        q.QDIR = Path(self.tmp.name)
        (q.QDIR / "lane.md").write_text(SEED, encoding="utf-8")

    def tearDown(self):
        self.tmp.cleanup()

    def _body(self):
        return (q.QDIR / "lane.md").read_text(encoding="utf-8")

    def test_next_is_read_only_by_default(self):
        before = self._body()
        rc = q.cmd_next("lane")
        self.assertEqual(rc, 0)
        self.assertEqual(self._body(), before)
        self.assertIn("### a1 — first task [TODO]", self._body())

    def test_next_claims_first_todo_with_opt_in(self):
        rc = q.cmd_next("lane", claim=True)
        self.assertEqual(rc, 0)
        self.assertIn("### a1 — first task [CLAIMED]", self._body())
        self.assertIn("### a2 — second task [TODO]", self._body())

    def test_cli_claim_flag_is_explicit(self):
        self.assertEqual(q.main(["work_queue.py", "next", "lane"]), 0)
        self.assertIn("### a1 — first task [TODO]", self._body())
        self.assertEqual(q.main(["work_queue.py", "next", "lane", "--claim"]), 0)
        self.assertIn("### a1 — first task [CLAIMED]", self._body())

    def test_next_skips_claimed_to_next_todo(self):
        q.cmd_next("lane", claim=True)
        q.cmd_next("lane", claim=True)
        self.assertIn("### a2 — second task [CLAIMED]", self._body())

    def test_done_marks_done(self):
        q.cmd_next("lane", claim=True)
        q._transition("lane", "a1", "DONE")
        self.assertIn("### a1 — first task [DONE]", self._body())

    def test_park_records_reason(self):
        q._transition("lane", "a2", "PARKED", "known wall")
        body = self._body()
        self.assertIn("### a2 — second task [PARKED]", body)
        self.assertIn("> PARKED: known wall", body)

    def test_empty_returns_3(self):
        q._transition("lane", "a1", "DONE")
        q._transition("lane", "a2", "DONE")
        self.assertEqual(q.cmd_next("lane"), 3)  # no TODO left

    def test_missing_lane_file_errors(self):
        with self.assertRaises(SystemExit) as cm:
            q._read("nonexistent")
        self.assertEqual(cm.exception.code, 2)

    def test_claim_is_atomic_no_double(self):
        # two sequential nexts claim two DISTINCT items, never the same twice
        q.cmd_next("lane", claim=True)
        q.cmd_next("lane", claim=True)
        self.assertEqual(self._body().count("[CLAIMED]"), 2)
        self.assertEqual(self._body().count("[TODO]"), 0)


# --------------------------------------------------------------------------- #
# find_malformed_headers — a heading missing its [STATUS] bracket (or with a
# bracket that isn't a recognized status) is not just mis-parsed, it's
# completely INVISIBLE to next/status/list (silently skipped by _items(),
# no error). Confirmed real, recurring bug in docs/queue/claude-scaffolder.md
# -- q-metric-extern-guard shipped with no status marker at all and sat
# unschedulable until a human happened to read the raw file. Third
# occurrence of this exact class in this lane.
# --------------------------------------------------------------------------- #

class FindMalformedHeadersTest(unittest.TestCase):
    def test_clean_file_reports_nothing(self):
        self.assertEqual(q.find_malformed_headers(SEED), [])

    def test_missing_status_bracket_entirely(self):
        # The exact q-metric-extern-guard shape: heading present, status
        # bracket never added.
        text = "### a1 — first task\nbody\n**Gate:** pytest\n"
        bad = q.find_malformed_headers(text)
        self.assertEqual(len(bad), 1)
        self.assertIn("### a1 — first task", bad[0])

    def test_unrecognized_status_word(self):
        # Syntactically matches _HDR (brackets are in the right place) but
        # the word inside isn't one of STATUSES -- e.g. a typo. Silently
        # excluded from cmd_status's Counter today; should still be
        # flagged as not-a-recognized-status.
        text = "### a1 — first task [TDOO]\nbody\n"
        bad = q.find_malformed_headers(text)
        self.assertEqual(len(bad), 1)
        self.assertIn("[TDOO]", bad[0])

    def test_wrong_bracket_order_is_caught(self):
        # The actual mistake made while filing q-compile-gate-region-fix in
        # this same session: [TODO] [S] instead of [S] [TODO] -- _HDR's
        # trailing-whitespace-then-EOL lookahead only matches the LAST
        # bracket, so [S] (not a recognized status) gets captured instead
        # of [TODO], and the heading silently reads as malformed.
        text = "### a1 — first task [TODO] [S]\nbody\n"
        bad = q.find_malformed_headers(text)
        self.assertEqual(len(bad), 1)

    def test_correct_bracket_order_is_clean(self):
        text = "### a1 — first task [S] [TODO]\nbody\n"
        self.assertEqual(q.find_malformed_headers(text), [])

    def test_trailing_whitespace_after_bracket_is_still_clean(self):
        # Regression guard for the correlate-by-start-position design: a
        # naive matched-text comparison would false-positive here, since
        # _HDR's own match doesn't consume the lookahead's trailing
        # whitespace but _CANDIDATE_HDR's `.*$` does.
        text = "### a1 — first task [TODO]   \nbody\n"
        self.assertEqual(q.find_malformed_headers(text), [])

    def test_multiple_malformed_headers_all_reported(self):
        text = (
            "### a1 — first task\n"
            "body\n"
            "### a2 — second task [TODO]\n"
            "body\n"
            "### a3 — third task [NOTASTATUS]\n"
            "body\n"
        )
        bad = q.find_malformed_headers(text)
        self.assertEqual(len(bad), 2)


class RealQueueFilesTest(unittest.TestCase):
    """Guards the REAL docs/queue/*.md files in this repo -- not synthetic
    content. This is the actual regression test: it fails CI the moment
    anyone (human or agent) commits a heading that `next`/`status`/`list`
    would silently never see, instead of relying on someone noticing the
    queue item never gets picked up."""

    def test_no_malformed_headers_in_any_real_queue_file(self):
        real_qdir = Path(__file__).resolve().parent.parent / "docs" / "queue"
        lane_files = sorted(real_qdir.glob("*.md"))
        self.assertGreater(len(lane_files), 0, "no docs/queue/*.md files found")
        failures: list[str] = []
        for lane_file in lane_files:
            text = lane_file.read_text(encoding="utf-8")
            for bad_line in q.find_malformed_headers(text):
                failures.append(f"{lane_file.name}: {bad_line}")
        self.assertEqual(
            failures, [],
            msg=(
                "Heading(s) with no recognized [STATUS] marker -- these are "
                "SILENTLY INVISIBLE to work_queue.py next/status/list, not "
                "just mis-parsed. Add the missing/correct [TODO|CLAIMED|"
                "DONE|PARKED] marker:\n  " + "\n  ".join(failures)
            ),
        )


if __name__ == "__main__":
    unittest.main()
