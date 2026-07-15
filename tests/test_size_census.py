"""Tests for tools/size_census.py (brief 278).

The collection step reads committed config (symbols.txt + delinks.txt),
but the scoring logic — size bucketing, claimed-interval membership,
per-module aggregation, and the <0x100 ranking — is pure and tested here
on fixtures (no config/build needed, so it runs in CI). One integration
test confirms the real eur config parses + that brief-277's shipped hub
`func_ov002_021ae400` is correctly counted MATCHED (it is claimed in
delinks even though stale gap objects still list it).
"""

from __future__ import annotations

import sys
import unittest
from pathlib import Path

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

from size_census import (  # noqa: E402
    aggregate,
    bucket_of,
    collect,
    is_claimed,
    parse_claimed_text,
    parse_functions,
    shape_class,
    shape_features,
    unmatched,
)


class TestBucket(unittest.TestCase):
    def test_knee_boundaries(self):
        self.assertEqual(bucket_of(0x00), "<0x100")
        self.assertEqual(bucket_of(0xFF), "<0x100")
        self.assertEqual(bucket_of(0x100), "0x100-0x200")  # boundary is exclusive-lo
        self.assertEqual(bucket_of(0x1FF), "0x100-0x200")
        self.assertEqual(bucket_of(0x200), ">0x200")
        self.assertEqual(bucket_of(0x1E98), ">0x200")


class TestParse(unittest.TestCase):
    SYMS = "\n".join([
        "func_ov002_021aa4a0 kind:function(arm,size=0xb8) addr:0x021aa4a0",
        "func_ov002_021d91e0 kind:function(arm,size=0x200) addr:0x021d91e0",
        "func_ov002_021dd648 kind:function(thumb,size=0xaec) addr:0x021dd648",
        "data_ov002_022cf16c kind:data(word) addr:0x022cf16c",   # not a function
        "Duel_Foo kind:function(arm,size=0x40) addr:0x021ab000",  # renamed (matched)
    ])
    DELINKS = "\n".join([
        "src/overlay002/func_ov002_021aa4a0.c:",
        "    complete",
        "    .text start:0x021aa4a0 end:0x021aa558",   # claims 021aa4a0
        "    .rodata start:0x0 end:0x0",                 # ignored (not .text)
        "src/overlay002/Duel_Foo.c:",
        "    complete",
        "    .text start:0x021ab000 end:0x021ab040",   # claims Duel_Foo
    ])

    def test_parse_functions_skips_data(self):
        fns = parse_functions(self.SYMS)
        names = [n for n, _, _ in fns]
        self.assertIn("func_ov002_021aa4a0", names)
        self.assertIn("Duel_Foo", names)
        self.assertNotIn("data_ov002_022cf16c", names)  # data, not function
        self.assertEqual(len(fns), 4)

    def test_parse_claimed_text_only_text(self):
        iv = parse_claimed_text(self.DELINKS)
        self.assertIn((0x021AA4A0, 0x021AA558), iv)
        self.assertIn((0x021AB000, 0x021AB040), iv)
        self.assertEqual(len(iv), 2)  # the .rodata line is excluded

    def test_is_claimed(self):
        iv = parse_claimed_text(self.DELINKS)
        self.assertTrue(is_claimed(0x021AA4A0, iv))
        self.assertTrue(is_claimed(0x021AB010, iv))
        self.assertFalse(is_claimed(0x021D91E0, iv))   # unmatched
        self.assertFalse(is_claimed(0x021AA558, iv))   # end is exclusive

    def test_unmatched(self):
        fns = parse_functions(self.SYMS)
        iv = parse_claimed_text(self.DELINKS)
        um = {n for n, _, _ in unmatched(fns, iv)}
        self.assertIn("func_ov002_021d91e0", um)     # not claimed
        self.assertIn("func_ov002_021dd648", um)     # not claimed (thumb)
        self.assertNotIn("func_ov002_021aa4a0", um)  # claimed
        self.assertNotIn("Duel_Foo", um)             # claimed


class TestAggregate(unittest.TestCase):
    def test_counts_bytes_and_ranking(self):
        per_module = {
            "ov002": [("a", 0x0, 0x40), ("b", 0x0, 0x80), ("c", 0x0, 0x300)],
            "ov006": [("d", 0x0, 0x20)],
        }
        s = aggregate(per_module)
        ov2 = s["modules"]["ov002"]
        self.assertEqual(ov2["buckets"]["<0x100"]["count"], 2)
        self.assertEqual(ov2["buckets"]["<0x100"]["bytes"], 0xC0)
        self.assertEqual(ov2["buckets"][">0x200"]["count"], 1)
        self.assertEqual(ov2["small_count"], 2)
        self.assertEqual(s["totals"]["<0x100"]["count"], 3)
        # ov002 has the richer <0x100 vein → ranked first
        self.assertEqual(s["ranking"][0], "ov002")

    def test_empty(self):
        s = aggregate({})
        self.assertEqual(s["ranking"], [])
        self.assertEqual(s["totals"]["<0x100"]["count"], 0)


