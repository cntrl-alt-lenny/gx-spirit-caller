"""Tests for tools/scope_gate.py (R&D r9 §4).

Pure logic is tested with injected fixtures (monkeypatching the file/git seams);
one integration test asserts clean committed `origin/main` passes with target 0.
The two live regression checks that matter — that the gate catches the b610
dup-symbol and b612 half-applied-rename classes — are exercised here on fixtures
mirroring those exact failures.
"""

from __future__ import annotations

import sys
import unittest
from pathlib import Path

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

import scope_gate as sg  # noqa: E402


class TestParse(unittest.TestCase):
    def test_parse_functions(self):
        text = "\n".join([
            "func_02000b64 kind:function(arm,size=0x4) addr:0x02000b64",
            "FX_Init kind:function(arm,size=0x4) addr:0x02000b68",
            "data_x kind:data(any) addr:0x02000b70",  # not a function
        ])
        f = sg.parse_functions(text)
        self.assertEqual(f, {"func_02000b64": "0x02000b64", "FX_Init": "0x02000b68"})

    def test_placeholder(self):
        self.assertTrue(sg._is_placeholder("func_0200634c"))
        self.assertTrue(sg._is_placeholder("__sinit_foo"))
        self.assertFalse(sg._is_placeholder("Task_InvokeLockedIrq"))


class TestScope(unittest.TestCase):
    def test_counts_newly_real_across_regions(self):
        base = {"func_a": "0x1", "func_b": "0x2"}
        head = {"Foo": "0x1", "func_b": "0x2"}  # func_a -> Foo
        sg.region_funcs = lambda ref, r: base if ref else head
        ok, detail, data = sg.check_scope("BASE", ["eur", "usa"], target=2)
        self.assertTrue(ok)  # Foo newly-real in both regions = 2
        self.assertEqual(sum(len(s) for s in data["per_region_new"].values()), 2)

    def test_thin_pr_fails_target(self):
        base = {"func_a": "0x1"}
        head = {"Foo": "0x1"}
        sg.region_funcs = lambda ref, r: base if ref else head
        ok, _, _ = sg.check_scope("BASE", ["eur", "usa", "jpn"], target=150)
        self.assertFalse(ok)  # 3 newly-real << 150


class TestDupSymbol(unittest.TestCase):
    def test_catches_b610_duplicate(self):
        # VBlankIntrWait bound to two addresses in eur
        sg.region_name_addrs = lambda ref, r: (
            {"VBlankIntrWait": {"0x02000086", "0x0200093c"}} if r == "eur" else {"X": {"0x1"}}
        )
        ok, detail, _ = sg.check_dup_symbol(["eur", "usa"])
        self.assertFalse(ok)
        self.assertIn("VBlankIntrWait", detail)

    def test_clean_passes(self):
        sg.region_name_addrs = lambda ref, r: {"A": {"0x1"}, "B": {"0x2"}}
        ok, _, _ = sg.check_dup_symbol(["eur"])
        self.assertTrue(ok)


class TestCascade(unittest.TestCase):
    def test_catches_b612_half_applied(self):
        # func_0200634c renamed away in symbols but still in a compiled .c
        base = {"func_0200634c": "0x0200634c"}
        head = {"Task_InvokeLockedIrq": "0x0200634c"}
        sg.region_funcs = lambda ref, r: base if ref else head
        sg._grep_source = lambda name: (
            ["src/usa/main/func_0200634c.c"] if name == "func_0200634c" else []
        )
        ok, detail, _ = sg.check_cascade("BASE", ["usa"])
        self.assertFalse(ok)
        self.assertIn("func_0200634c", detail)

    def test_fully_cascaded_passes(self):
        base = {"func_0200634c": "0x0200634c"}
        head = {"Task_InvokeLockedIrq": "0x0200634c"}
        sg.region_funcs = lambda ref, r: base if ref else head
        sg._grep_source = lambda name: []  # nothing left in source
        ok, _, _ = sg.check_cascade("BASE", ["usa"])
        self.assertTrue(ok)

    def test_no_rename_is_noop(self):
        sg.region_funcs = lambda ref, r: {"func_a": "0x1"}  # unchanged
        sg._grep_source = lambda name: ["should-not-be-called"]
        ok, _, _ = sg.check_cascade("BASE", ["usa"])
        self.assertTrue(ok)


class TestCarve(unittest.TestCase):
    def test_thin_carve_fails_target(self):
        base = {("eur", "config/eur/arm9/overlays/ov008/delinks.txt", "a.s")}
        head = base | {
            ("eur", "config/eur/arm9/overlays/ov008/delinks.txt", "b.s"),
            ("eur", "config/eur/arm9/overlays/ov008/delinks.txt", "c.s"),
        }
        sg.complete_tus = lambda ref, regions: base if ref else head
        ok, detail, _ = sg.check_carve_scope("BASE", ["eur"], target=20)
        self.assertFalse(ok)
        self.assertIn("delta = 2", detail)
        self.assertIn("target 20", detail)

    def test_matching_carve_reconciles(self):
        base = set()
        head = {
            ("eur", "config/eur/arm9/overlays/ov008/delinks.txt", "a.s"),
            ("eur", "config/eur/arm9/overlays/ov008/delinks.txt", "b.s"),
        }
        sg.complete_tus = lambda ref, regions: base if ref else head
        sg.new_source_files = lambda base, regions: {"src/overlay008/a.s", "src/overlay008/b.s"}
        ok, detail, _ = sg.check_carve_reconciliation("BASE", ["eur"])
        self.assertTrue(ok)
        self.assertIn("new complete TUs = 2", detail)
        self.assertIn("new src files = 2", detail)

    def test_padded_delinks_fails_reconciliation(self):
        base = set()
        head = {
            ("eur", "config/eur/arm9/overlays/ov008/delinks.txt", "a.s"),
            ("eur", "config/eur/arm9/overlays/ov008/delinks.txt", "b.s"),
        }
        sg.complete_tus = lambda ref, regions: base if ref else head
        sg.new_source_files = lambda base, regions: {"src/overlay008/a.s"}
        ok, detail, _ = sg.check_carve_reconciliation("BASE", ["eur"])
        self.assertFalse(ok)
        self.assertIn("new complete TUs = 2", detail)
        self.assertIn("new src files = 1", detail)


class TestIntegrationRealMain(unittest.TestCase):
    """Clean committed HEAD must pass all checks at target 0 (no build)."""

    def setUp(self):
        import importlib
        importlib.reload(sg)  # undo monkeypatches from other tests

    def test_clean_head_passes_target_zero(self):
        rc = sg.run("naming", base="HEAD", regions=["eur", "usa", "jpn"], target=0)
        self.assertEqual(rc, 0)


if __name__ == "__main__":
    unittest.main()
