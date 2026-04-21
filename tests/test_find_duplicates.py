"""Unit tests for tools/find_duplicates.py.

Covers the pure fingerprint + clustering logic. Skips the CLI and
filesystem-output paths (they're exercised by smoke-test invocations
in the PR body).
"""

from __future__ import annotations

import sys
import unittest
from pathlib import Path

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

from analyze_symbols import CallGraph, ModuleData, Symbol  # noqa: E402
from find_duplicates import (  # noqa: E402
    Fingerprint,
    compute_fingerprint,
    find_duplicate_clusters,
)


def sym(name: str, module: str, addr: int, size: int = 0x10) -> Symbol:
    return Symbol(name=name, module=module, addr=addr, size=size,
                  type="function", mode="arm")


def make_module(name: str, symbols: list[Symbol]) -> ModuleData:
    return ModuleData(
        name=name, symbols=symbols, relocs=[],
        by_addr={s.addr: s for s in symbols},
        by_addr_sorted=sorted(symbols, key=lambda s: s.addr),
    )


class TestComputeFingerprint(unittest.TestCase):
    def test_leaf_has_empty_modules(self):
        # No outgoing calls — callee_modules must be empty.
        s = sym("func_a", "ov005", 0x100, size=0x4)
        graph = CallGraph()
        fp = compute_fingerprint(s, graph)
        self.assertEqual(fp.size, 0x4)
        self.assertEqual(fp.out_degree, 0)
        self.assertEqual(fp.callee_modules, ())
        self.assertIsNone(fp.src_module)

    def test_single_call_single_module(self):
        s = sym("func_a", "ov005", 0x100, size=0x10)
        graph = CallGraph()
        graph.edges_call[("ov005", 0x100)].add(("main", 0x200))
        fp = compute_fingerprint(s, graph)
        self.assertEqual(fp.out_degree, 1)
        self.assertEqual(fp.callee_modules, ("main",))

    def test_multi_module_callees_sorted(self):
        # Three calls into two different modules → callee_modules
        # must be sorted alphabetically for deterministic hashing.
        s = sym("func_a", "ov005", 0x100, size=0x20)
        graph = CallGraph()
        graph.edges_call[("ov005", 0x100)].add(("main", 0x200))
        graph.edges_call[("ov005", 0x100)].add(("ov006", 0x300))
        graph.edges_call[("ov005", 0x100)].add(("main", 0x400))
        fp = compute_fingerprint(s, graph)
        self.assertEqual(fp.out_degree, 3)
        self.assertEqual(fp.callee_modules, ("main", "ov006"))

    def test_fingerprint_is_hashable(self):
        # Used as a dict key in find_duplicate_clusters — must hash.
        fp = Fingerprint(size=4, out_degree=0, callee_modules=())
        d = {fp: 1}
        self.assertIn(fp, d)


