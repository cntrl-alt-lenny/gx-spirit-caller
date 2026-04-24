"""Unit tests for tools/find_mega_cascades.py.

The BFS-based mega-cascade is subtle — bugs could either:
  - Miss indirect promotions (collapses to find_cascades)
  - Over-promote (counts functions that wouldn't actually promote
    once the wave is stepped through)
  - Loop forever on pathological graphs

Pins:

  - Depth-1 chain: X → A (naming X promotes A, A is leaf). Direct
    cascade 1, indirect 0, depth 1. Same as find_cascades.
  - Depth-2 chain: X → A → B. Naming X promotes A; naming A in
    turn promotes B. Direct 1, indirect 1, depth 2.
  - Depth-3 chain: X → A → B → C. Full transitive closure.
  - Diamond: X → {A, B} both directly; each of A, B → C. Direct 2,
    indirect 1 (C is counted once even though two paths reach it).
  - Gate: A's promotion only fires if BOTH X and Y are named.
    Naming X alone via mega-cascade-for-X does NOT promote A (Y
    is still placeholder). Atomic semantics preserved.
  - Already-matched callers excluded from the cascade.
  - Depth cap: max_depth=2 truncates depth-3+ cascades.
  - Ranking: sort by total weight desc, then size asc.
  - Single-target render includes direct + indirect sections.
"""

from __future__ import annotations

import sys
import unittest
from pathlib import Path

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

from analyze_symbols import (  # noqa: E402
    CallGraph,
    ModuleData,
    Symbol,
)
from find_mega_cascades import (  # noqa: E402
    MegaCascade,
    _would_promote,
    mega_cascade_for_target,
    rank_mega_cascades,
    render_ranked_markdown,
    render_single_target,
)


def _func(
    module: str, addr: int, size: int,
    name: str | None = None,
) -> Symbol:
    if name is None:
        name = f"func_{addr:08x}"
    return Symbol(
        name=name, module=module, addr=addr, size=size,
        type="function", mode="arm",
    )


def _module(name: str, syms: list[Symbol]) -> ModuleData:
    md = ModuleData(name=name)
    md.symbols = list(syms)
    md.by_addr = {s.addr: s for s in syms}
    md.by_addr_sorted = sorted(syms, key=lambda s: s.addr)
    return md


def _build_chain(pairs: list[tuple[int, int]]) -> CallGraph:
    """pairs: list of (caller_addr, callee_addr) in module 'main'."""
    g = CallGraph()
    for caller, callee in pairs:
        g.edges_call[("main", caller)].add(("main", callee))
    return g


class TestWouldPromote(unittest.TestCase):
    """Core gate function — every promotion decision routes through
    here."""

    def test_all_named_including_hypothesised(self):
        caller = _func("main", 0x1000, size=0x20)
        callees = {("main", 0x2000), ("main", 0x3000)}
        named_callee_a = _func(
            "main", 0x2000, size=0x10, name="OS_Named",
        )
        placeholder_b = _func("main", 0x3000, size=0x10)
        modules = {"main": _module("main", [
            caller, named_callee_a, placeholder_b,
        ])}
        # Hypothesise placeholder_b becomes named:
        named_set = {("main", 0x3000)}
        self.assertTrue(_would_promote(
            caller, callees, named_set, modules,
        ))

    def test_unnamed_callee_blocks(self):
        caller = _func("main", 0x1000, size=0x20)
        callees = {("main", 0x2000), ("main", 0x3000)}
        named = _func("main", 0x2000, size=0x10, name="OS_Named")
        placeholder = _func("main", 0x3000, size=0x10)
        modules = {"main": _module("main", [caller, named, placeholder])}
        # Empty named_set (don't hypothesise any rename):
        self.assertFalse(_would_promote(
            caller, callees, set(), modules,
        ))

    def test_size_over_cap_rejected(self):
        caller = _func("main", 0x1000, size=0x100)  # > 0x80
        callee = _func("main", 0x2000, size=0x10, name="X")
        modules = {"main": _module("main", [caller, callee])}
        self.assertFalse(_would_promote(
            caller, {("main", 0x2000)}, set(), modules,
        ))

    def test_already_named_caller_rejected(self):
        # caller is already named → tier is `named`, not a cascade
        # candidate.
        caller = _func("main", 0x1000, size=0x20, name="ExistingName")
        callee = _func("main", 0x2000, size=0x10, name="X")
        modules = {"main": _module("main", [caller, callee])}
        self.assertFalse(_would_promote(
            caller, {("main", 0x2000)}, set(), modules,
        ))

    def test_sinit_caller_rejected(self):
        caller = _func(
            "main", 0x1000, size=0x20, name="__sinit_foo",
        )
        callee = _func("main", 0x2000, size=0x10, name="X")
        modules = {"main": _module("main", [caller, callee])}
        self.assertFalse(_would_promote(
            caller, {("main", 0x2000)}, set(), modules,
        ))

    def test_leaf_caller_rejected(self):
        # No callees → tier would be trivial/easy by size, not
        # medium. Not a mega-cascade target.
        caller = _func("main", 0x1000, size=0x20)
        modules = {"main": _module("main", [caller])}
        self.assertFalse(_would_promote(
            caller, set(), set(), modules,
        ))


