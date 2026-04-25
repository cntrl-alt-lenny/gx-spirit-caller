"""Unit tests for tools/ci_format_mega_cascades.py.

The tool posts on PRs that touch symbols.txt. Regressions would:
  - Misidentify "consumed" anchors (false claim that a high-leverage
    target was eliminated)
  - Drop "entered" anchors (decomper misses next-wave brief options)
  - Render an unparseable comment (breaks CI upsert)

Pinning:

  - diff_rankings: consumed = before-only, entered = after-only,
    moved = both with rank/weight Δ, unchanged = both with no Δ
  - render_markdown: empty-diff case still emits FOOTER_MARKER
    (upsert depends on it)
  - render_markdown: each non-empty bucket renders its table
  - _empty_msg: no-base case emits visible placeholder + marker
  - rank ordering preserved in render output
"""

from __future__ import annotations

import sys
import unittest
from pathlib import Path

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

from ci_format_mega_cascades import (  # noqa: E402
    FOOTER_MARKER,
    RankingEntry,
    _empty_msg,
    diff_rankings,
    render_markdown,
)


def _entry(
    rank: int, addr: int, *,
    name: str | None = None,
    weight: int = 10, depth: int = 2,
    direct: int = 5, indirect: int = 5,
    module: str = "main",
) -> RankingEntry:
    return RankingEntry(
        rank=rank,
        module=module,
        addr=addr,
        name=name or f"func_{addr:08x}",
        weight=weight,
        direct=direct,
        indirect=indirect,
        depth=depth,
    )


class TestDiffRankings(unittest.TestCase):
    def test_all_unchanged(self):
        before = [_entry(1, 0x1000), _entry(2, 0x2000)]
        after = [_entry(1, 0x1000), _entry(2, 0x2000)]
        diff = diff_rankings(before, after)
        self.assertEqual(diff.consumed, ())
        self.assertEqual(diff.entered, ())
        self.assertEqual(diff.moved, ())
        self.assertEqual(len(diff.unchanged), 2)

    def test_consumed_anchor_in_before_only(self):
        before = [_entry(1, 0x1000), _entry(2, 0x2000)]
        after = [_entry(1, 0x1000)]
        diff = diff_rankings(before, after)
        self.assertEqual(len(diff.consumed), 1)
        self.assertEqual(diff.consumed[0].addr, 0x2000)

    def test_entered_anchor_in_after_only(self):
        before = [_entry(1, 0x1000)]
        after = [_entry(1, 0x1000), _entry(2, 0x2000)]
        diff = diff_rankings(before, after)
        self.assertEqual(len(diff.entered), 1)
        self.assertEqual(diff.entered[0].addr, 0x2000)

    def test_moved_when_rank_changes(self):
        before = [_entry(1, 0x1000, weight=20), _entry(2, 0x2000, weight=10)]
        after = [_entry(1, 0x2000, weight=15), _entry(2, 0x1000, weight=12)]
        diff = diff_rankings(before, after)
        self.assertEqual(diff.consumed, ())
        self.assertEqual(diff.entered, ())
        self.assertEqual(len(diff.moved), 2)

    def test_moved_when_only_weight_changes(self):
        before = [_entry(1, 0x1000, weight=20)]
        after = [_entry(1, 0x1000, weight=25)]
        diff = diff_rankings(before, after)
        self.assertEqual(len(diff.moved), 1)
        self.assertEqual(len(diff.unchanged), 0)

    def test_no_movement_no_diff(self):
        before = [_entry(1, 0x1000, weight=20, depth=3)]
        after = [_entry(1, 0x1000, weight=20, depth=3)]
        diff = diff_rankings(before, after)
        self.assertEqual(len(diff.moved), 0)
        self.assertEqual(len(diff.unchanged), 1)


class TestRenderMarkdown(unittest.TestCase):
    def test_empty_diff_still_has_footer(self):
        from ci_format_mega_cascades import RankingDiff
        diff = RankingDiff(
            consumed=(), entered=(), moved=(), unchanged=(),
        )
        md = render_markdown(diff, version="eur", top_n=20)
        self.assertIn(FOOTER_MARKER, md)
        self.assertIn("No change", md)

    def test_consumed_bucket_renders(self):
        from ci_format_mega_cascades import RankingDiff
        diff = RankingDiff(
            consumed=(
                _entry(3, 0x1000, name="ConsumedFn", weight=42),
            ),
            entered=(),
            moved=(),
            unchanged=(),
        )
        md = render_markdown(diff, version="eur", top_n=20)
        self.assertIn("Consumed (1)", md)
        self.assertIn("ConsumedFn", md)
        self.assertIn("42", md)
        self.assertIn(FOOTER_MARKER, md)

    def test_entered_bucket_renders(self):
        from ci_format_mega_cascades import RankingDiff
        diff = RankingDiff(
            consumed=(),
            entered=(
                _entry(5, 0x2000, name="NewFn", weight=33),
            ),
            moved=(),
            unchanged=(),
        )
        md = render_markdown(diff, version="eur", top_n=20)
        self.assertIn("Entered (1)", md)
        self.assertIn("NewFn", md)
        self.assertIn("33", md)

    def test_moved_bucket_renders_with_delta_arrows(self):
        from ci_format_mega_cascades import RankingDiff
        before = _entry(5, 0x3000, name="Promoted", weight=15)
        after = _entry(2, 0x3000, name="Promoted", weight=20)
        diff = RankingDiff(
            consumed=(), entered=(),
            moved=((before, after),),
            unchanged=(),
        )
        md = render_markdown(diff, version="eur", top_n=20)
        self.assertIn("Moved (1)", md)
        self.assertIn("Promoted", md)
        # Rank improved (5 → 2): up arrow.
        self.assertIn("⬆", md)
        # Weight grew by +5: signed format.
        self.assertIn("+5", md)

    def test_moved_sort_order_by_abs_weight_delta(self):
        from ci_format_mega_cascades import RankingDiff
        small_change = (
            _entry(4, 0x3000, name="Small", weight=15),
            _entry(3, 0x3000, name="Small", weight=16),
        )
        big_change = (
            _entry(5, 0x4000, name="Big", weight=20),
            _entry(7, 0x4000, name="Big", weight=10),
        )
        diff = RankingDiff(
            consumed=(), entered=(),
            moved=(small_change, big_change),
            unchanged=(),
        )
        md = render_markdown(diff, version="eur", top_n=20)
        big_pos = md.find("Big")
        small_pos = md.find("Small")
        self.assertGreater(small_pos, 0)
        self.assertGreater(big_pos, 0)
        # Big's weight delta is 10; Small's is 1. Big should render first.
        self.assertLess(big_pos, small_pos)

    def test_full_diff_summary_line(self):
        from ci_format_mega_cascades import RankingDiff
        diff = RankingDiff(
            consumed=(_entry(1, 0x1000),),
            entered=(_entry(20, 0x2000),),
            moved=((
                _entry(5, 0x3000, weight=10),
                _entry(3, 0x3000, weight=12),
            ),),
            unchanged=(),
        )
        md = render_markdown(diff, version="eur", top_n=20)
        # Summary line counts the buckets.
        self.assertIn("**1** consumed", md)
        self.assertIn("**1** entered", md)
        self.assertIn("**1** moved", md)


class TestEmptyMsg(unittest.TestCase):
    def test_no_base_placeholder_has_marker(self):
        md = _empty_msg(version="eur", top_n=20)
        self.assertIn(FOOTER_MARKER, md)
        self.assertIn("No base-branch snapshot", md)
        self.assertIn("eur", md)
        self.assertIn("20", md)


if __name__ == "__main__":
    unittest.main()