class TestFindDuplicateClusters(unittest.TestCase):
    def _build(self, modules: dict[str, ModuleData], edges=None) -> CallGraph:
        g = CallGraph()
        for (src, callees) in (edges or {}).items():
            for c in callees:
                g.edges_call[src].add(c)
        return g

    def test_min_count_threshold(self):
        # 3 same-shape leaves — below default threshold of 4.
        mod = make_module("ov005", [
            sym(f"func_{i}", "ov005", 0x100 + i * 4, size=0x4) for i in range(3)
        ])
        clusters = find_duplicate_clusters({"ov005": mod}, CallGraph())
        self.assertEqual(clusters, [])

    def test_cluster_formed_at_threshold(self):
        mod = make_module("ov005", [
            sym(f"func_{i}", "ov005", 0x100 + i * 4, size=0x4) for i in range(4)
        ])
        clusters = find_duplicate_clusters({"ov005": mod}, CallGraph())
        self.assertEqual(len(clusters), 1)
        self.assertEqual(clusters[0].count, 4)
        self.assertEqual(clusters[0].fingerprint.size, 0x4)

    def test_different_sizes_dont_cluster(self):
        mod = make_module("ov005", [
            sym("func_a", "ov005", 0x100, size=0x4),
            sym("func_b", "ov005", 0x104, size=0x4),
            sym("func_c", "ov005", 0x108, size=0x4),
            sym("func_d", "ov005", 0x10c, size=0x8),     # different size
        ])
        clusters = find_duplicate_clusters({"ov005": mod}, CallGraph())
        # Only 3 of size-4 and 1 of size-8, none reaches min_count.
        self.assertEqual(clusters, [])

    def test_cross_module_cluster(self):
        # Same shape (size=0x4, out=0) in three different overlays —
        # in cross-module mode (the default), they merge.
        syms = []
        for mod_name in ("ov005", "ov006", "ov007", "ov008"):
            syms.append(sym(f"func_{mod_name}", mod_name, 0x100, size=0x4))
        modules = {
            m.module: make_module(m.module, [m])
            for m in syms
        }
        clusters = find_duplicate_clusters(modules, CallGraph())
        self.assertEqual(len(clusters), 1)
        c = clusters[0]
        self.assertEqual(c.count, 4)
        self.assertTrue(c.is_cross_module)
        self.assertEqual(
            c.modules_touched,
            {"ov005", "ov006", "ov007", "ov008"},
        )

    def test_same_module_only_splits_clusters(self):
        # Same as above but with --same-module-only — each overlay
        # becomes its own cluster, and at 1 member each, none hit the
        # min_count.
        syms = []
        for mod_name in ("ov005", "ov006", "ov007", "ov008"):
            syms.append(sym(f"func_{mod_name}", mod_name, 0x100, size=0x4))
        modules = {
            m.module: make_module(m.module, [m])
            for m in syms
        }
        clusters = find_duplicate_clusters(
            modules, CallGraph(), same_module_only=True,
        )
        self.assertEqual(clusters, [])

    def test_same_module_only_populates_src_module(self):
        mod = make_module("ov005", [
            sym(f"func_{i}", "ov005", 0x100 + i * 4, size=0x4) for i in range(4)
        ])
        clusters = find_duplicate_clusters(
            {"ov005": mod}, CallGraph(), same_module_only=True,
        )
        self.assertEqual(len(clusters), 1)
        self.assertEqual(clusters[0].fingerprint.src_module, "ov005")

    def test_zero_size_excluded(self):
        # _unk placeholders have size=0 and must not cluster — no
        # stable shape to match against.
        mod = make_module("ov004", [
            sym(f"func_unk_{i}", "ov004", 0x100 + i * 4, size=0) for i in range(5)
        ])
        clusters = find_duplicate_clusters({"ov004": mod}, CallGraph())
        self.assertEqual(clusters, [])

    def test_local_labels_excluded(self):
        # .L_* assembler labels aren't real function entries.
        mod = make_module("main", [
            sym(f".L_{0x100+i*4:08x}", "main", 0x100 + i * 4, size=0x4)
            for i in range(5)
        ])
        clusters = find_duplicate_clusters({"main": mod}, CallGraph())
        self.assertEqual(clusters, [])

    def test_leverage_sort_order(self):
        # Smaller size with same count = higher leverage = ranked first.
        s4  = [sym(f"a_{i}", "m",    0x100 + i * 4,  size=0x4) for i in range(4)]
        s10 = [sym(f"b_{i}", "ov002",0x500 + i * 10, size=0x10) for i in range(4)]
        modules = {
            "m":     make_module("m",     s4),
            "ov002": make_module("ov002", s10),
        }
        clusters = find_duplicate_clusters(modules, CallGraph())
        self.assertEqual(len(clusters), 2)
        # Higher leverage first.
        self.assertEqual(clusters[0].fingerprint.size, 0x4)
        self.assertEqual(clusters[1].fingerprint.size, 0x10)


if __name__ == "__main__":
    unittest.main()