class TestMegaCascadeChains(unittest.TestCase):
    def test_depth_1_chain_matches_direct_only(self):
        # X (target, small) → A (caller, size-OK, no other callees)
        #   Naming X promotes A. Total = 1, direct = 1, indirect = 0.
        target = _func("main", 0x2000, size=0x8)
        caller_a = _func("main", 0x1000, size=0x20)
        modules = {"main": _module("main", [target, caller_a])}
        graph = _build_chain([(0x1000, 0x2000)])

        mc = mega_cascade_for_target(target, modules, graph, matched={})
        self.assertEqual(mc.weight, 1)
        self.assertEqual(len(mc.direct), 1)
        self.assertEqual(len(mc.indirect), 0)
        self.assertEqual(mc.depth, 1)
        self.assertIn(("main", 0x1000), mc.direct)

    def test_depth_2_chain(self):
        # X → A → B. Both A and B size ≤ 0x80.
        # Naming X promotes A. Then naming A promotes B.
        # Total = 2 (A + B), direct = 1 (A), indirect = 1 (B),
        # depth = 2.
        target = _func("main", 0x3000, size=0x8)
        caller_a = _func("main", 0x2000, size=0x20)
        caller_b = _func("main", 0x1000, size=0x20)
        modules = {"main": _module("main", [
            target, caller_a, caller_b,
        ])}
        graph = _build_chain([
            (0x2000, 0x3000),
            (0x1000, 0x2000),
        ])

        mc = mega_cascade_for_target(target, modules, graph, matched={})
        self.assertEqual(mc.weight, 2)
        self.assertEqual(mc.direct, frozenset({("main", 0x2000)}))
        self.assertEqual(mc.indirect, frozenset({("main", 0x1000)}))
        self.assertEqual(mc.depth, 2)

    def test_depth_3_chain(self):
        # X → A → B → C.
        target = _func("main", 0x4000, size=0x8)
        caller_a = _func("main", 0x3000, size=0x20)
        caller_b = _func("main", 0x2000, size=0x20)
        caller_c = _func("main", 0x1000, size=0x20)
        modules = {"main": _module("main", [
            target, caller_a, caller_b, caller_c,
        ])}
        graph = _build_chain([
            (0x3000, 0x4000),
            (0x2000, 0x3000),
            (0x1000, 0x2000),
        ])

        mc = mega_cascade_for_target(target, modules, graph, matched={})
        self.assertEqual(mc.weight, 3)
        self.assertEqual(mc.direct, frozenset({("main", 0x3000)}))
        self.assertEqual(
            mc.indirect,
            frozenset({("main", 0x2000), ("main", 0x1000)}),
        )
        self.assertEqual(mc.depth, 3)

    def test_diamond_deduplicates_at_merge_point(self):
        # X promotes A and B directly. Both A and B point at C;
        # C needs BOTH A and B named. C is counted once in total.
        target = _func("main", 0x5000, size=0x8)
        a = _func("main", 0x3000, size=0x20)
        b = _func("main", 0x4000, size=0x20)
        c = _func("main", 0x1000, size=0x20)
        modules = {"main": _module("main", [target, a, b, c])}
        graph = _build_chain([
            (0x3000, 0x5000),  # A → target
            (0x4000, 0x5000),  # B → target
            (0x1000, 0x3000),  # C → A
            (0x1000, 0x4000),  # C → B
        ])

        mc = mega_cascade_for_target(target, modules, graph, matched={})
        # Direct: A, B (both 1-step promotes).
        self.assertEqual(
            mc.direct,
            frozenset({("main", 0x3000), ("main", 0x4000)}),
        )
        # Indirect: C (2-step; promotes after both A and B named).
        self.assertEqual(mc.indirect, frozenset({("main", 0x1000)}))
        # C counted ONCE in total.
        self.assertEqual(mc.weight, 3)

    def test_gate_blocks_single_anchor_propagation(self):
        # Two-anchor gate: caller A needs BOTH X and Y named.
        # Naming X alone via mega_cascade_for_target(X) should
        # NOT promote A (Y is still placeholder).
        target_x = _func("main", 0x3000, size=0x8)
        sibling_y = _func("main", 0x4000, size=0x8)
        gated_a = _func("main", 0x1000, size=0x20)
        modules = {"main": _module("main", [
            target_x, sibling_y, gated_a,
        ])}
        graph = _build_chain([
            (0x1000, 0x3000),  # A → X
            (0x1000, 0x4000),  # A → Y (placeholder)
        ])

        mc = mega_cascade_for_target(
            target_x, modules, graph, matched={},
        )
        # A's promotion gate isn't satisfied by naming X alone.
        self.assertEqual(mc.weight, 0)
        self.assertEqual(mc.depth, 0)

    def test_matched_caller_excluded(self):
        target = _func("main", 0x2000, size=0x8)
        matched_caller = _func("main", 0x1000, size=0x20)
        modules = {"main": _module("main", [target, matched_caller])}
        graph = _build_chain([(0x1000, 0x2000)])

        mc = mega_cascade_for_target(
            target, modules, graph,
            matched={"main": [(0x1000, 0x1020)]},
        )
        self.assertEqual(mc.weight, 0)

    def test_max_depth_truncates(self):
        # 5-deep chain; cap at max_depth=2.
        addrs = [0x1000, 0x2000, 0x3000, 0x4000, 0x5000, 0x6000]
        target = _func("main", addrs[-1], size=0x8)
        others = [_func("main", a, size=0x20) for a in addrs[:-1]]
        modules = {"main": _module("main", [target] + others)}
        # Chain: 0x1000 → 0x2000 → ... → 0x6000
        graph = _build_chain([
            (addrs[i], addrs[i + 1]) for i in range(len(addrs) - 1)
        ])

        mc = mega_cascade_for_target(
            target, modules, graph, matched={}, max_depth=2,
        )
        # Depth=2 means target + 1 direct + 1 indirect only.
        self.assertLessEqual(mc.depth, 2)
        self.assertEqual(mc.weight, 2)


