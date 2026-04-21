"""Unit tests for tools/analyze_symbols.py.

Defensive coverage for the parsing + classification + diff paths that
every downstream tool (targets.md, bulk.json, CI tier-delta comments,
rename_symbol.py, permute.py) now depends on. Schema drift in
`config/<ver>/**/symbols.txt` or `relocs.txt` would silently corrupt
all of those — these tests catch it at import time.

Run locally:
    python -m unittest tests.test_analyze_symbols

Run via CI: wired into .github/workflows/analyzer.yml as an
`analyzer-tests` job that runs on every PR and push to main.
"""

from __future__ import annotations

import sys
import tempfile
import unittest
from pathlib import Path

# tools/ is a flat dir (not a package); put it on sys.path so the
# analyzer imports cleanly.
_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

# The import block below is deliberately comprehensive: it doubles as
# an import-time smoke test of the analyze_symbols public surface. If
# a downstream tool (targets.md, bulk.json, CI tier-delta comments,
# rename_symbol.py, permute.py) relies on a name that later gets
# removed or renamed, this module stops loading and CI fails fast —
# louder than any single test would be. F401 is waived for this file
# in ruff.toml; the "unused" imports are the point.
from analyze_symbols import (  # noqa: E402
    BulkGroup,
    CallGraph,
    MIN_BULK_COUNT,
    ModuleData,
    Reloc,
    Symbol,
    TIER_ORDER,
    _name_family,
    build_call_graph,
    build_snapshot,
    classify,
    compute_diff,
    discover_modules,
    find_bulk_groups,
    find_sinit_summary,
    load_all,
    parse_module_destination,
    parse_relocs_file,
    parse_symbols_file,
    rank_targets,
)


# --------------------------------------------------------------------------- #
# Helpers
# --------------------------------------------------------------------------- #

def make_symbol(name: str, module: str, addr: int, size: int = 0x10,
                mode: str = "arm", type_: str = "function") -> Symbol:
    """Construct a Symbol with sensible defaults."""
    return Symbol(name=name, module=module, addr=addr, size=size,
                  type=type_, mode=mode)


def make_module(name: str, symbols: list[Symbol]) -> ModuleData:
    by_addr = {s.addr: s for s in symbols}
    by_sorted = sorted(symbols, key=lambda s: s.addr)
    return ModuleData(
        name=name, symbols=symbols, relocs=[],
        by_addr=by_addr, by_addr_sorted=by_sorted,
    )


# --------------------------------------------------------------------------- #
# Primitive parsers
# --------------------------------------------------------------------------- #

class TestParseModuleDestination(unittest.TestCase):
    """Normalizes reloc `module:` values. This is the only place in
    the analyzer that translates dsd's `overlay(N)` to `ovNNN`, so if
    it silently regresses, every cross-module edge resolves wrong."""

    def test_main_passthrough(self):
        self.assertEqual(parse_module_destination("main"), "main")

    def test_itcm_passthrough(self):
        self.assertEqual(parse_module_destination("itcm"), "itcm")

    def test_dtcm_passthrough(self):
        self.assertEqual(parse_module_destination("dtcm"), "dtcm")

    def test_overlay_single_digit(self):
        self.assertEqual(parse_module_destination("overlay(5)"), "ov005")

    def test_overlay_double_digit(self):
        self.assertEqual(parse_module_destination("overlay(23)"), "ov023")

    def test_overlay_zero(self):
        self.assertEqual(parse_module_destination("overlay(0)"), "ov000")

    def test_unknown_passthrough(self):
        # Unrecognised module names pass through unchanged — the
        # analyzer will then fail to resolve the reloc, which is the
        # correct behaviour (better than silently renaming to a bogus
        # key).
        self.assertEqual(parse_module_destination("wram"), "wram")


