"""Unit tests for tools/ci_format_rename_cascades.py.

This tool posts on every decomp PR. Regressions would either:
  - Miss renames (false negative — PR ships without cascade signal)
  - Hallucinate renames (noise in the PR comment)
  - Misattribute cascades (show wrong caller count)

Pinning:

  - detect_renames: only placeholder → real transitions count
  - detect_renames: already-named in both, placeholder in both,
    missing-in-before, missing-in-after all filtered
  - compute_impacts: uses base-graph (pending cascades, not
    post-rename empty state)
  - render_markdown: empty-renames case emits a polite no-op
  - render_markdown: with-cascade + without-cascade split
  - render_markdown: rows truncated at top_rows
  - render_markdown: truncated caller samples capped + "+N more"
  - FOOTER_MARKER always present (upsert depends on it)
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
from ci_format_rename_cascades import (  # noqa: E402
    FOOTER_MARKER,
    Rename,
    RenameImpact,
    compute_impacts,
    detect_renames,
    render_markdown,
)


def _func(module: str, addr: int, size: int = 0x10,
          name: str | None = None) -> Symbol:
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


class TestDetectRenames(unittest.TestCase):
    def test_placeholder_to_real_counts(self):
        before = _func("main", 0x02000100, name="func_02000100")
        after = _func("main", 0x02000100, name="OS_GetTick")
        before_mods = {"main": _module("main", [before])}
        after_mods = {"main": _module("main", [after])}
        renames = detect_renames(before_mods, after_mods)
        self.assertEqual(len(renames), 1)
        self.assertEqual(renames[0].old_name, "func_02000100")
        self.assertEqual(renames[0].new_name, "OS_GetTick")

    def test_already_named_in_base_skipped(self):
        # If the symbol was already named on base, the PR isn't
        # "renaming from placeholder" — it's a rename-rename, which
        # we don't track (rarely useful, noisy in PR comments).
        before = _func("main", 0x02000100, name="OS_GetTick")
        after = _func("main", 0x02000100, name="OS_GetSystemTick")
        before_mods = {"main": _module("main", [before])}
        after_mods = {"main": _module("main", [after])}
        renames = detect_renames(before_mods, after_mods)
        self.assertEqual(renames, [])

    def test_still_placeholder_skipped(self):
        # Address-suffix drift or cosmetic placeholder edit. Not a
        # real rename.
        before = _func("main", 0x02000100, name="func_02000100")
        after = _func("main", 0x02000100, name="func_200100")  # no-op-ish
        before_mods = {"main": _module("main", [before])}
        after_mods = {"main": _module("main", [after])}
        renames = detect_renames(before_mods, after_mods)
        self.assertEqual(renames, [])

    def test_missing_in_base_skipped(self):
        # New symbol in after-state (unusual — typically from a
        # structural config change). Don't flag as "rename".
        after = _func("main", 0x02000100, name="OS_GetTick")
        before_mods = {"main": _module("main", [])}
        after_mods = {"main": _module("main", [after])}
        renames = detect_renames(before_mods, after_mods)
        self.assertEqual(renames, [])

    def test_missing_module_in_before_tolerated(self):
        # If the module didn't exist on base (unlikely but possible
        # for structural config moves), skip silently.
        after = _func("main", 0x02000100, name="OS_GetTick")
        renames = detect_renames({}, {"main": _module("main", [after])})
        self.assertEqual(renames, [])

    def test_non_function_symbols_skipped(self):
        # Only `kind:function` symbols participate in the cascade
        # rule. Data symbols can be renamed too, but cascades only
        # track function-to-function relationships.
        data_before = Symbol(
            name="data_02000100", module="main", addr=0x02000100,
            size=0x4, type="data", mode="any",
        )
        data_after = Symbol(
            name="OSi_HeapState", module="main", addr=0x02000100,
            size=0x4, type="data", mode="any",
        )
        renames = detect_renames(
            {"main": _module("main", [data_before])},
            {"main": _module("main", [data_after])},
        )
        self.assertEqual(renames, [])

    def test_sort_order_deterministic(self):
        # Multiple renames across modules/addresses — output must
        # be deterministic for reproducible PR comments.
        before = {
            "main": _module("main", [
                _func("main", 0x02000200, name="func_02000200"),
                _func("main", 0x02000100, name="func_02000100"),
            ]),
            "ov005": _module("ov005", [
                _func("ov005", 0x021b0000, name="func_ov005_021b0000"),
            ]),
        }
        after = {
            "main": _module("main", [
                _func("main", 0x02000200, name="Bar"),
                _func("main", 0x02000100, name="Foo"),
            ]),
            "ov005": _module("ov005", [
                _func("ov005", 0x021b0000, name="Baz"),
            ]),
        }
        renames = detect_renames(before, after)
        self.assertEqual(
            [(r.module, r.addr) for r in renames],
            [("main", 0x02000100), ("main", 0x02000200),
             ("ov005", 0x021b0000)],
        )


class TestComputeImpacts(unittest.TestCase):
    """End-to-end cascade computation on synthetic renames."""

    def test_rename_with_real_cascade(self):
        # Caller (0x1000, 32B) calls target (0x2000, 0x10).
        # Naming the target promotes caller hard → medium.
        before_target = _func("main", 0x02002000, name="func_02002000")
        after_target = _func("main", 0x02002000, name="OS_GetTick")
        caller = _func("main", 0x02001000, size=0x20)
        before_mods = {"main": _module("main", [before_target, caller])}
        after_mods = {"main": _module("main", [after_target, caller])}

        graph = CallGraph()
        graph.edges_call[("main", 0x02001000)].add(("main", 0x02002000))

        renames = detect_renames(before_mods, after_mods)
        impacts = compute_impacts(renames, before_mods, graph, {})
        self.assertEqual(len(impacts), 1)
        self.assertEqual(impacts[0].weight, 1)
        self.assertEqual(
            impacts[0].promoted, frozenset({("main", 0x02001000)}),
        )

    def test_rename_without_cascade(self):
        # Rename a function with no callers of size-≤0x80.
        before_target = _func("main", 0x02002000, name="func_02002000")
        after_target = _func("main", 0x02002000, name="OS_GetTick")
        big_caller = _func("main", 0x02001000, size=0x100)  # > 0x80 cap
        before_mods = {"main": _module(
            "main", [before_target, big_caller])}
        after_mods = {"main": _module(
            "main", [after_target, big_caller])}

        graph = CallGraph()
        graph.edges_call[("main", 0x02001000)].add(("main", 0x02002000))

        renames = detect_renames(before_mods, after_mods)
        impacts = compute_impacts(renames, before_mods, graph, {})
        self.assertEqual(len(impacts), 1)
        self.assertEqual(impacts[0].weight, 0)


class TestRenderMarkdown(unittest.TestCase):
    def test_empty_renames_polite_noop(self):
        md = render_markdown([])
        self.assertIn("No placeholder → real renames", md)
        # Footer always present for upsert to find.
        self.assertIn(FOOTER_MARKER, md)

    def test_with_cascade_section(self):
        r = Rename(
            module="main", addr=0x02002000,
            old_name="func_02002000", new_name="OS_GetTick",
        )
        imp = RenameImpact(
            rename=r,
            promoted=frozenset({("main", 0x02001000)}),
        )
        md = render_markdown([imp])
        self.assertIn("Renames with cascades", md)
        self.assertIn("`OS_GetTick`", md)
        self.assertIn("**1**", md)  # weight column
        self.assertIn("`main|0x02001000`", md)
        self.assertIn(FOOTER_MARKER, md)

    def test_renames_summary_counts_accurate(self):
        # 2 renames: one with cascade, one without. Headline counts
        # must reflect both.
        r_with = Rename(
            module="main", addr=0x02002000,
            old_name="func_02002000", new_name="OS_A",
        )
        r_without = Rename(
            module="main", addr=0x02003000,
            old_name="func_02003000", new_name="OS_B",
        )
        impacts = [
            RenameImpact(
                rename=r_with,
                promoted=frozenset({("main", 0x1000), ("main", 0x1100)}),
            ),
            RenameImpact(rename=r_without, promoted=frozenset()),
        ]
        md = render_markdown(impacts)
        self.assertIn("This PR renames **2** placeholder", md)
        self.assertIn("1 of them had a pending", md)
        self.assertIn("**2** caller(s)", md)

    def test_without_cascade_section_renders_when_present(self):
        r = Rename(
            module="main", addr=0x02002000,
            old_name="func_02002000", new_name="OS_GetTick",
        )
        imp = RenameImpact(rename=r, promoted=frozenset())
        md = render_markdown([imp])
        self.assertIn("Renames without cascades", md)
        self.assertIn(
            "don't unlock any `hard → medium` promotion", md,
        )

    def test_truncates_rows_at_top_n(self):
        # 20 renames with cascades; render with top_rows=5.
        impacts = []
        for i in range(20):
            addr = 0x02000000 + i * 0x100
            r = Rename(
                module="main", addr=addr,
                old_name=f"func_{addr:08x}",
                new_name=f"OS_Fn{i:02d}",
            )
            impacts.append(RenameImpact(
                rename=r,
                promoted=frozenset({("main", addr + 0x1000)}),
            ))
        md = render_markdown(impacts, top_rows=5)
        # 5 truncation line references +15 remaining.
        self.assertIn("+15 more", md)

    def test_caller_sample_truncates_with_plus_n(self):
        # 10 promoted callers, sample of 3, expect "+7" tail.
        r = Rename(
            module="main", addr=0x02002000,
            old_name="func_02002000", new_name="OS_GetTick",
        )
        promoted = frozenset(
            ("main", 0x02001000 + i * 0x100) for i in range(10)
        )
        imp = RenameImpact(rename=r, promoted=promoted)
        md = render_markdown([imp], top_callers_per_rename=3)
        self.assertIn("…(+7)", md)


if __name__ == "__main__":
    unittest.main()
