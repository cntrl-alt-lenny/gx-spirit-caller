"""Unit tests for tools/ci_format_pattern_clusters.py.

The tool posts on PRs that touch symbols.txt or delinks.txt.
Regressions would either:
  - Misidentify "drained" clusters (false claim that a PR matched
    siblings)
  - Drop "newly-ready" clusters (decomper misses the first-template
    handoff signal)
  - Render an unparseable comment (breaks CI upsert)

Pinning:

  - diff_clusters: drained = same fp, fewer unmatched
  - diff_clusters: newly_ready = fp in after only
  - diff_clusters: closed = fp in before only
  - render_markdown: empty diff still emits FOOTER_MARKER + visible
    "no shifts" message (upsert depends on the marker)
  - render_markdown: each non-empty bucket renders its table
  - render_markdown: drainage % computed correctly
  - _empty_msg: no-base case emits visible placeholder + marker
  - sort order in each bucket is by impact (drainage / unmatched
    count desc)
"""

from __future__ import annotations

import sys
import unittest
from pathlib import Path

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

from analyze_symbols import (  # noqa: E402
    Symbol,
)
from ci_format_pattern_clusters import (  # noqa: E402
    ClusterDiff,
    ClusterSnapshot,
    FOOTER_MARKER,
    _empty_msg,
    diff_clusters,
    render_markdown,
)
from find_pattern_clusters import (  # noqa: E402
    Cluster,
)


def _fn(
    module: str, addr: int, *,
    name: str | None = None,
    size: int = 0x20,
) -> Symbol:
    if name is None:
        name = f"func_{addr:08x}"
    return Symbol(
        name=name, module=module, addr=addr, size=size,
        type="function", mode="arm",
    )


def _cluster(
    fp_size: int, fp_sig: tuple,
    matched: list[Symbol], unmatched: list[Symbol],
) -> Cluster:
    return Cluster(
        fingerprint=(fp_size, fp_sig),
        matched=tuple(matched),
        unmatched=tuple(unmatched),
    )


class TestDiffClusters(unittest.TestCase):
    def test_drained_when_unmatched_count_drops(self):
        a_match = _fn("main", 0x1000, size=0x20, name="A")
        a_un1 = _fn("main", 0x2000, size=0x20)
        a_un2 = _fn("main", 0x2100, size=0x20)
        a_un3 = _fn("main", 0x2200, size=0x20)
        before = [_cluster(0x20, (), [a_match], [a_un1, a_un2, a_un3])]
        # PR matched two of the three unmatched siblings.
        after = [_cluster(0x20, (), [a_match, a_un1, a_un2], [a_un3])]
        diff = diff_clusters(before, after)
        self.assertEqual(len(diff.drained), 1)
        self.assertEqual(diff.newly_ready, ())
        self.assertEqual(diff.closed, ())
        b_snap, a_snap = diff.drained[0]
        self.assertEqual(b_snap.unmatched_count, 3)
        self.assertEqual(a_snap.unmatched_count, 1)

    def test_newly_ready_when_fp_only_in_after(self):
        a = _fn("main", 0x1000, size=0x20, name="A")
        u1 = _fn("main", 0x2000, size=0x20)
        before: list[Cluster] = []
        after = [_cluster(0x20, (), [a], [u1])]
        diff = diff_clusters(before, after)
        self.assertEqual(diff.drained, ())
        self.assertEqual(len(diff.newly_ready), 1)
        self.assertEqual(diff.newly_ready[0].representative, "A")
        self.assertEqual(diff.newly_ready[0].unmatched_count, 1)

    def test_closed_when_fp_only_in_before(self):
        a = _fn("main", 0x1000, size=0x20, name="A")
        u1 = _fn("main", 0x2000, size=0x20)
        before = [_cluster(0x20, (), [a], [u1])]
        after: list[Cluster] = []
        diff = diff_clusters(before, after)
        self.assertEqual(diff.drained, ())
        self.assertEqual(diff.newly_ready, ())
        self.assertEqual(len(diff.closed), 1)
        self.assertEqual(diff.closed[0].representative, "A")

    def test_no_change_yields_empty_diff(self):
        a = _fn("main", 0x1000, size=0x20, name="A")
        u1 = _fn("main", 0x2000, size=0x20)
        before = [_cluster(0x20, (), [a], [u1])]
        after = [_cluster(0x20, (), [a], [u1])]
        diff = diff_clusters(before, after)
        self.assertEqual(diff.drained, ())
        self.assertEqual(diff.newly_ready, ())
        self.assertEqual(diff.closed, ())

    def test_drained_sort_by_drainage_desc(self):
        # Cluster X: drained 5 (10 → 5).
        # Cluster Y: drained 1 (3 → 2).
        # Expect X first.
        x_match = _fn("main", 0x1000, size=0x20, name="X")
        y_match = _fn("main", 0x3000, size=0x40, name="Y")
        x_uns_before = [_fn("main", 0x2000 + 0x10 * i, size=0x20)
                        for i in range(10)]
        x_uns_after = x_uns_before[5:]
        y_uns_before = [_fn("main", 0x4000 + 0x10 * i, size=0x40)
                        for i in range(3)]
        y_uns_after = y_uns_before[1:]
        before = [
            _cluster(0x20, (), [x_match], x_uns_before),
            _cluster(0x40, (), [y_match], y_uns_before),
        ]
        after = [
            _cluster(0x20, (), [x_match] + x_uns_before[:5],
                     x_uns_after),
            _cluster(0x40, (), [y_match] + y_uns_before[:1],
                     y_uns_after),
        ]
        diff = diff_clusters(before, after)
        self.assertEqual(len(diff.drained), 2)
        # X drained 5, Y drained 1 — X first.
        self.assertEqual(
            diff.drained[0][1].representative, "X",
        )

    def test_unmatched_to_zero_in_after_drains_then_closes_via_before_only(self):
        """A cluster fully matched in `after` no longer appears in
        find_clusters output (since unmatched=0 fails the filter).
        That manifests as a "closed" entry in the diff, not "drained".
        """
        a = _fn("main", 0x1000, size=0x20, name="A")
        u1 = _fn("main", 0x2000, size=0x20)
        before = [_cluster(0x20, (), [a], [u1])]
        after: list[Cluster] = []   # cluster gone — entirely consumed
        diff = diff_clusters(before, after)
        self.assertEqual(diff.drained, ())
        self.assertEqual(len(diff.closed), 1)