class TestParseSymbolsFile(unittest.TestCase):
    """Validates the regex + attrs-splitter on real dsd symbols.txt
    line formats."""

    def _parse(self, content: str) -> list[Symbol]:
        with tempfile.NamedTemporaryFile("w", suffix=".txt", delete=False) as f:
            f.write(content)
            path = Path(f.name)
        try:
            return parse_symbols_file(path, "main")
        finally:
            path.unlink(missing_ok=True)

    def test_missing_file_is_empty(self):
        self.assertEqual(parse_symbols_file(Path("/nonexistent"), "main"), [])

    def test_function_arm(self):
        syms = self._parse("Entry kind:function(arm,size=0x13c) addr:0x02000800\n")
        self.assertEqual(len(syms), 1)
        s = syms[0]
        self.assertEqual(s.name, "Entry")
        self.assertEqual(s.type, "function")
        self.assertEqual(s.mode, "arm")
        self.assertEqual(s.size, 0x13c)
        self.assertEqual(s.addr, 0x02000800)
        self.assertEqual(s.module, "main")

    def test_function_thumb(self):
        syms = self._parse("Halt kind:function(thumb,size=0x4) addr:0x02000584\n")
        self.assertEqual(syms[0].mode, "thumb")
        self.assertEqual(syms[0].size, 0x4)

    def test_data_any(self):
        syms = self._parse("data_020b4320 kind:data(any) addr:0x020b4320\n")
        self.assertEqual(len(syms), 1)
        s = syms[0]
        self.assertEqual(s.type, "data")
        self.assertEqual(s.mode, "any")
        # data(any) has no size field — we default to 0.
        self.assertEqual(s.size, 0)

    def test_skips_comments_and_blanks(self):
        syms = self._parse(
            "\n"
            "# leading comment\n"
            "Entry kind:function(arm,size=0x4) addr:0x02000800\n"
            "\n"
            "# trailing comment\n"
        )
        self.assertEqual(len(syms), 1)
        self.assertEqual(syms[0].name, "Entry")

    def test_malformed_line_skipped(self):
        syms = self._parse(
            "Entry kind:function(arm,size=0x4) addr:0x02000800\n"
            "totally malformed line garbage\n"
            "Halt kind:function(thumb,size=0x4) addr:0x02000584\n"
        )
        self.assertEqual(len(syms), 2)

    def test_symbol_is_function_property(self):
        syms = self._parse(
            "Entry kind:function(arm,size=0x4) addr:0x02000800\n"
            "data_02001000 kind:data(any) addr:0x02001000\n"
        )
        self.assertTrue(syms[0].is_function)
        self.assertFalse(syms[1].is_function)

    def test_symbol_is_named_property(self):
        # Named: 'Entry'. Unnamed placeholders: `func_*`, `data_*`, `_dsd_gap*`.
        syms = self._parse(
            "Entry kind:function(arm,size=0x4) addr:0x02000800\n"
            "func_02000900 kind:function(arm,size=0x4) addr:0x02000900\n"
            "data_02001000 kind:data(any) addr:0x02001000\n"
        )
        self.assertTrue(syms[0].is_named)
        self.assertFalse(syms[1].is_named)
        self.assertFalse(syms[2].is_named)

    def test_symbol_end_addr(self):
        syms = self._parse("Entry kind:function(arm,size=0x13c) addr:0x02000800\n")
        self.assertEqual(syms[0].end_addr, 0x0200093c)


class TestParseRelocsFile(unittest.TestCase):
    def _parse(self, content: str) -> list[Reloc]:
        with tempfile.NamedTemporaryFile("w", suffix=".txt", delete=False) as f:
            f.write(content)
            path = Path(f.name)
        try:
            return parse_relocs_file(path, "main")
        finally:
            path.unlink(missing_ok=True)

    def test_missing_file_is_empty(self):
        self.assertEqual(parse_relocs_file(Path("/nonexistent"), "main"), [])

    def test_arm_call(self):
        rels = self._parse(
            "from:0x02000814 kind:arm_call to:0x02000a78 module:main\n"
        )
        self.assertEqual(len(rels), 1)
        r = rels[0]
        self.assertEqual(r.src_addr, 0x02000814)
        self.assertEqual(r.src_module, "main")
        self.assertEqual(r.dest_addr, 0x02000a78)
        self.assertEqual(r.dest_module, "main")
        self.assertEqual(r.kind, "arm_call")

    def test_load_to_overlay(self):
        rels = self._parse(
            "from:0x021aa4cc kind:load to:0x021b1d4c module:overlay(5)\n"
        )
        self.assertEqual(rels[0].dest_module, "ov005")
        self.assertEqual(rels[0].kind, "load")

    def test_skips_comments(self):
        rels = self._parse(
            "# comment\n"
            "\n"
            "from:0x02000814 kind:arm_call to:0x02000a78 module:main\n"
        )
        self.assertEqual(len(rels), 1)


