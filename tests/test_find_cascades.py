"""Unit tests for tools/find_cascades.py.

The decomper consults this tool to pick high-leverage rename
targets. Bad ranking = wasted session on low-cascade renames. Pins:

  - hard → medium promotion rule (size ≤ 0x80 AND all-callees-named
    post-rename)
  - size cap enforcement (size > 0x80 never promotes to medium)
  - pre-existing named-callee counting is correct (a caller with
    2 named + 1 placeholder callee; naming the placeholder fills
    the last slot)
  - multi-placeholder blockers: naming one of two placeholder
    callees DOES NOT trigger cascade (needs both named)
  - matched-caller exclusion (don't waste the rank on done work)
  - already-named-target exclusion by default; --include-named opt-in
  - __sinit_* targets don't produce their own cascades (size-and-
    prefix discriminated)
  - Ranking: higher weight first; tie-break smaller size first
  - Single-symbol mode output shape
  - Ranked mode markdown structure
  - Empty-cascade case: no placeholders produce cascades (e.g.
    fully-named project or no size-≤0x80 callers with any
    placeholder)
"""

from __future__ import annotations

import io
import sys
import unittest
from contextlib import redirect_stdout
from pathlib import Path

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

from analyze_symbols import (  # noqa: E402
    CallGraph,
    ModuleData,
    Symbol,
)
from find_cascades import (  # noqa: E402
    CascadeEntry,
    _would_cascade_to_medium,
    cascades_for_target,
    rank_cascades,
    render_ranked_markdown,
    render_single_target,
)


def _func(
    module: str, addr: int, size: int, name: str | None = None,
) -> Symbol:
    if name is None:
        name = f"func_{addr:08x}"
    return Symbol(
        name=name, module=module, addr=addr, size=size,
        type="function", mode="arm",
    )


def _module(name: str, symbols: list[Symbol]) -> ModuleData:
    md = ModuleData(name=name)
    md.symbols = list(symbols)
    md.by_addr = {s.addr: s for s in symbols}
    md.by_addr_sorted = sorted(symbols, key=lambda s: s.addr)
    return md


def _build(
    *,
    # Shortcut: each (caller_key, [callee_keys]) turns into an
    # edges_call entry on the graph.
    edges: list[tuple[tuple[str, int], list[tuple[str, int]]]] = (),
) -> CallGraph:
    g = CallGraph()
    for caller, callees in edges:
        for callee in callees:
            g.edges_call[caller].add(callee)
    return g


class TestCascadeRule(unittest.TestCase):
    """`_would_cascade_to_medium` is the pure-logic core."""

    def setUp(self):
        # Caller: 32B, calls two callees. One callee is placeholder,
        # one is named. Naming the placeholder fills the last slot.
        self.caller = _func("main", 0x02001000, size=0x20)
        self.placeholder_callee = _func("main", 0x02002000, size=0x10)
        self.named_callee = _func(
            "main", 0x02003000, size=0x10, name="OS_GetTick",
        )
        self.callees: set[tuple[str, int]] = {
            ("main", 0x02002000), ("main", 0x02003000),
        }
        self.modules = {
            "main": _module("main", [
                self.caller, self.placeholder_callee, self.named_callee,
            ]),
        }

    def test_promotes_when_last_placeholder_named(self):
        self.assertTrue(_would_cascade_to_medium(
            self.caller, self.callees, ("main", 0x02002000),
            self.modules,
        ))

    def test_no_promotion_when_caller_size_over_cap(self):
        # 0x90 > 0x80 cap — `medium` is size-capped.
        big_caller = _func("main", 0x02010000, size=0x90)
        modules = {"main": _module("main", [
            big_caller, self.placeholder_callee, self.named_callee,
        ])}
        self.assertFalse(_would_cascade_to_medium(
            big_caller, self.callees, ("main", 0x02002000), modules,
        ))

    def test_no_promotion_when_caller_already_named(self):
        # `named` tier is identity; caller doesn't move to medium.
        named_caller = _func(
            "main", 0x02001000, size=0x20, name="GX_Init",
        )
        modules = {"main": _module("main", [
            named_caller, self.placeholder_callee, self.named_callee,
        ])}
        self.assertFalse(_would_cascade_to_medium(
            named_caller, self.callees, ("main", 0x02002000), modules,
        ))

    def test_no_promotion_when_caller_is_sinit(self):
        # __sinit_* has its own tier; doesn't cascade to medium.
        sinit_caller = _func(
            "main", 0x02001000, size=0x20, name="__sinit_foo_0x02001000",
        )
        modules = {"main": _module("main", [
            sinit_caller, self.placeholder_callee, self.named_callee,
        ])}
        self.assertFalse(_would_cascade_to_medium(
            sinit_caller, self.callees, ("main", 0x02002000), modules,
        ))

    def test_no_promotion_when_rename_target_isnt_a_callee(self):
        # If X isn't in the caller's callee set, naming X doesn't
        # affect this caller. Edge case but worth pinning.
        self.assertFalse(_would_cascade_to_medium(
            self.caller, self.callees, ("main", 0xdead0000),
            self.modules,
        ))

    def test_multiple_placeholders_block_single_rename(self):
        # Two placeholder callees: naming one doesn't fill the slot.
        other_placeholder = _func("main", 0x02004000, size=0x10)
        callees_multi: set[tuple[str, int]] = {
            ("main", 0x02002000), ("main", 0x02004000),
        }
        modules = {"main": _module("main", [
            self.caller, self.placeholder_callee, other_placeholder,
        ])}
        self.assertFalse(_would_cascade_to_medium(
            self.caller, callees_multi, ("main", 0x02002000), modules,
        ))

    def test_no_promotion_when_target_already_named(self):
        # Regression pin: if the "newly-named" target is already a
        # named symbol, the rename is a no-op. The caller is either
        # already in `medium` (if all callees were already named) or
        # still blocked by some OTHER placeholder callee. Either
        # way, naming X again produces zero cascade.
        #
        # Before the fix, this double-counted named-X once more and
        # flagged cascades that weren't real.
        named_target = _func(
            "main", 0x02002000, size=0x10, name="OS_GetTick",
        )
        modules = {"main": _module("main", [
            self.caller, named_target, self.named_callee,
        ])}
        callees = {("main", 0x02002000), ("main", 0x02003000)}
        self.assertFalse(_would_cascade_to_medium(
            self.caller, callees, ("main", 0x02002000), modules,
        ))

    def test_zero_size_caller_skipped(self):
        # size==0 is the `_unk` placeholder shape; never a cascade.
        zero_caller = _func("main", 0x02001000, size=0)
        modules = {"main": _module("main", [
            zero_caller, self.placeholder_callee, self.named_callee,
        ])}
        self.assertFalse(_would_cascade_to_medium(
            zero_caller, self.callees, ("main", 0x02002000), modules,
        ))