class TestRankMegaCascades(unittest.TestCase):
    def test_sort_order_weight_then_size(self):
        # Two anchors with weight=1; smaller-size wins.
        small = _func("main", 0x3000, size=0x4)
        big = _func("main", 0x4000, size=0x40)
        caller_s = _func("main", 0x1000, size=0x20)
        caller_b = _func("main", 0x2000, size=0x20)
        modules = {"main": _module("main", [
            small, big, caller_s, caller_b,
        ])}
        graph = _build_chain([
            (0x1000, 0x3000),
            (0x2000, 0x4000),
        ])

        ranked = rank_mega_cascades(modules, graph, matched={})
        self.assertEqual(ranked[0].anchor.addr, 0x3000)
        self.assertEqual(ranked[1].anchor.addr, 0x4000)

    def test_min_depth_filter(self):
        # One depth-1 and one depth-2 anchor. min_depth=2 drops the
        # depth-1 one.
        #
        # depth-1: X → A (single promotion, no chain)
        # depth-2: Y → P → Q
        x = _func("main", 0x2000, size=0x8)
        a = _func("main", 0x1000, size=0x20)
        y = _func("main", 0x5000, size=0x8)
        p = _func("main", 0x4000, size=0x20)
        q = _func("main", 0x3000, size=0x20)
        modules = {"main": _module("main", [x, a, y, p, q])}
        graph = _build_chain([
            (0x1000, 0x2000),
            (0x4000, 0x5000),
            (0x3000, 0x4000),
        ])

        ranked_all = rank_mega_cascades(modules, graph, matched={})
        addrs_all = {m.anchor.addr for m in ranked_all}
        self.assertIn(0x2000, addrs_all)
        self.assertIn(0x5000, addrs_all)

        ranked_deep = rank_mega_cascades(
            modules, graph, matched={}, min_depth=2,
        )
        addrs_deep = {m.anchor.addr for m in ranked_deep}
        self.assertNotIn(0x2000, addrs_deep)
        self.assertIn(0x5000, addrs_deep)


