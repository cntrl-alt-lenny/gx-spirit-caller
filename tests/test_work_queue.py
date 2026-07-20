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

    def test_next_claims_first_todo(self):
        rc = q.cmd_next("lane")
        self.assertEqual(rc, 0)
        self.assertIn("### a1 — first task [CLAIMED]", self._body())
        self.assertIn("### a2 — second task [TODO]", self._body())  # untouched

    def test_next_skips_claimed_to_next_todo(self):
        q.cmd_next("lane")            # claims a1
        q.cmd_next("lane")            # should claim a2
        self.assertIn("### a2 — second task [CLAIMED]", self._body())

    def test_done_marks_done(self):
        q.cmd_next("lane")
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
        q.cmd_next("lane")
        q.cmd_next("lane")
        self.assertEqual(self._body().count("[CLAIMED]"), 2)
        self.assertEqual(self._body().count("[TODO]"), 0)


if __name__ == "__main__":
    unittest.main()
