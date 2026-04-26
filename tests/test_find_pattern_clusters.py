"""Unit tests for tools/find_pattern_clusters.py.

The tool surfaces ready-to-propagate clusters: matched anchor + N
unmatched siblings sharing one exact (size, reloc-sig) fingerprint.

Regressions would either:
  - Surface clusters with no matched anchor (decomper has nothing
    to draft from)
  - Surface clusters with no unmatched siblings (no work to do)
  - Group functions with mismatching size or sig (`propagate_template`
    will reject them — false leverage signal)

Pinning:

  - `_fingerprint`: filters zero-size, sinit shells, gap stubs,
    non-functions
  - `find_clusters`: drops all-matched and all-unmatched buckets
  - `find_clusters`: respects min_unmatched floor
  - `find_clusters`: deterministic member ordering
  - `find_clusters`: empty-sig (leaf functions) still cluster
  - `find_clusters_for_anchor`: returns Cluster anchored on caller
  - Sort: -unmatched_count, size asc, sig_len asc, addr asc
  - Renderers: empty input emits visible message + no crash
  - JSON renderer: schema round-trip
"""

from __future__ import annotations

import json
import sys
import unittest
from pathlib import Path

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

from analyze_symbols import (  # noqa: E402
    ModuleData,
    Reloc,
    Symbol,
)
from find_pattern_clusters import (  # noqa: E402
    Cluster,
    _fingerprint,
    find_clusters,
    find_clusters_for_anchor,
    render_anchor_text,
    render_json,
    render_markdown,
    render_text_summary,
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


def _module_with_relocs(
    name: str,
    syms: list[Symbol],
    relocs: list[Reloc] | None = None,
) -> ModuleData:
    md = ModuleData(name=name)
    md.symbols = list(syms)
    md.by_addr = {s.addr: s for s in syms}
    md.by_addr_sorted = sorted(syms, key=lambda s: s.addr)
    md.relocs = list(relocs or [])
    return md


def _reloc(
    src_module: str, src_addr: int, kind: str = "arm_call",
    dest_module: str = "main", dest_addr: int = 0,
) -> Reloc:
    return Reloc(
        src_addr=src_addr, src_module=src_module,
        dest_addr=dest_addr, dest_module=dest_module,
        kind=kind,
    )


class TestFingerprint(unittest.TestCase):
    def test_basic_function_returns_size_and_sig(self):
        sym = _fn("main", 0x1000, size=0x40)
        relocs = [
            _reloc("main", 0x1004, kind="arm_call"),
            _reloc("main", 0x100c, kind="arm_pcrel"),
        ]
        md = _module_with_relocs("main", [sym], relocs)
        fp = _fingerprint(sym, md)
        self.assertEqual(fp[0], 0x40)
        # offsets relative to base, kinds preserved
        self.assertEqual(
            fp[1],
            ((0x4, "arm_call"), (0xc, "arm_pcrel")),
        )

    def test_zero_size_filtered(self):
        sym = _fn("main", 0x1000, size=0)
        md = _module_with_relocs("main", [sym], [])
        self.assertIsNone(_fingerprint(sym, md))

    def test_sinit_filtered(self):
        sym = _fn("main", 0x1000, name="__sinit_foo", size=0x20)
        md = _module_with_relocs("main", [sym], [])
        self.assertIsNone(_fingerprint(sym, md))

    def test_dsd_gap_filtered(self):
        sym = _fn("main", 0x1000, name="_dsd_gap_001", size=0x20)
        md = _module_with_relocs("main", [sym], [])
        self.assertIsNone(_fingerprint(sym, md))

    def test_non_function_filtered(self):
        sym = Symbol(
            name="data_01000000", module="main", addr=0x1000,
            size=0x10, type="data", mode="any",
        )
        md = _module_with_relocs("main", [sym], [])
        self.assertIsNone(_fingerprint(sym, md))

    def test_leaf_with_no_relocs_has_empty_sig(self):
        sym = _fn("main", 0x1000, size=0x4)
        md = _module_with_relocs("main", [sym], [])
        fp = _fingerprint(sym, md)
        self.assertEqual(fp, (0x4, ()))


class TestFindClusters(unittest.TestCase):
    def _build_pair(
        self, *, sig_match: bool = True,
        size_match: bool = True,
    ):
        """One matched anchor + one unmatched sibling. By default
        same size + same sig (ready-to-propagate cluster)."""
        anchor = _fn("main", 0x1000, size=0x20, name="MatchedFn")
        sibling_size = 0x20 if size_match else 0x40
        sibling = _fn("main", 0x2000, size=sibling_size)
        relocs = [
            _reloc("main", 0x1004, kind="arm_call"),
            _reloc("main", 0x2004 if sig_match else 0x2008,
                   kind="arm_call"),
        ]
        md = _module_with_relocs("main", [anchor, sibling], relocs)
        modules = {"main": md}
        # Mark anchor matched, sibling unmatched.
        matched = {"main": [(0x1000, 0x1020)]}
        return modules, matched

    def test_matched_plus_unmatched_yields_cluster(self):
        modules, matched = self._build_pair()
        clusters = find_clusters(modules, matched)
        self.assertEqual(len(clusters), 1)
        c = clusters[0]
        self.assertEqual(len(c.matched), 1)
        self.assertEqual(len(c.unmatched), 1)
        self.assertEqual(c.matched[0].name, "MatchedFn")
        self.assertEqual(c.unmatched[0].addr, 0x2000)

    def test_size_mismatch_no_cluster(self):
        modules, matched = self._build_pair(size_match=False)
        clusters = find_clusters(modules, matched)
        self.assertEqual(clusters, [])

    def test_sig_mismatch_no_cluster(self):
        modules, matched = self._build_pair(sig_match=False)
        clusters = find_clusters(modules, matched)
        self.assertEqual(clusters, [])

    def test_all_matched_dropped(self):
        anchor = _fn("main", 0x1000, size=0x20, name="A")
        sib = _fn("main", 0x2000, size=0x20, name="B")
        relocs = [
            _reloc("main", 0x1004, kind="arm_call"),
            _reloc("main", 0x2004, kind="arm_call"),
        ]
        md = _module_with_relocs("main", [anchor, sib], relocs)
        # Both addr ranges in matched.
        matched = {"main": [(0x1000, 0x1020), (0x2000, 0x2020)]}
        clusters = find_clusters({"main": md}, matched)
        self.assertEqual(clusters, [])

    def test_all_unmatched_dropped(self):
        a = _fn("main", 0x1000, size=0x20)
        b = _fn("main", 0x2000, size=0x20)
        relocs = [
            _reloc("main", 0x1004, kind="arm_call"),
            _reloc("main", 0x2004, kind="arm_call"),
        ]
        md = _module_with_relocs("main", [a, b], relocs)
        clusters = find_clusters({"main": md}, matched={})
        self.assertEqual(clusters, [])

    def test_min_unmatched_threshold(self):
        # 1 matched + 1 unmatched. Default threshold 1 → keep.
        # Threshold 2 → drop.
        modules, matched = self._build_pair()
        self.assertEqual(
            len(find_clusters(modules, matched, min_unmatched=1)),
            1,
        )
        self.assertEqual(
            len(find_clusters(modules, matched, min_unmatched=2)),
            0,
        )

    def test_leaf_cluster_with_empty_sig(self):
        # Two 4-byte `bx lr` shells, no relocs. Should still cluster
        # if one is matched and one isn't.
        anchor = _fn("main", 0x1000, size=0x4, name="LeafA")
        sib = _fn("main", 0x2000, size=0x4)
        md = _module_with_relocs("main", [anchor, sib], [])
        matched = {"main": [(0x1000, 0x1004)]}
        clusters = find_clusters({"main": md}, matched)
        self.assertEqual(len(clusters), 1)
        self.assertEqual(clusters[0].fingerprint, (0x4, ()))

    def test_sort_unmatched_count_desc(self):
        # Two distinct fingerprints, different unmatched counts.
        # Cluster A: 1 matched + 3 unmatched.
        # Cluster B: 1 matched + 1 unmatched.
        # Expect A first.
        a_match = _fn("main", 0x1000, size=0x20, name="A")
        a_un1 = _fn("main", 0x2000, size=0x20)
        a_un2 = _fn("main", 0x2100, size=0x20)
        a_un3 = _fn("main", 0x2200, size=0x20)
        # Different size → different fingerprint group
        b_match = _fn("main", 0x3000, size=0x40, name="B")
        b_un1 = _fn("main", 0x4000, size=0x40)
        relocs = [
            _reloc("main", a + 4, kind="arm_call")
            for a in [0x1000, 0x2000, 0x2100, 0x2200, 0x3000, 0x4000]
        ]
        md = _module_with_relocs(
            "main",
            [a_match, a_un1, a_un2, a_un3, b_match, b_un1],
            relocs,
        )
        matched = {
            "main": [(0x1000, 0x1020), (0x3000, 0x3040)],
        }
        clusters = find_clusters({"main": md}, matched)
        self.assertEqual(len(clusters), 2)
        # A has 3 unmatched, B has 1 — A should come first.
        self.assertEqual(clusters[0].matched[0].name, "A")
        self.assertEqual(clusters[1].matched[0].name, "B")

    def test_member_ordering_deterministic(self):
        # Members in arbitrary insertion order — output sorted.
        a = _fn("main", 0x1000, size=0x20, name="A")
        x = _fn("main", 0x5000, size=0x20)
        y = _fn("main", 0x3000, size=0x20)
        relocs = [
            _reloc("main", a.addr + 4, kind="arm_call")
            for a in (a, x, y)
        ]
        md = _module_with_relocs("main", [a, x, y], relocs)
        matched = {"main": [(0x1000, 0x1020)]}
        clusters = find_clusters({"main": md}, matched)
        self.assertEqual(len(clusters), 1)
        addrs = [s.addr for s in clusters[0].unmatched]
        self.assertEqual(addrs, [0x3000, 0x5000])  # asc


class TestFindClustersForAnchor(unittest.TestCase):
    def test_returns_cluster_for_known_anchor(self):
        anchor = _fn("main", 0x1000, size=0x20, name="A")
        sib = _fn("main", 0x2000, size=0x20)
        relocs = [
            _reloc("main", 0x1004, kind="arm_call"),
            _reloc("main", 0x2004, kind="arm_call"),
        ]
        md = _module_with_relocs("main", [anchor, sib], relocs)
        matched = {"main": [(0x1000, 0x1020)]}
        cluster = find_clusters_for_anchor(
            anchor, {"main": md}, matched,
        )
        self.assertIsNotNone(cluster)
        self.assertEqual(len(cluster.unmatched), 1)
        self.assertEqual(cluster.unmatched[0].addr, 0x2000)

    def test_no_siblings_returns_cluster_with_empty_unmatched(self):
        anchor = _fn("main", 0x1000, size=0x20, name="A")
        relocs = [_reloc("main", 0x1004, kind="arm_call")]
        md = _module_with_relocs("main", [anchor], relocs)
        matched = {"main": [(0x1000, 0x1020)]}
        cluster = find_clusters_for_anchor(
            anchor, {"main": md}, matched,
        )
        self.assertIsNotNone(cluster)
        self.assertEqual(cluster.unmatched, ())
        # Anchor itself is in `matched` exactly once.
        self.assertEqual(len(cluster.matched), 1)


class TestRenderTextSummary(unittest.TestCase):
    def test_empty_renders_polite_message(self):
        out = render_text_summary([])
        self.assertIn("No ready-to-propagate clusters", out)

    def test_populated_summary(self):
        anchor = _fn("main", 0x1000, size=0x20, name="MyTemplate")
        sib = _fn("main", 0x2000, size=0x20)
        cluster = Cluster(
            fingerprint=(0x20, ((0x4, "arm_call"),)),
            matched=(anchor,),
            unmatched=(sib,),
        )
        out = render_text_summary([cluster])
        self.assertIn("MyTemplate", out)
        self.assertIn("matched=1", out)
        self.assertIn("unmatched=1", out)


class TestRenderMarkdown(unittest.TestCase):
    def test_full_markdown_includes_anchor_and_targets(self):
        anchor = _fn("main", 0x1000, size=0x20, name="MyTemplate")
        sib = _fn("main", 0x2000, size=0x20)
        cluster = Cluster(
            fingerprint=(0x20, ((0x4, "arm_call"),)),
            matched=(anchor,),
            unmatched=(sib,),
        )
        md = render_markdown([cluster], version="eur")
        self.assertIn("# Pattern clusters", md)
        self.assertIn("MyTemplate", md)
        self.assertIn("0x00002000", md)
        self.assertIn("**1** ready-to-propagate", md)

    def test_empty_clusters_renders_header_only(self):
        md = render_markdown([], version="eur")
        self.assertIn("# Pattern clusters", md)
        self.assertIn("**0** ready-to-propagate", md)


class TestRenderJson(unittest.TestCase):
    def test_schema_round_trip(self):
        anchor = _fn("main", 0x1000, size=0x20, name="MyTemplate")
        sib = _fn("main", 0x2000, size=0x20)
        cluster = Cluster(
            fingerprint=(0x20, ((0x4, "arm_call"),)),
            matched=(anchor,),
            unmatched=(sib,),
        )
        payload = json.loads(render_json([cluster]))
        self.assertEqual(len(payload["clusters"]), 1)
        c0 = payload["clusters"][0]
        self.assertEqual(c0["size"], 0x20)
        self.assertEqual(c0["sig_len"], 1)
        self.assertEqual(c0["matched"][0]["name"], "MyTemplate")
        self.assertEqual(c0["unmatched"][0]["addr"], 0x2000)


class TestRenderAnchorText(unittest.TestCase):
    def test_anchor_with_unmatched_targets(self):
        anchor = _fn("main", 0x1000, size=0x20, name="A")
        sib = _fn("main", 0x2000, size=0x20)
        cluster = Cluster(
            fingerprint=(0x20, ()),
            matched=(anchor,),
            unmatched=(sib,),
        )
        out = render_anchor_text(anchor, cluster)
        self.assertIn("A", out)
        self.assertIn("Unmatched propagation targets: 1", out)
        self.assertIn("0x00002000", out)

    def test_anchor_no_siblings(self):
        anchor = _fn("main", 0x1000, size=0x20, name="A")
        out = render_anchor_text(anchor, None)
        self.assertIn("no unmatched exact-sig siblings", out)


if __name__ == "__main__":
    unittest.main()