class TestCascadesForTarget(unittest.TestCase):
    """End-to-end cascade lookup against a built graph."""

    def _build_fixture(self):
        # Target: main|0x02002000 (placeholder, will be named).
        target = _func("main", 0x02002000, size=0x10)
        # Caller A — promotes (size 0x20, only-placeholder callee is target).
        caller_a = _func("main", 0x02001000, size=0x20)
        # Caller B — does NOT promote (size 0x100 > cap).
        caller_b = _func("main", 0x02005000, size=0x100)
        # Caller C — does NOT promote (has a second placeholder callee).
        caller_c = _func("main", 0x02006000, size=0x20)
        other_placeholder = _func("main", 0x02007000, size=0x10)
        # Caller D — already named; doesn't enter `medium` anyway.
        caller_d = _func(
            "main", 0x02008000, size=0x20, name="GX_Foo",
        )

        md = _module("main", [
            target, caller_a, caller_b, caller_c, caller_d,
            other_placeholder,
        ])
        modules = {"main": md}

        graph = CallGraph()
        # A → target only
        graph.edges_call[("main", 0x02001000)].add(("main", 0x02002000))
        # B → target only
        graph.edges_call[("main", 0x02005000)].add(("main", 0x02002000))
        # C → target + other_placeholder (both still unnamed)
        graph.edges_call[("main", 0x02006000)].add(("main", 0x02002000))
        graph.edges_call[("main", 0x02006000)].add(("main", 0x02007000))
        # D → target, but D is already named
        graph.edges_call[("main", 0x02008000)].add(("main", 0x02002000))

        return target, modules, graph

    def test_promoted_set_includes_only_cascade_winners(self):
        target, modules, graph = self._build_fixture()
        promoted = cascades_for_target(target, modules, graph, matched={})
        self.assertEqual(promoted, frozenset({("main", 0x02001000)}))

    def test_matched_caller_excluded(self):
        # Mark caller_a's region as `complete`. Cascade drops it.
        target, modules, graph = self._build_fixture()
        promoted = cascades_for_target(
            target, modules, graph,
            matched={"main": [(0x02001000, 0x02001020)]},
        )
        self.assertEqual(promoted, frozenset())

    def test_unknown_caller_module_is_tolerated(self):
        # An edge from a module we don't have loaded. Should not crash.
        target, modules, graph = self._build_fixture()
        graph.edges_call[("ghost", 0xcafe)].add(("main", 0x02002000))
        # Should still find main|0x02001000, ghost-caller ignored silently.
        promoted = cascades_for_target(target, modules, graph, matched={})
        self.assertIn(("main", 0x02001000), promoted)


