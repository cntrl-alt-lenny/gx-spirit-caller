"""Tests for tools/asm_escape.py (brief 290).

The compile/assemble/verify pipeline is build-dependent (wine + mwcc +
mwasmarm) and exercised manually; the scoring logic — objdump parsing,
literal-pool detection, the objdump→mwasmarm syntax conversion, the
commutative-swap classifier (the SAFETY guard), and the `.s` emitter — is
pure and tested here on fixtures so it runs in CI with no build.

The fixture mirrors a real accessor residue member: two `ldr rX, [pc, #N]`
pool loads, a `bl` with a PC24 reloc, an ABS32 pool word, and ONE diverging
`add` (the CSE-temp commutative swap). Pool words render as raw `andeq`
decodes (as the delinked orig does), NOT `.word`, so the tests exercise the
pc-relative-target pool detection rather than a fragile string match.
"""

from __future__ import annotations

import sys
import unittest
from pathlib import Path

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

from asm_escape import (  # noqa: E402
    branch_targets,
    classify_fixes,
    emit_asm,
    hex_imm,
    is_commutative_swap,
    parse_objdump,
    pool_addrs,
    to_mwasm,
)

# A small loop+exit function for the whole-function mode (brief 302): a
# back-edge `b 8` (loop top) and a forward `bge 1c` (exit), plus an external
# `bl` (reloc). Internal branch targets: 0x8 and 0x1c.
_LOOP = """\
00000000 <func_loop>:
   0:\te92d4010 \tpush\t{r4, lr}
   4:\te3a04000 \tmov\tr4, #0
   8:\te3540005 \tcmp\tr4, #5
   c:\taa000003 \tbge\t1c <.L_exit>
  10:\teb000000 \tbl\t8 <func_helper>
\t\t\t10: R_ARM_PC24\tfunc_helper-0x8
  14:\te2844001 \tadd\tr4, r4, #1
  18:\teafffffa \tb\t8 <.L_top>
  1c:\te8bd8010 \tpop\t{r4, pc}
"""

# addr 0x28 / 0x2c are the targets of the two `ldr [pc, #N]` loads below.
_DIS = """\
00000000 <func_t>:
   0:\te92d4038 \tpush\t{{r3, r4, r5, lr}}
   4:\te3520005 \tcmp\tr2, #5
   8:\te59f4018 \tldr\tr4, [pc, #24]\t@ 28 <func_t+0x28>
   c:\te0040392 \tmul\tr4, r2, r3
  10:\t{add} \t{addtext}
  14:\te5933030 \tldr\tr3, [r3, #48]\t@ 0x30
  18:\teb000000 \tbl\t8 <func_ov002_021c1ef0+0x8>
\t\t\t18: R_ARM_PC24\tfunc_ov002_021c1ef0-0x8
  1c:\te8bd8038 \tpop\t{{r3, r4, r5, pc}}
  20:\te59f0004 \tldr\tr0, [pc, #4]\t@ 2c <func_t+0x2c>
  24:\te19400b0 \tldrh\tr0, [r4, r0]
  28:\t00000868 \tandeq\tr0, r0, r8, lsr #16
  2c:\t00000000 \tandeq\tr0, r0, r0
\t\t\t2c: R_ARM_ABS32\tdata_ov002_022cf16c
"""


def _dis(add_bytes, add_text):
    return _DIS.format(add=add_bytes, addtext=add_text)


MINE = _dis("e0843003", "add\tr3, r4, r3")   # CSE temp first (mwcc)
ORIG = _dis("e0833004", "add\tr3, r3, r4")   # accumulator first (target)


class TestParse(unittest.TestCase):
    def test_parses_instrs_pool_and_relocs(self):
        w = parse_objdump(ORIG, "func_t")
        self.assertEqual(w[0]["mnem"], "push {r3, r4, r5, lr}")
        bl = next(x for x in w if x["mnem"].startswith("bl"))
        self.assertEqual(bl["reloc"], "func_ov002_021c1ef0")
        pw = next(x for x in w if x["reloc"] == "data_ov002_022cf16c")
        self.assertEqual(pw["addr"], 0x2C)
        ldr = next(x for x in w if x["addr"] == 0x14)
        self.assertEqual(ldr["mnem"], "ldr r3, [r3, #48]")  # @comment stripped

    def test_pool_addrs_from_pc_relative_loads(self):
        self.assertEqual(pool_addrs(parse_objdump(ORIG, "func_t")), {0x28, 0x2C})


class TestSyntaxConversion(unittest.TestCase):
    def test_hex_imm(self):
        self.assertEqual(hex_imm("cmp r2, #5"), "cmp r2, #0x5")
        self.assertEqual(hex_imm("mov r3, #20"), "mov r3, #0x14")

    def test_push_pop_to_stm_ldm(self):
        self.assertEqual(to_mwasm("push {r3, lr}"), "stmdb sp!, {r3, lr}")
        self.assertEqual(to_mwasm("pop {r3, pc}"), "ldmia sp!, {r3, pc}")
        self.assertEqual(to_mwasm("popeq {r3, pc}"), "ldmeqia sp!, {r3, pc}")
        self.assertEqual(to_mwasm("popge {r4, pc}"), "ldmgeia sp!, {r4, pc}")

    def test_shift_to_mov_form(self):
        self.assertEqual(to_mwasm("lsl r3, r3, #19"), "mov r3, r3, lsl #19")
        self.assertEqual(to_mwasm("lsrs r3, r3, #19"), "movs r3, r3, lsr #19")

    def test_conditional_shift(self):  # folded in from gen_asm_tu (brief 292)
        self.assertEqual(to_mwasm("lsleq r0, r0, #1"), "moveq r0, r0, lsl #1")
        self.assertEqual(to_mwasm("asrne r2, r2, #2"), "movne r2, r2, asr #2")

    def test_conditional_pop(self):
        self.assertEqual(to_mwasm("popne {r4, pc}"), "ldmneia sp!, {r4, pc}")

    def test_passthrough_plain_ops(self):
        self.assertEqual(to_mwasm("add r3, r3, r4"), "add r3, r3, r4")


