"""Unit tests for tools/overlay_coupling.py.

Coverage for the pure data-crunching functions (path mapping,
top_outbound, standalone, MODES constant). The file-I/O paths
(build_matrix, write_coupling_md) are exercised by
test_analyze_symbols.py's shared `parse_relocs_file`.
"""

from __future__ import annotations

import sys
import unittest
from pathlib import Path

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

from overlay_coupling import (  # noqa: E402
    MODES,
    module_relocs_path,
    standalone,
    top_outbound,
)


class TestModes(unittest.TestCase):
    """MODES wires --calls / --loads to their reloc kind sets. If this
    table regresses, the CLI flag silently aggregates the wrong relocs."""

    def test_calls_entry(self):
        kinds, label, suffix = MODES["calls"]
        self.assertIn("arm_call", kinds)
        self.assertIn("thumb_call", kinds)
        self.assertEqual(label, "call")
        self.assertEqual(suffix, "")

    def test_loads_entry(self):
        kinds, label, suffix = MODES["loads"]
        self.assertIn("load", kinds)
        self.assertNotIn("arm_call", kinds)
        self.assertEqual(label, "load")
        self.assertEqual(suffix, "-loads")

    def test_call_and_load_kinds_disjoint(self):
        # A reloc should never be in both sets — would double-count
        # in matrix-build if some edge got classified as both.
        calls_kinds = MODES["calls"][0]
        loads_kinds = MODES["loads"][0]
        self.assertEqual(calls_kinds & loads_kinds, set())


class TestModuleRelocsPath(unittest.TestCase):
    def test_main(self):
        root = Path("/fake/config/eur")
        self.assertEqual(
            module_relocs_path(root, "main"),
            root / "arm9" / "relocs.txt",
        )

    def test_itcm(self):
        root = Path("/fake/config/eur")
        self.assertEqual(
            module_relocs_path(root, "itcm"),
            root / "arm9" / "itcm" / "relocs.txt",
        )

    def test_dtcm(self):
        root = Path("/fake/config/eur")
        self.assertEqual(
            module_relocs_path(root, "dtcm"),
            root / "arm9" / "dtcm" / "relocs.txt",
        )

    def test_overlay(self):
        root = Path("/fake/config/eur")
        self.assertEqual(
            module_relocs_path(root, "ov005"),
            root / "arm9" / "overlays" / "ov005" / "relocs.txt",
        )


class TestTopOutbound(unittest.TestCase):
    def setUp(self):
        # Fake edge counts — main → {ov002: 5, ov003: 2, main: 99}
        # (self-loop excluded from top_outbound's output by design).
        self.edges = {
            ("main", "main"): 99,
            ("main", "ov002"): 5,
            ("main", "ov003"): 2,
            ("main", "ov004"): 10,
            ("main", "ov005"): 1,
            ("ov002", "main"): 3055,
        }
        self.modules = ["main", "ov002", "ov003", "ov004", "ov005"]

    def test_excludes_self_loops(self):
        out = top_outbound(self.modules, self.edges, "main", k=10)
        dests = [dst for dst, _ in out]
        self.assertNotIn("main", dests)

    def test_sorted_desc(self):
        out = top_outbound(self.modules, self.edges, "main", k=10)
        counts = [c for _, c in out]
        self.assertEqual(counts, sorted(counts, reverse=True))

    def test_respects_k(self):
        out = top_outbound(self.modules, self.edges, "main", k=2)
        self.assertEqual(len(out), 2)
        # Top 2 by count: ov004 (10), ov002 (5).
        self.assertEqual(out[0], ("ov004", 10))
        self.assertEqual(out[1], ("ov002", 5))

    def test_empty_source(self):
        out = top_outbound(self.modules, self.edges, "ov999", k=3)
        self.assertEqual(out, [])


class TestStandalone(unittest.TestCase):
    def setUp(self):
        # Three modules: main (loud), ov001 (quiet), ov002 (below threshold).
        self.edges = {
            ("main", "main"): 1000,
            ("main", "ov001"): 500,
            ("main", "ov002"): 300,
            ("ov001", "ov001"): 100,
            ("ov001", "main"): 5,       # externally-quiet
            ("ov002", "ov002"): 20,
            ("ov002", "main"): 19,      # just below default threshold
        }
        self.modules = ["main", "ov001", "ov002"]

    def test_counts_external_only(self):
        # standalone ranks by external outbound, ignoring self-loops.
        out = standalone(self.modules, self.edges, threshold=100)
        # main: 500+300 = 800 external → above threshold, not listed.
        # ov001: 5 external → listed.
        # ov002: 19 external → listed.
        names = [m for m, _ in out]
        self.assertIn("ov001", names)
        self.assertIn("ov002", names)
        self.assertNotIn("main", names)

    def test_threshold_filters(self):
        out = standalone(self.modules, self.edges, threshold=10)
        # At threshold 10: ov001 (5) stays; ov002 (19) filtered out.
        names = [m for m, _ in out]
        self.assertIn("ov001", names)
        self.assertNotIn("ov002", names)

    def test_sorted_by_external_asc(self):
        # Most-standalone first — lower count ranks higher.
        out = standalone(self.modules, self.edges, threshold=1000)
        counts = [c for _, c in out]
        self.assertEqual(counts, sorted(counts))


if __name__ == "__main__":
    unittest.main()
