"""Unit tests for the typed merge-round driver."""

from __future__ import annotations

import sys
import unittest
from pathlib import Path

TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(TOOLS))

from integrate import (  # noqa: E402
    conflict_kind,
    summary_from_name_status,
    union_queue_docs,
)


class TestConflictKinds(unittest.TestCase):
    def test_typed_paths(self):
        self.assertEqual(conflict_kind("config/eur/arm9/delinks.txt"),
                         "delinks-keep-ours-sort")
        self.assertEqual(conflict_kind("docs/queue/codex-scaffolder.md"),
                         "queue-union-dedup")
        self.assertEqual(conflict_kind("docs/research/README.md"),
                         "research-index-regenerate")
        self.assertEqual(conflict_kind("src/main/func_02000000.c"), "unknown")


class TestQueueUnion(unittest.TestCase):
    def test_deduplicates_by_id_and_keeps_ours(self):
        ours = "# Queue\n\n### q-one — ours\n\nours\n\n### q-two\n\nsecond\n"
        theirs = "# Queue\n\n### q-one — theirs\n\ntheirs\n\n### q-three\n\nthird\n"
        merged = union_queue_docs(ours, theirs)
        self.assertIn("ours", merged)
        self.assertNotIn("theirs", merged)
        self.assertIn("q-three", merged)
        self.assertEqual(merged.count("### q-one"), 1)
        self.assertIn("\n\n### q-one", merged)

    def test_non_queue_docs_are_not_silently_dropped(self):
        merged = union_queue_docs("left\n", "right\n")
        self.assertIn("left", merged)
        self.assertIn("right", merged)


class TestSummary(unittest.TestCase):
    def test_counts_added_c_and_deleted_s(self):
        self.assertEqual(summary_from_name_status([
            "A\tsrc/main/func_1.c",
            "M\tsrc/main/func_2.c",
            "D\tsrc/main/func_3.s",
            "D\tsrc/main/func_4.c",
        ]), (1, 1))


if __name__ == "__main__":
    unittest.main()