class TestCommutativeSwap(unittest.TestCase):
    def test_positive(self):
        self.assertTrue(is_commutative_swap("add r3, r4, r3", "add r3, r3, r4"))
        self.assertTrue(is_commutative_swap("add lr, ip, lr", "add lr, lr, ip"))
        self.assertTrue(is_commutative_swap("orr r0, r1, r0", "orr r0, r0, r1"))

    def test_negative_same_order(self):
        self.assertFalse(is_commutative_swap("add r3, r3, r4", "add r3, r3, r4"))

    def test_negative_different_dest(self):
        self.assertFalse(is_commutative_swap("add r2, r4, r3", "add r3, r3, r4"))

    def test_negative_non_commutative(self):
        self.assertFalse(is_commutative_swap("sub r3, r4, r3", "sub r3, r3, r4"))

    def test_negative_different_operands(self):
        self.assertFalse(is_commutative_swap("add r3, r4, r5", "add r3, r3, r4"))


class TestClassifyFixes(unittest.TestCase):
    def test_single_swap_is_fix_no_refusal(self):
        fixes, refusals = classify_fixes(parse_objdump(MINE, "func_t"),
                                         parse_objdump(ORIG, "func_t"))
        self.assertEqual(refusals, [])
        self.assertEqual(len(fixes), 1)
        self.assertEqual(fixes[0][1], "add r3, r4, r3")
        self.assertEqual(fixes[0][2], "add r3, r3, r4")

    def test_identical_no_fix_no_refusal(self):
        fixes, refusals = classify_fixes(parse_objdump(ORIG, "func_t"),
                                         parse_objdump(ORIG, "func_t"))
        self.assertEqual((fixes, refusals), ([], []))

    def test_real_byte_diff_is_refused(self):
        # a non-commutative divergence (different ldr offset, real bytes) refuses
        mine = parse_objdump(
            ORIG.replace("e5933030 \tldr\tr3, [r3, #48]", "e593302c \tldr\tr3, [r3, #44]"),
            "func_t")
        fixes, refusals = classify_fixes(mine, parse_objdump(ORIG, "func_t"))
        self.assertEqual(fixes, [])
        self.assertTrue(any("non-canonicalisation" in r for r in refusals))

    def test_count_mismatch_is_refused(self):
        short = parse_objdump(ORIG, "func_t")[:-4]
        fixes, refusals = classify_fixes(short, parse_objdump(ORIG, "func_t"))
        self.assertEqual(fixes, [])
        self.assertTrue(any("count differs" in r for r in refusals))


class TestEmit(unittest.TestCase):
    def test_emits_mwasm_s(self):
        orig = parse_objdump(ORIG, "func_t")
        s = emit_asm("func_t", orig, [(4, "add r3, r4, r3", "add r3, r3, r4")])
        self.assertIn("        .global func_t", s)
        self.assertIn("        .arm", s)
        self.assertIn("func_t:", s)
        self.assertIn("stmdb sp!, {r3, r4, r5, lr}", s)   # push converted
        self.assertIn("bl func_ov002_021c1ef0", s)        # bl uses reloc symbol
        self.assertIn(".extern data_ov002_022cf16c", s)
        self.assertIn(".word data_ov002_022cf16c", s)     # pool slot
        self.assertIn("add r3, r3, r4", s)                # corrected order
        self.assertIn("ldr r4, _LIT0", s)                 # pc-rel load -> label
        self.assertIn("fix [4]", s)                       # documented


class TestWholeFunction(unittest.TestCase):
    """The GLOBAL_ASM whole-function mode (brief 302)."""

    def test_branch_targets_internal_only(self):
        w = parse_objdump(_LOOP, "func_loop")
        # 0x8 (back-edge `b 8`) and 0x1c (`bge 1c`); the bl (reloc) is NOT a target
        self.assertEqual(branch_targets(w), {0x8, 0x1C})

    def test_branch_targets_none_for_straightline(self):
        self.assertEqual(branch_targets(parse_objdump(ORIG, "func_t")), set())

    def test_whole_emit_labels_and_branches(self):
        s = emit_asm("func_loop", parse_objdump(_LOOP, "func_loop"), whole=True)
        self.assertIn("GLOBAL_ASM", s)                 # whole-function header
        self.assertIn("        .global func_loop", s)
        self.assertIn("stmdb sp!, {r4, lr}", s)        # push converted
        self.assertIn(".L_8:", s)                       # back-edge target label
        self.assertIn(".L_1c:", s)                      # exit target label
        self.assertIn("b .L_8", s)                      # back-edge -> label
        self.assertIn("bge .L_1c", s)                   # forward branch -> label
        self.assertIn("bl func_helper", s)              # external call -> symbol
        self.assertIn("        .extern func_helper", s)
        self.assertNotIn("b 8", s)                      # no raw numeric branch target

    def test_canonicalisation_mode_unchanged(self):
        # whole=False keeps the brief-290 header + no .L_ labels (straight-line)
        s = emit_asm("func_t", parse_objdump(ORIG, "func_t"),
                     [(4, "add r3, r4, r3", "add r3, r3, r4")])
        self.assertIn("escape hatch (brief 290)", s)
        self.assertNotIn("GLOBAL_ASM", s)
        self.assertNotIn(".L_", s)


if __name__ == "__main__":
    unittest.main()