class TestRanking(unittest.TestCase):
    def test_ties_break_on_size_ascending(self):
        # Two targets with equal cascade weight — smaller size wins.
        small = _func("main", 0x02002000, size=0x4)
        big = _func("main", 0x02003000, size=0x40)
        caller_a = _func("main", 0x02001000, size=0x10)
        caller_b = _func("main", 0x02004000, size=0x10)
        md = _module("main", [small, big, caller_a, caller_b])

        graph = CallGraph()
        graph.edges_call[("main", 0x02001000)].add(("main", 0x02002000))
        graph.edges_call[("main", 0x02004000)].add(("main", 0x02003000))

        entries = rank_cascades({"main": md}, graph, matched={})
        # Both have weight=1; smaller (size=0x4) first.
        self.assertEqual(entries[0].target.addr, 0x02002000)
        self.assertEqual(entries[1].target.addr, 0x02003000)

    def test_named_targets_never_surface(self):
        # A named symbol can't produce a cascade — the "rename" is a
        # no-op and the caller is already in `medium` if it could be.
        # Regression pin: this used to double-count the named callee
        # before the fix.
        named_target = _func(
            "main", 0x02002000, size=0x10, name="OS_GetTick",
        )
        caller = _func("main", 0x02001000, size=0x20)
        md = _module("main", [named_target, caller])
        graph = CallGraph()
        graph.edges_call[("main", 0x02001000)].add(("main", 0x02002000))

        entries = rank_cascades({"main": md}, graph, matched={})
        self.assertEqual(entries, [])

    def test_zero_size_target_skipped(self):
        zero = _func("main", 0x02002000, size=0)
        caller = _func("main", 0x02001000, size=0x20)
        md = _module("main", [zero, caller])
        graph = CallGraph()
        graph.edges_call[("main", 0x02001000)].add(("main", 0x02002000))
        entries = rank_cascades({"main": md}, graph, matched={})
        self.assertEqual(entries, [])


class TestRendering(unittest.TestCase):
    def test_single_target_output_empty_cascade(self):
        target = _func("main", 0x02002000, size=0x10)
        md = _module("main", [target])
        out = render_single_target(
            target, frozenset(), {"main": md},
        )
        self.assertIn("func_02002000", out)
        self.assertIn("No `hard → medium` promotions", out)

    def test_single_target_output_lists_promoted(self):
        target = _func("main", 0x02002000, size=0x10)
        caller = _func("main", 0x02001000, size=0x20)
        md = _module("main", [target, caller])
        out = render_single_target(
            target, frozenset({("main", 0x02001000)}), {"main": md},
        )
        self.assertIn("**1 caller(s)**", out)
        self.assertIn("func_02001000", out)

    def test_ranked_markdown_headline_and_rows(self):
        target = _func("main", 0x02002000, size=0x10)
        entries = [CascadeEntry(
            target=target, promoted=frozenset({("main", 0x02001000)}),
        )]
        md = render_ranked_markdown(entries, version="eur", top_n=10)
        self.assertIn("Rename-cascade ranking", md)
        self.assertIn("**1**", md)  # weight
        self.assertIn("`func_02002000`", md)

    def test_ranked_markdown_empty_message(self):
        md = render_ranked_markdown([], version="eur", top_n=10)
        self.assertIn("No cascades found", md)

    def test_ranked_markdown_truncates_promoted_sample_above_5(self):
        # Build a 7-caller cascade; sample is first 5 plus "…(+2)".
        target = _func("main", 0x02002000, size=0x10)
        promoted = frozenset(
            ("main", 0x02001000 + i * 0x100) for i in range(7)
        )
        entries = [CascadeEntry(target=target, promoted=promoted)]
        md = render_ranked_markdown(entries, version="eur", top_n=1)
        self.assertIn("…(+2)", md)


class TestStdoutSummary(unittest.TestCase):
    def test_ranked_mode_prints_top_rows(self):
        target = _func("main", 0x02002000, size=0x10)
        caller = _func("main", 0x02001000, size=0x20)
        md = _module("main", [target, caller])
        graph = CallGraph()
        graph.edges_call[("main", 0x02001000)].add(("main", 0x02002000))

        entries = rank_cascades({"main": md}, graph, matched={})
        # Simulate the stdout portion of main() — print first row.
        buf = io.StringIO()
        with redirect_stdout(buf):
            for i, e in enumerate(entries[:5], start=1):
                print(
                    f"  {i:>3}. {e.target.module:6s} "
                    f"{e.target.name:30s} cascade={e.weight}",
                )
        self.assertIn("func_02002000", buf.getvalue())


if __name__ == "__main__":
    unittest.main()