# --------------------------------------------------------------------------- #
# discover_modules + load_all
# --------------------------------------------------------------------------- #

class TestDiscoverModules(unittest.TestCase):
    """Ordering matters: main, itcm, dtcm, then overlays numerically."""

    def test_ordering(self):
        with tempfile.TemporaryDirectory() as tmp:
            cfg = Path(tmp) / "config-root"
            arm9 = cfg / "arm9"
            arm9.mkdir(parents=True)
            (arm9 / "symbols.txt").write_text("")
            (arm9 / "itcm").mkdir()
            (arm9 / "itcm" / "symbols.txt").write_text("")
            (arm9 / "dtcm").mkdir()
            (arm9 / "dtcm" / "symbols.txt").write_text("")
            ovs = arm9 / "overlays"
            ovs.mkdir()
            # Create out-of-order to confirm the sort is numeric.
            for n in (2, 0, 23, 10):
                d = ovs / f"ov{n:03d}"
                d.mkdir()
                (d / "symbols.txt").write_text("")

            names = discover_modules(cfg)
            self.assertEqual(
                names,
                ["main", "itcm", "dtcm", "ov000", "ov002", "ov010", "ov023"],
            )

    def test_no_arm9_dir_yields_empty(self):
        with tempfile.TemporaryDirectory() as tmp:
            self.assertEqual(discover_modules(Path(tmp)), [])


# --------------------------------------------------------------------------- #
# Enclosing function (range lookup by bisect)
# --------------------------------------------------------------------------- #

class TestEnclosingFunction(unittest.TestCase):
    def setUp(self):
        # Three functions at 0x100 (size 0x40), 0x200 (size 0x20), 0x300 (size 0x10).
        syms = [
            make_symbol("A", "main", 0x100, size=0x40),
            make_symbol("B", "main", 0x200, size=0x20),
            make_symbol("C", "main", 0x300, size=0x10),
        ]
        self.m = make_module("main", syms)

    def test_exact_entry_hits(self):
        self.assertEqual(self.m.enclosing_function(0x100).name, "A")
        self.assertEqual(self.m.enclosing_function(0x200).name, "B")

    def test_mid_function_hits(self):
        self.assertEqual(self.m.enclosing_function(0x120).name, "A")
        self.assertEqual(self.m.enclosing_function(0x210).name, "B")

    def test_last_byte_inside_hits(self):
        # 0x100 + 0x40 - 1 = 0x13f is the last byte of A.
        self.assertEqual(self.m.enclosing_function(0x13f).name, "A")

    def test_end_addr_misses(self):
        # 0x100 + 0x40 = 0x140 is one past the end of A and not inside B.
        self.assertIsNone(self.m.enclosing_function(0x140))

    def test_gap_between_functions_misses(self):
        # 0x1f0 is between A (ends 0x140) and B (starts 0x200).
        self.assertIsNone(self.m.enclosing_function(0x1f0))

    def test_before_any_symbol_misses(self):
        self.assertIsNone(self.m.enclosing_function(0x50))

    def test_after_all_symbols_misses(self):
        self.assertIsNone(self.m.enclosing_function(0x400))

    def test_zero_size_never_encloses(self):
        # Unsized placeholder shouldn't be claimed as the enclosing
        # function for any address — simulates dsd's _unk entries.
        syms = [make_symbol("placeholder", "main", 0x500, size=0)]
        m = make_module("main", syms)
        self.assertIsNone(m.enclosing_function(0x500))


# --------------------------------------------------------------------------- #
# classify / tier assignment
# --------------------------------------------------------------------------- #

