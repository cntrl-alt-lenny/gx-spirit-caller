"""Synthetic-shape tests for the field producer hypothesis finder."""

from __future__ import annotations

import sys
import tempfile
import unittest
from pathlib import Path

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

from field_producer_finder import find_candidates, make_spec  # noqa: E402


class TestFieldProducerFinder(unittest.TestCase):
    def test_surfaces_all_three_shapes_and_ranks_rmw_first(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            source = root / "src" / "synthetic.c"
            source.parent.mkdir()
            source.write_text(
                """
                typedef struct State { unsigned short flags; } State;
                State data_02104bac;
                void f(void) {
                    data_02104bac.flags = (data_02104bac.flags & ~4) | 2;
                    Fill32(&data_02104bac, 0, 0x80);
                    sdk_write(&data_02104bac.flags);
                }
                """,
                encoding="utf-8",
            )
            candidates = find_candidates(make_spec("GlobalData02104bac", 0x54, 2), root)
        shapes = {candidate.shape for candidate in candidates}
        self.assertEqual(shapes, {"masked-rmw", "bulk-fill", "sdk-call"})
        self.assertEqual(candidates[0].shape, "masked-rmw")
        self.assertTrue(all(candidate.path == "src/synthetic.c" for candidate in candidates))

    def test_assembly_requires_same_register_and_offset_for_masked_rmw(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            source = root / "src" / "synthetic.s"
            source.parent.mkdir()
            source.write_text(
                """
                ldrh r1, [r0, #0x54]
                orr r1, r1, #4
                strh r1, [r0, #0x54]
                """,
                encoding="utf-8",
            )
            candidates = find_candidates(make_spec("data_02104bac", 0x54, 2), root)
        self.assertEqual([candidate.shape for candidate in candidates], ["masked-rmw"])


if __name__ == "__main__":
    unittest.main()