class TestShape(unittest.TestCase):
    """shape_features / shape_class are pure (no build) — CI-safe.

    Instruction lists are (addr, mnemonic) pairs as collect_shapes parses
    them from objdump. Addresses matter only for the backward-branch =
    loop test.
    """

    def test_straight_line_accessor_is_simple(self):
        # load / compute / bl helper / return — no branches
        insns = [
            (0x00, "ldr r1, [r0, #0x30]"),
            (0x04, "add r1, r1, #1"),
            (0x08, "bl 21b91c4 <func_ov002_021b91c4>"),
            (0x0C, "pop {r4, pc}"),
        ]
        f = shape_features(insns)
        self.assertEqual(f, {"insns": 4, "calls": 1, "branches": 0, "loops": 0})
        self.assertEqual(shape_class(f), "simple")

    def test_bl_and_blx_are_calls_not_branches(self):
        insns = [
            (0x00, "bl 21b2ebc <func_ov002_021b2ebc>"),
            (0x04, "blx r3"),
        ]
        f = shape_features(insns)
        self.assertEqual(f["calls"], 2)
        self.assertEqual(f["branches"], 0)

    def test_bx_is_neither_call_nor_branch(self):
        # bx lr is a return; bx must not be miscounted as a forward branch
        f = shape_features([(0x00, "bx lr")])
        self.assertEqual(f, {"insns": 1, "calls": 0, "branches": 0, "loops": 0})

    def test_forward_conditional_branch_is_a_branch_not_a_loop(self):
        insns = [
            (0x00, "cmp r0, #0"),
            (0x04, "beq 10 <skip>"),   # forward (target > addr) → branch, not loop
            (0x08, "mov r0, #1"),
            (0x10, "pop {pc}"),
        ]
        f = shape_features(insns)
        self.assertEqual(f["branches"], 1)
        self.assertEqual(f["loops"], 0)

    def test_backward_branch_is_a_loop_and_classes_permuter(self):
        insns = [
            (0x00, "mov r2, #0"),
            (0x04, "ldrb r1, [r0, r2]"),
            (0x08, "add r2, r2, #1"),
            (0x0C, "cmp r2, r3"),
            (0x10, "blt 4 <loop>"),    # backward (target ≤ addr) → loop
            (0x14, "pop {pc}"),
        ]
        f = shape_features(insns)
        self.assertEqual(f["loops"], 1)
        self.assertEqual(shape_class(f), "permuter")  # any loop → permuter

    def test_many_forward_branches_no_loop_is_dispatcher(self):
        # a switch / multi-guard: >3 branches, none backward → still hand-RE
        insns = [(i * 4, f"beq {0x100 + i} <case>") for i in range(5)]
        f = shape_features(insns)
        self.assertEqual(f["branches"], 5)
        self.assertEqual(f["loops"], 0)
        self.assertEqual(shape_class(f), "dispatcher")

    def test_three_branches_is_still_simple(self):
        insns = [(i * 4, f"bne {0x200 + i} <fwd>") for i in range(3)]
        f = shape_features(insns)
        self.assertEqual(shape_class(f), "simple")  # boundary: ≤3 branches

    def test_empty_is_simple(self):
        f = shape_features([])
        self.assertEqual(f, {"insns": 0, "calls": 0, "branches": 0, "loops": 0})
        self.assertEqual(shape_class(f), "simple")


class TestIntegrationRealConfig(unittest.TestCase):
    """Runs against committed config/eur (no build needed)."""

    def test_eur_ov002_present_and_shipped_hub_is_matched(self):
        pm = collect("eur", "ov002")
        self.assertIn("ov002", pm)
        names = {n for n, _, _ in pm["ov002"]}
        # brief 277 shipped func_ov002_021ae400 → claimed in delinks → MATCHED
        self.assertNotIn("func_ov002_021ae400", names)
        # a known still-unmatched pick: 021d91e0 (brief 276) was carved, then
        # the fallback fixture 022b867c (brief 488's data-blob residue) was
        # ALSO shipped by brief 572's EUR closeout — as of that brief, EUR
        # ov002 has NO function residue at all. Assert that stronger fact:
        # whatever remains uncarved is only __sinit_* static-initializer stubs.
        self.assertTrue(names, "census should still see the __sinit residue")
        non_sinit = {n for n in names if not n.startswith("__sinit_ov002_")}
        self.assertEqual(non_sinit, set(),
                         "EUR ov002 grew NEW non-__sinit residue (regression "
                         "vs the brief-572 fully-carved state)")


if __name__ == "__main__":
    unittest.main()