class TestClassify(unittest.TestCase):
    def setUp(self):
        self.modules: dict[str, ModuleData] = {"main": make_module("main", []),
                                                "ov005": make_module("ov005", [])}
        self.empty_graph = CallGraph()

    def test_data_symbol_unclassified(self):
        s = make_symbol("data_01", "main", 0x100, size=0x10, type_="data", mode="any")
        self.assertIsNone(classify(s, self.empty_graph, self.modules))

    def test_zero_size_unclassified(self):
        # _unk placeholders — can't decomp what we can't measure.
        s = make_symbol("func_unk", "ov005", 0x100, size=0)
        self.assertIsNone(classify(s, self.empty_graph, self.modules))

    def test_local_label_unclassified(self):
        s = make_symbol(".L_02021008", "main", 0x100, size=0x4)
        self.assertIsNone(classify(s, self.empty_graph, self.modules))

    def test_sinit_always_wins(self):
        # __sinit_* should land in sinit tier regardless of size/shape.
        s = make_symbol("__sinit_ov005_xyz", "ov005", 0x100, size=0x2c)
        t = classify(s, self.empty_graph, self.modules)
        self.assertIsNotNone(t)
        self.assertEqual(t.tier, "sinit")

    def test_named_beats_trivial(self):
        # A named leaf of size <= 4 would otherwise be classified 'trivial'.
        # Identity wins over shape.
        s = make_symbol("Entry", "main", 0x100, size=0x4)
        t = classify(s, self.empty_graph, self.modules)
        self.assertEqual(t.tier, "named")

    def test_trivial_for_tiny_leaf(self):
        s = make_symbol("func_01", "ov005", 0x100, size=0x4)
        t = classify(s, self.empty_graph, self.modules)
        self.assertEqual(t.tier, "trivial")

    def test_easy_for_small_leaf(self):
        s = make_symbol("func_01", "ov005", 0x100, size=0x18)
        t = classify(s, self.empty_graph, self.modules)
        self.assertEqual(t.tier, "easy")

    def test_hard_with_unnamed_callees(self):
        caller = make_symbol("func_01", "ov005", 0x100, size=0x80)
        callee = make_symbol("func_02", "ov005", 0x200, size=0x10)
        self.modules["ov005"] = make_module("ov005", [caller, callee])
        g = CallGraph()
        g.edges_call[("ov005", 0x100)].add(("ov005", 0x200))
        t = classify(caller, g, self.modules)
        self.assertEqual(t.tier, "hard")
        self.assertEqual(t.callees_total, 1)
        self.assertEqual(t.callees_named, 0)

    def test_medium_when_all_callees_named(self):
        caller = make_symbol("func_01", "ov005", 0x100, size=0x40)
        callee = make_symbol("Div", "main", 0x200, size=0x4)  # BIOS thunk, named
        self.modules["ov005"] = make_module("ov005", [caller])
        self.modules["main"] = make_module("main", [callee])
        g = CallGraph()
        g.edges_call[("ov005", 0x100)].add(("main", 0x200))
        t = classify(caller, g, self.modules)
        self.assertEqual(t.tier, "medium")
        self.assertEqual(t.callees_named, 1)

    def test_failing_module_annotation(self):
        # Failing-module status is advisory (in the reason string),
        # not a tier demotion.
        s = make_symbol("func_01", "main", 0x100, size=0x4)
        t = classify(s, self.empty_graph, self.modules)
        self.assertEqual(t.tier, "trivial")
        self.assertIn("main module checksum failing", t.reason)


# --------------------------------------------------------------------------- #
# Bulk groups
# --------------------------------------------------------------------------- #