class TestRendering(unittest.TestCase):
    def test_empty_ranked_message(self):
        md = render_ranked_markdown([], version="eur", top_n=10)
        self.assertIn("No mega-cascades found", md)

    def test_ranked_table_columns(self):
        target = _func("main", 0x2000, size=0x8)
        mc = MegaCascade(
            anchor=target,
            direct=frozenset({("main", 0x1000)}),
            indirect=frozenset({("main", 0x0500)}),
            total=frozenset({("main", 0x1000), ("main", 0x0500)}),
            depth=2,
        )
        md = render_ranked_markdown([mc], version="eur", top_n=10)
        self.assertIn("Total | Direct | Indirect | Depth", md)
        self.assertIn("**2**", md)  # weight (total) column bolded
        self.assertIn("`func_00002000`", md)

    def test_single_target_shows_direct_and_indirect_sections(self):
        target = _func("main", 0x2000, size=0x8)
        direct_caller = _func("main", 0x1000, size=0x20)
        indirect_caller = _func("main", 0x0500, size=0x20)
        modules = {"main": _module("main", [
            target, direct_caller, indirect_caller,
        ])}
        mc = MegaCascade(
            anchor=target,
            direct=frozenset({("main", 0x1000)}),
            indirect=frozenset({("main", 0x0500)}),
            total=frozenset({("main", 0x1000), ("main", 0x0500)}),
            depth=2,
        )
        out = render_single_target(mc, modules)
        self.assertIn("Direct (1-step) promotions", out)
        self.assertIn("Indirect (depth-2+) promotions", out)
        self.assertIn("func_00001000", out)
        self.assertIn("func_00000500", out)

    def test_single_target_empty_cascade(self):
        target = _func("main", 0x1000, size=0x8)
        modules = {"main": _module("main", [target])}
        mc = MegaCascade(
            anchor=target,
            direct=frozenset(),
            indirect=frozenset(),
            total=frozenset(),
            depth=0,
        )
        out = render_single_target(mc, modules)
        self.assertIn("No `hard → medium` promotions", out)


class TestMegaCascadeDataclass(unittest.TestCase):
    def test_weight_property(self):
        target = _func("main", 0x1000, size=0x8)
        mc = MegaCascade(
            anchor=target,
            direct=frozenset({("main", 0x2000)}),
            indirect=frozenset({("main", 0x3000)}),
            total=frozenset({("main", 0x2000), ("main", 0x3000)}),
            depth=2,
        )
        self.assertEqual(mc.weight, 2)

    def test_is_frozen(self):
        # Frozen dataclass — mutation raises. Callers treat
        # MegaCascade as an immutable snapshot.
        import dataclasses
        target = _func("main", 0x1000, size=0x8)
        mc = MegaCascade(
            anchor=target, direct=frozenset(),
            indirect=frozenset(), total=frozenset(), depth=0,
        )
        with self.assertRaises(dataclasses.FrozenInstanceError):
            mc.depth = 99  # type: ignore[misc]


if __name__ == "__main__":
    unittest.main()