class TestRenderMarkdown(unittest.TestCase):
    def test_empty_diff_has_marker(self):
        diff = ClusterDiff(drained=(), newly_ready=(), closed=())
        md = render_markdown(diff, version="eur")
        self.assertIn(FOOTER_MARKER, md)
        self.assertIn("No pattern-cluster shifts", md)

    def test_drained_section_renders(self):
        before = ClusterSnapshot(
            fingerprint=(0x20, ()),
            matched_count=1,
            unmatched_count=10,
            representative="A",
            representative_module="main",
            representative_addr=0x1000,
        )
        after = ClusterSnapshot(
            fingerprint=(0x20, ()),
            matched_count=6,
            unmatched_count=5,
            representative="A",
            representative_module="main",
            representative_addr=0x1000,
        )
        diff = ClusterDiff(
            drained=((before, after),),
            newly_ready=(),
            closed=(),
        )
        md = render_markdown(diff, version="eur")
        self.assertIn("Drained (1)", md)
        self.assertIn("`A`", md)
        self.assertIn("10 → 5", md)
        # 50% drainage pct = (10 - 5) / 10 → 50%.
        self.assertIn("50%", md)
        # Summary line counts target drainage.
        self.assertIn("**5** target(s)", md)

    def test_newly_ready_section_renders(self):
        snap = ClusterSnapshot(
            fingerprint=(0x40, ()),
            matched_count=1,
            unmatched_count=12,
            representative="NewTemplate",
            representative_module="ov005",
            representative_addr=0x021b0000,
        )
        diff = ClusterDiff(
            drained=(),
            newly_ready=(snap,),
            closed=(),
        )
        md = render_markdown(diff, version="eur")
        self.assertIn("Newly-ready (1)", md)
        self.assertIn("NewTemplate", md)
        self.assertIn("**12**", md)

    def test_closed_section_renders(self):
        snap = ClusterSnapshot(
            fingerprint=(0xc, ()),
            matched_count=1,
            unmatched_count=3,
            representative="Done",
            representative_module="main",
            representative_addr=0x2000,
        )
        diff = ClusterDiff(
            drained=(),
            newly_ready=(),
            closed=(snap,),
        )
        md = render_markdown(diff, version="eur")
        self.assertIn("Closed (1)", md)
        self.assertIn("Done", md)

    def test_top_rows_truncation_message(self):
        snaps = [
            ClusterSnapshot(
                fingerprint=(0x10 + i, ()),
                matched_count=1,
                unmatched_count=20 - i,
                representative=f"N{i}",
                representative_module="main",
                representative_addr=0x1000 + i * 0x10,
            )
            for i in range(15)
        ]
        diff = ClusterDiff(
            drained=(), newly_ready=tuple(snaps), closed=(),
        )
        md = render_markdown(diff, version="eur", top_rows=10)
        self.assertIn("+5 more newly-ready", md)


class TestEmptyMsg(unittest.TestCase):
    def test_no_base_placeholder_has_marker(self):
        md = _empty_msg(version="eur")
        self.assertIn(FOOTER_MARKER, md)
        self.assertIn("No base-branch snapshot", md)
        self.assertIn("eur", md)


if __name__ == "__main__":
    unittest.main()