class TestBulkGroups(unittest.TestCase):
    def test_name_family_sinit(self):
        self.assertEqual(_name_family("__sinit_ov005_021b16e4"), "__sinit")

    def test_name_family_other(self):
        self.assertEqual(_name_family("func_021aa4a0"), "")
        self.assertEqual(_name_family("Entry"), "")

    def test_min_count_threshold(self):
        # 3 functions all (ov005, 0x4) — below threshold of 4 — should NOT group.
        syms = [make_symbol(f"func_{i}", "ov005", 0x100 + i * 4, size=0x4) for i in range(3)]
        modules = {"ov005": make_module("ov005", syms)}
        self.assertEqual(find_bulk_groups(modules), [])

    def test_bulk_group_formed_at_threshold(self):
        # 4 functions all (ov005, 0x4) — hits threshold exactly.
        syms = [make_symbol(f"func_{i}", "ov005", 0x100 + i * 4, size=0x4) for i in range(4)]
        modules = {"ov005": make_module("ov005", syms)}
        groups = find_bulk_groups(modules)
        self.assertEqual(len(groups), 1)
        self.assertEqual(groups[0].count, 4)
        self.assertEqual(groups[0].size, 0x4)

    def test_sinit_and_func_do_not_mix(self):
        # Same (module, size) but different name-family — should form
        # TWO groups (if each hits min_count), not one muddled cluster.
        syms: list[Symbol] = []
        for i in range(4):
            syms.append(make_symbol(f"__sinit_x_{i}", "ov005", 0x100 + i * 0x2c, size=0x2c))
        for i in range(4):
            syms.append(make_symbol(f"func_{i}", "ov005", 0x500 + i * 0x2c, size=0x2c))
        modules = {"ov005": make_module("ov005", syms)}
        groups = find_bulk_groups(modules)
        self.assertEqual(len(groups), 2)
        # One group is all __sinit, the other isn't.
        sinit_groups = [g for g in groups if g.all_sinit]
        self.assertEqual(len(sinit_groups), 1)

    def test_leverage_ordering(self):
        # Higher count / smaller size = higher leverage, should sort first.
        syms: list[Symbol] = []
        # 5 × size=0x10 → leverage 5/16 = 0.3125
        for i in range(5):
            syms.append(make_symbol(f"func_a_{i}", "ov005", 0x100 + i * 0x10, size=0x10))
        # 4 × size=0x4  → leverage 4/4  = 1.0   (higher)
        for i in range(4):
            syms.append(make_symbol(f"func_b_{i}", "ov005", 0x500 + i * 0x4, size=0x4))
        modules = {"ov005": make_module("ov005", syms)}
        groups = find_bulk_groups(modules)
        self.assertEqual(len(groups), 2)
        self.assertEqual(groups[0].size, 0x4)  # highest leverage first


class TestSinitSummary(unittest.TestCase):
    def test_no_threshold(self):
        # A lone __sinit still surfaces in the summary (no min_count gate).
        s = make_symbol("__sinit_ov003_x", "ov003", 0x100, size=0x2c)
        modules = {"ov003": make_module("ov003", [s])}
        summary = find_sinit_summary(modules)
        self.assertEqual(summary, {"ov003": [(0x2c, 1)]})

    def test_per_size_rollup(self):
        syms = [
            make_symbol("__sinit_ov006_a", "ov006", 0x100, size=0x2c),
            make_symbol("__sinit_ov006_b", "ov006", 0x130, size=0x2c),
            make_symbol("__sinit_ov006_c", "ov006", 0x160, size=0x18),
        ]
        modules = {"ov006": make_module("ov006", syms)}
        summary = find_sinit_summary(modules)
        # Expect [(0x2c, 2), (0x18, 1)] — sorted by count desc, then size asc.
        self.assertEqual(summary["ov006"], [(0x2c, 2), (0x18, 1)])


# --------------------------------------------------------------------------- #
# Diff
# --------------------------------------------------------------------------- #

