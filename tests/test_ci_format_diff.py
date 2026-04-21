"""Unit tests for tools/ci_format_diff.py.

Covers the public render() function across empty / simple / complex
diff payloads. The CI workflow pipes the output of render() straight
into `gh pr comment`, so if the rendering regresses, every PR after
that point gets a broken comment.
"""

from __future__ import annotations

import sys
import unittest
from pathlib import Path

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

from ci_format_diff import TIER_ORDER, fmt_signed, render  # noqa: E402


class TestFmtSigned(unittest.TestCase):
    def test_positive(self):
        self.assertEqual(fmt_signed(7), "+7")

    def test_negative(self):
        self.assertEqual(fmt_signed(-3), "-3")

    def test_zero(self):
        self.assertEqual(fmt_signed(0), "0")


class TestTierOrder(unittest.TestCase):
    def test_mirrors_analyzer(self):
        # ci_format_diff intentionally duplicates TIER_ORDER rather
        # than importing it, because the CI workflow may checkout an
        # older analyzer. If the analyzer's canonical order drifts,
        # the comment will still be deterministic in its own order.
        # Still useful to pin the current value so drift is visible.
        self.assertEqual(
            TIER_ORDER,
            ["trivial", "easy", "sinit", "named", "medium", "hard"],
        )


class TestRender(unittest.TestCase):
    def test_empty_diff_renders_cleanly(self):
        md = render({})
        self.assertIn("📊 Analyzer tier delta", md)
        self.assertIn("_Tier counts unchanged._", md)
        self.assertIn("_No classification changes", md)
        # Bot-signature footer always present.
        self.assertIn(".github/workflows/analyzer.yml", md)

    def test_fully_empty_lists(self):
        md = render({
            "tier_delta": {},
            "renamed": [],
            "moved": [],
            "newly_classified": [],
            "removed": [],
        })
        self.assertIn("_Tier counts unchanged._", md)
        self.assertIn("_No classification changes", md)

    def test_tier_deltas_rendered_in_canonical_order(self):
        md = render({
            "tier_delta": {"hard": -3, "medium": 2, "named": 1, "easy": 0},
        })
        self.assertIn("### Tier counts", md)
        # Canonical order: trivial, easy, sinit, named, medium, hard.
        # easy is zero so skipped. Remaining order in output: named, medium, hard.
        named_pos = md.find("`named`")
        medium_pos = md.find("`medium`")
        hard_pos = md.find("`hard`")
        self.assertGreater(named_pos, 0)
        self.assertGreater(medium_pos, named_pos)
        self.assertGreater(hard_pos, medium_pos)
        # Signed formatting.
        self.assertIn("+1", md)
        self.assertIn("+2", md)
        self.assertIn("-3", md)
        # Zero not rendered.
        self.assertNotIn("`easy`", md)

    def test_renames_rendered_with_key(self):
        md = render({
            "renamed": [
                ["main|0x02000800", "Entry", "CRT_Entry"],
                ["ov005|0x021aa4a0", "func_ov005_021aa4a0", "Ov005_Init"],
            ],
        })
        self.assertIn("### Renames (2)", md)
        self.assertIn("`Entry`", md)
        self.assertIn("**`CRT_Entry`**", md)
        self.assertIn("main|0x02000800", md)
        self.assertIn("`Ov005_Init`", md)

    def test_renames_truncated_over_limit(self):
        many = [[f"ov005|0x{0x100+i*4:08x}", f"old_{i}", f"new_{i}"]
                for i in range(25)]
        md = render({"renamed": many}, limit=10)
        self.assertIn("### Renames (25)", md)
        # First 10 rendered, then a "+15 more" note.
        self.assertIn("_…and 15 more_", md)
        # 11th onward should NOT appear.
        self.assertIn("old_9", md)
        self.assertNotIn("old_10", md)

    def test_tier_changes_grouped_with_counts(self):
        md = render({
            "moved": [
                ["a", "hard", "medium"],
                ["b", "hard", "medium"],
                ["c", "hard", "medium"],
                ["d", "easy", "named"],
            ],
        })
        self.assertIn("### Tier changes (4)", md)
        # Grouped transitions with counts, hard→medium ranks first
        # (count=3 vs 1).
        self.assertIn("| `hard` | `medium` | 3 |", md)
        self.assertIn("| `easy` | `named` | 1 |", md)
        # hard→medium should appear BEFORE easy→named (sorted desc).
        self.assertLess(md.find("`hard` | `medium`"), md.find("`easy` | `named`"))

    def test_newly_classified(self):
        md = render({
            "newly_classified": [
                ["main|0x02000800", "Entry", "named"],
            ],
        })
        self.assertIn("### Newly classified (1)", md)
        self.assertIn("`Entry`", md)
        self.assertIn("`named`", md)

    def test_removed(self):
        md = render({
            "removed": [
                ["main|0x02000800", "Entry", "named"],
            ],
        })
        self.assertIn("### Removed (1)", md)
        self.assertIn("was `named`", md)

    def test_realistic_mixed_payload(self):
        # A plausible mid-decomp diff: a few renames, some tier
        # cascades, plus a tier count delta.
        md = render({
            "tier_delta": {"named": 5, "hard": -7, "medium": 2},
            "renamed": [
                ["main|0x02000086", "VBlankIntrWait", "OS_WaitVBlankIntr"],
                ["ov005|0x021aa4a0", "func_ov005_021aa4a0", "Ov005_Vtable0"],
            ],
            "moved": [
                ["ov005|0x021aa4a0", "trivial", "named"],
                ["main|0x02000086", "trivial", "named"],
            ],
            "newly_classified": [],
            "removed": [],
        })
        # Every section present.
        self.assertIn("### Tier counts", md)
        self.assertIn("### Renames (2)", md)
        self.assertIn("### Tier changes (2)", md)
        self.assertNotIn("### Newly classified", md)
        self.assertNotIn("### Removed", md)
        # Footer.
        self.assertIn(".github/workflows/analyzer.yml", md)


if __name__ == "__main__":
    unittest.main()