class TestComputeDiff(unittest.TestCase):
    def test_no_changes(self):
        snap = {"symbols": {"main|0x100": {"name": "Entry", "tier": "named", "size": 4}}}
        d = compute_diff(snap, snap)
        self.assertEqual(d["renamed"], [])
        self.assertEqual(d["moved"], [])
        self.assertEqual(d["newly_classified"], [])
        self.assertEqual(d["removed"], [])

    def test_rename_detected(self):
        prev = {"symbols": {"main|0x100": {"name": "func_old", "tier": "hard", "size": 4}}}
        curr = {"symbols": {"main|0x100": {"name": "Ov_New", "tier": "hard", "size": 4}}}
        d = compute_diff(prev, curr)
        self.assertEqual(d["renamed"], [("main|0x100", "func_old", "Ov_New")])

    def test_tier_move_detected(self):
        prev = {"symbols": {"main|0x100": {"name": "func_x", "tier": "hard", "size": 4}}}
        curr = {"symbols": {"main|0x100": {"name": "func_x", "tier": "medium", "size": 4}}}
        d = compute_diff(prev, curr)
        self.assertEqual(d["moved"], [("main|0x100", "hard", "medium")])

    def test_newly_classified(self):
        prev = {"symbols": {}}
        curr = {"symbols": {"main|0x100": {"name": "Entry", "tier": "named", "size": 4}}}
        d = compute_diff(prev, curr)
        self.assertEqual(d["newly_classified"],
                         [("main|0x100", "Entry", "named")])

    def test_removed(self):
        prev = {"symbols": {"main|0x100": {"name": "Entry", "tier": "named", "size": 4}}}
        curr = {"symbols": {}}
        d = compute_diff(prev, curr)
        self.assertEqual(d["removed"], [("main|0x100", "Entry", "named")])

    def test_tier_delta_computed(self):
        prev = {"totals": {"tier_counts": {"hard": 10, "medium": 2}}, "symbols": {}}
        curr = {"totals": {"tier_counts": {"hard": 7, "medium": 5}}, "symbols": {}}
        d = compute_diff(prev, curr)
        self.assertEqual(d["tier_delta"]["hard"], -3)
        self.assertEqual(d["tier_delta"]["medium"], 3)

    # --- bulk-group diff -----------------------------------------------------

    def test_bulk_groups_missing_is_empty(self):
        # Snapshots that predate schema 2 have no bulk_groups field;
        # compute_diff must treat that side as empty rather than crashing.
        prev = {"symbols": {}}
        curr = {"symbols": {}}
        d = compute_diff(prev, curr)
        self.assertEqual(d["bulk_groups_new"], [])
        self.assertEqual(d["bulk_groups_removed"], [])
        self.assertEqual(d["bulk_groups_changed"], [])

    def test_bulk_group_newly_formed(self):
        prev = {"symbols": {}, "bulk_groups": {}}
        curr = {
            "symbols": {},
            "bulk_groups": {
                "ov005|0x2c|__sinit": {
                    "count": 5, "all_sinit": True,
                    "all_placeholder": False, "failing_module": False,
                },
            },
        }
        d = compute_diff(prev, curr)
        self.assertEqual(d["bulk_groups_new"],
                         [("ov005|0x2c|__sinit", 5, True)])
        self.assertEqual(d["bulk_groups_removed"], [])
        self.assertEqual(d["bulk_groups_changed"], [])

    def test_bulk_group_dissolved(self):
        # Group existed in prev, gone in curr (e.g. members got named
        # out individually and dropped below the 4-member threshold).
        prev = {
            "symbols": {},
            "bulk_groups": {
                "main|0x4|": {
                    "count": 4, "all_sinit": False,
                    "all_placeholder": True, "failing_module": True,
                },
            },
        }
        curr = {"symbols": {}, "bulk_groups": {}}
        d = compute_diff(prev, curr)
        self.assertEqual(d["bulk_groups_removed"],
                         [("main|0x4|", 4, False)])

    def test_bulk_group_count_change(self):
        prev = {
            "symbols": {},
            "bulk_groups": {
                "ov006|0x2c|__sinit": {
                    "count": 11, "all_sinit": True,
                    "all_placeholder": False, "failing_module": False,
                },
            },
        }
        curr = {
            "symbols": {},
            "bulk_groups": {
                "ov006|0x2c|__sinit": {
                    "count": 7, "all_sinit": True,
                    "all_placeholder": False, "failing_module": False,
                },
            },
        }
        d = compute_diff(prev, curr)
        self.assertEqual(len(d["bulk_groups_changed"]), 1)
        key, pc, cc, pf, cf = d["bulk_groups_changed"][0]
        self.assertEqual(key, "ov006|0x2c|__sinit")
        self.assertEqual((pc, cc), (11, 7))
        self.assertEqual(pf, cf)  # flags unchanged, only count dropped

    def test_bulk_group_flag_flip(self):
        # all_placeholder True -> False means someone renamed a member
        # out of the placeholder pool. This is the signal that bulk
        # progress is happening even if count stayed constant.
        prev = {
            "symbols": {},
            "bulk_groups": {
                "ov005|0x4|": {
                    "count": 12, "all_sinit": False,
                    "all_placeholder": True, "failing_module": False,
                },
            },
        }
        curr = {
            "symbols": {},
            "bulk_groups": {
                "ov005|0x4|": {
                    "count": 12, "all_sinit": False,
                    "all_placeholder": False, "failing_module": False,
                },
            },
        }
        d = compute_diff(prev, curr)
        self.assertEqual(len(d["bulk_groups_changed"]), 1)
        _key, pc, cc, pf, cf = d["bulk_groups_changed"][0]
        self.assertEqual((pc, cc), (12, 12))
        self.assertEqual(pf, (False, True))
        self.assertEqual(cf, (False, False))

    def test_bulk_group_unchanged_not_reported(self):
        # Identical group on both sides — must not appear in any of
        # the three bulk_groups_* lists.
        group = {
            "count": 5, "all_sinit": True,
            "all_placeholder": False, "failing_module": False,
        }
        prev = {"symbols": {}, "bulk_groups": {"ov005|0x2c|__sinit": group}}
        curr = {"symbols": {}, "bulk_groups": {"ov005|0x2c|__sinit": group}}
        d = compute_diff(prev, curr)
        self.assertEqual(d["bulk_groups_new"], [])
        self.assertEqual(d["bulk_groups_removed"], [])
        self.assertEqual(d["bulk_groups_changed"], [])


class TestBuildSnapshotWithGroups(unittest.TestCase):
    """build_snapshot learned to accept a groups list in schema 2.
    Omitting it must keep snapshot schema-compat with schema 1 output."""

    def test_omitting_groups_omits_key(self):
        from analyze_symbols import Target, build_snapshot
        tgt = Target(symbol=make_symbol("Entry", "main", 0x100, size=4),
                     tier="named", reason="", callees_named=0, callees_total=0)
        snap = build_snapshot("eur", [tgt])
        self.assertNotIn("bulk_groups", snap)

    def test_passing_groups_populates_key(self):
        from analyze_symbols import BulkGroup, Target, build_snapshot
        tgt = Target(symbol=make_symbol("Entry", "main", 0x100, size=4),
                     tier="named", reason="", callees_named=0, callees_total=0)
        sinit_syms = [make_symbol(f"__sinit_ov005_{i:x}", "ov005",
                                  0x1000 + i * 0x2c, size=0x2c)
                      for i in range(5)]
        group = BulkGroup(module="ov005", size=0x2c, members=sinit_syms)
        snap = build_snapshot("eur", [tgt], [group])
        self.assertIn("bulk_groups", snap)
        self.assertIn("ov005|0x2c|__sinit", snap["bulk_groups"])
        entry = snap["bulk_groups"]["ov005|0x2c|__sinit"]
        self.assertEqual(entry["count"], 5)
        self.assertTrue(entry["all_sinit"])


# --------------------------------------------------------------------------- #
# Constants — guard against accidental re-ordering that would break
# downstream docs (targets.md column order, heatmap colour gradient).
# --------------------------------------------------------------------------- #

class TestConstants(unittest.TestCase):
    def test_tier_order(self):
        self.assertEqual(
            TIER_ORDER,
            ["trivial", "easy", "sinit", "named", "medium", "hard"],
        )

    def test_min_bulk_count(self):
        # Spec per brief 002 — if this changes, targets.md's bulk
        # section narrative ("groups with >= 4 members") drifts too.
        self.assertEqual(MIN_BULK_COUNT, 4)


if __name__ == "__main__":
    unittest.main()
