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
    _DATA_AS_CODE_RE,
    branch_targets,
    classify_fixes,
    diff_words,
    emit_asm,
    hex_imm,
    is_commutative_swap,
    parse_objdump,
    pool_addrs,
    resolve_absorbed_substitutions,
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

# A four-byte function followed by a named data symbol and another named
# routine. Neither successor uses the `func_` prefix, so the pre-477 parser
# swallowed both into `func_edge` instead of honoring its configured size.
_NAMED_BOUNDARY = """\
00000000 <func_edge>:
   0:\te12fff1e \tbx\tlr

00000004 <BuildInfo>:
   4:\t00000000 \t.word\t0x00000000
\t\t\t4: R_ARM_ABS32\tdata_build

00000008 <main>:
   8:\te12fff1e \tbx\tlr
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

    def test_configured_size_stops_at_named_boundary(self):
        words = parse_objdump(_NAMED_BOUNDARY, "func_edge", size=4)
        self.assertEqual([(w["addr"], w["mnem"]) for w in words],
                         [(0, "bx lr")])
        emitted = emit_asm("func_edge", words, whole=True)
        self.assertNotIn("BuildInfo", emitted)
        self.assertNotIn("data_build", emitted)
        self.assertEqual(diff_words(words, words), [])


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

    def test_conditional_ldst_size_reorder(self):  # brief 371: xPack objdump order
        # GNU/xPack objdump prints <op><size><cond>; mwasmarm wants
        # <op><cond><size>. Reorder the size suffix after the condition.
        self.assertEqual(to_mwasm("strhls r0, [r1]"), "strlsh r0, [r1]")
        self.assertEqual(to_mwasm("ldrbne r2, [r3, #0x4]"), "ldrneb r2, [r3, #0x4]")
        self.assertEqual(to_mwasm("ldrsheq r0, [r1]"), "ldreqsh r0, [r1]")
        # forms with only a size OR only a condition are already valid: untouched
        self.assertEqual(to_mwasm("strh r0, [r1]"), "strh r0, [r1]")
        self.assertEqual(to_mwasm("streq r0, [r1]"), "streq r0, [r1]")
        self.assertEqual(to_mwasm("ldr r0, [r1]"), "ldr r0, [r1]")

    def test_bare_stm_ldm_gets_ia(self):  # brief 377: objdump omits default IA
        self.assertEqual(to_mwasm("stm sp, {r4, r5}"), "stmia sp, {r4, r5}")
        self.assertEqual(to_mwasm("ldm r0, {r1, r2}"), "ldmia r0, {r1, r2}")
        self.assertEqual(to_mwasm("stmeq sp, {r0, r3}"), "stmeqia sp, {r0, r3}")
        # explicit modes already carry a suffix -> passed through unchanged
        self.assertEqual(to_mwasm("stmdb sp!, {r4, lr}"), "stmdb sp!, {r4, lr}")
        self.assertEqual(to_mwasm("ldmia sp!, {r4, pc}"), "ldmia sp!, {r4, pc}")


# brief 488: objdump renders an embedded data table as bogus coprocessor / svc /
# unprivileged-transfer "instructions". A `bx lr` then three data words.
_DATAASCODE = """\
00000000 <func_data>:
   0:\te12fff1e \tbx\tlr
   4:\teaebeced \tsvclt\t0x00bfc0c0
   8:\tee1f8f10 \tldc2l\t15, cr15, [lr, #0x3fc]!
   c:\teef0f0f0 \tcdple\t15, 13, cr13, cr15, cr0, {7}
"""


class TestDataAsCode(unittest.TestCase):  # brief 488
    def test_regex_matches_data_as_code(self):
        for mn in ("ldc2l 15, cr15, [lr]", "stclgt 14, cr12, [lr]",
                   "ldclt 14, cr11, [sp]", "cdple 15, 13, cr13, cr15, cr0, {7}",
                   "svclt 0x00bfc0c0", "strtge sl, [r6], r7", "ldrtlt fp, [r5]",
                   "mrcls 14, 4, r9, cr14, cr15, {4}"):
            self.assertTrue(_DATA_AS_CODE_RE.match(mn), mn)

    def test_regex_skips_normal_and_genuine_cp15(self):
        # normal ops + genuine NON-conditional CP15 mcr/mrc (translated by
        # to_mwasm) + plain ldr/str must NOT be diverted to a raw .word
        for mn in ("add r3, r3, r4", "ldr r0, [r1]", "str r0, [r1]",
                   "strh r0, [r1]", "bl func_x", "stmdb sp!, {r4, lr}",
                   "mcr 15, 0, r0, cr7, cr10, {4}", "mrc 15, 0, r0, cr7, cr10, {4}"):
            self.assertFalse(_DATA_AS_CODE_RE.match(mn), mn)

    def test_emit_words_data_as_code(self):
        s = emit_asm("func_data", parse_objdump(_DATAASCODE, "func_data"), whole=True)
        self.assertIn("bx lr", s)                 # real instruction kept
        self.assertIn(".word 0xeaebeced", s)      # svc data word -> raw .word
        self.assertIn(".word 0xee1f8f10", s)      # ldc2l data word
        self.assertIn(".word 0xeef0f0f0", s)      # cdp data word
        for bogus in ("svclt", "ldc2l", "cdple"):  # un-assemblable mnemonics gone
            self.assertNotIn(bogus, s)


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

    def test_absorbed_subs_rewrites_pool_word(self):
        # brief 541: a C-absorbed pool word gets substituted with its
        # base+offset expression instead of the bare (unlinkable) symbol.
        orig = parse_objdump(ORIG, "func_t")
        s = emit_asm("func_t", orig, [(4, "add r3, r4, r3", "add r3, r3, r4")],
                     absorbed_subs={"data_ov002_022cf16c": "data_ov002_022cf000+0x16c"})
        self.assertIn(".word data_ov002_022cf000+0x16c", s)
        self.assertNotIn(".word data_ov002_022cf16c\n", s)
        # unrelated externs/relocs untouched
        self.assertIn("bl func_ov002_021c1ef0", s)

    def test_absorbed_subs_noop_when_no_match(self):
        # a substitution map that doesn't mention this function's symbols
        # must change nothing (safety: never silently rewrite the wrong ref).
        orig = parse_objdump(ORIG, "func_t")
        s_plain = emit_asm("func_t", orig, [(4, "add r3, r4, r3", "add r3, r3, r4")])
        s_with_unrelated_map = emit_asm(
            "func_t", orig, [(4, "add r3, r4, r3", "add r3, r3, r4")],
            absorbed_subs={"data_unrelated_sym": "data_other+0x4"})
        self.assertEqual(s_plain, s_with_unrelated_map)


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


class TestDisasmZeroFlag(unittest.TestCase):
    """brief 375: disasm() must pass objdump `-z` (--disassemble-zeroes) so a
    freshly-assembled all-zero literal pool isn't collapsed to a single `...`
    line — which would drop those words and cascade their relocs onto the
    preceding instruction (a spurious reloc diff vs the delinked orig)."""

    def test_disasm_passes_disassemble_zeroes(self):
        import asm_escape
        captured = {}

        class _R:
            stdout = ""

        def fake_run(cmd, **kw):
            captured["cmd"] = cmd
            return _R()

        orig = asm_escape._run
        asm_escape._run = fake_run
        try:
            asm_escape.disasm("foo.o")
        finally:
            asm_escape._run = orig
        self.assertIn("-z", captured["cmd"])


class TestClassifyDataRefs(unittest.TestCase):
    """brief 406: the kind:data link preflight. Fixtures mirror the real
    shapes: A-aligned = the shipped wave-9 trio (data_…22cad34 has its own
    carved TU); B-gap = uncarved data (dsd gap object defines it GLOBAL);
    C-absorbed = the brief-361 `data_020ff924` bundle-absorption that
    mwldarm Undefined-failed (reproduced live this brief); OFFSET = an
    interior pool word emit_asm would silently truncate; MISADDRESSED = a
    mis-sized/mis-addressed data carve (range starts at no data symbol) —
    the Verify-gate item 7 negative."""

    SYMBOLS = "\n".join([
        "func_test kind:function(arm,size=0x10) addr:0x02000000",
        "data_a kind:data(any) addr:0x02100000",
        "data_b kind:data(any) addr:0x02100010",
        "data_c kind:data(any) addr:0x02100020",
        "bss_x kind:bss addr:0x02200000",
    ])

    @staticmethod
    def _relocs(*targets):
        return "\n".join(
            f"from:0x{0x02000000 + 4 * i:08x} kind:load to:0x{t:08x} module:x"
            for i, t in enumerate(targets))

    def _verdicts(self, relocs, delinks):
        from asm_escape import classify_data_refs
        return classify_data_refs(self.SYMBOLS, relocs, delinks, "func_test")

    def test_a_aligned_carved_tu_links(self):
        v = self._verdicts(
            self._relocs(0x02100000),
            "src/x/data_a.c:\n    complete\n"
            "    .data start:0x02100000 end:0x02100010\n")
        self.assertEqual([x["verdict"] for x in v], ["A-aligned"])

    def test_b_gap_links(self):
        v = self._verdicts(self._relocs(0x02100010), "")
        self.assertEqual([x["verdict"] for x in v], ["B-gap"])

    def test_c_absorbed_refused(self):
        # data_b absorbed into data_a's bundle TU (range spans both) — the
        # brief-361 class: no linkable definition for data_b.
        v = self._verdicts(
            self._relocs(0x02100010),
            "src/x/data_a.c:\n    complete\n"
            "    .data start:0x02100000 end:0x02100020\n")
        self.assertEqual([x["verdict"] for x in v], ["C-absorbed"])
        self.assertIn("data_a", v[0]["note"])
        # brief 541: base/base_addr/offset exposed as explicit fields (not
        # just embedded in the note string) so a caller can compute a
        # base+offset substitution without re-parsing the note.
        self.assertEqual(v[0]["base"], "data_a")
        self.assertEqual(v[0]["base_addr"], 0x02100000)
        self.assertEqual(v[0]["offset"], 0x10)

    def test_offset_interior_word_refused(self):
        # pool word at data_b+4: emit_asm drops the addend -> refuse.
        v = self._verdicts(
            self._relocs(0x02100014),
            "src/x/data_b.c:\n    complete\n"
            "    .data start:0x02100010 end:0x02100020\n")
        self.assertEqual([x["verdict"] for x in v], ["OFFSET"])

    def test_misaddressed_carve_red(self):
        # the negative the brief demands: a carve range starting at NO data
        # symbol (mis-sized/mis-addressed delinks entry) must scream, not pass.
        v = self._verdicts(
            self._relocs(0x02100010),
            "src/x/data_bad.c:\n    complete\n"
            "    .data start:0x0210000c end:0x02100018\n")
        self.assertEqual([x["verdict"] for x in v], ["MISADDRESSED"])

    def test_bss_target_not_gated(self):
        self.assertEqual(self._verdicts(self._relocs(0x02200000), ""), [])

    def test_rodata_carve_counts(self):
        v = self._verdicts(
            self._relocs(0x02100020),
            "src/x/data_c.c:\n    complete\n"
            "    .rodata start:0x02100020 end:0x02100024\n")
        self.assertEqual([x["verdict"] for x in v], ["A-aligned"])


class TestResolveAbsorbedSubstitutions(unittest.TestCase):
    """brief 541: turn C-absorbed verdicts into base+offset substitutions,
    IFF that is the only unlinkable class present in this function's refs.
    Confirmed against the real ov004/ov006 wall autopsy this brief (10
    distinct C-absorbed instances across 15 residual USA/JPN functions,
    every one a clean base+small-offset relationship — see
    docs/research/brief-541-wall-autopsy.md)."""

    def test_pure_c_absorbed_returns_substitution(self):
        verdicts = [{"sym": "data_b", "verdict": "C-absorbed",
                    "base": "data_a", "base_addr": 0x02100000, "offset": 0x10}]
        self.assertEqual(resolve_absorbed_substitutions(verdicts),
                         {"data_b": "data_a+0x10"})

    def test_mixed_a_aligned_and_c_absorbed_still_substitutes(self):
        # matches func_ov006_021bc350's real shape: several A-aligned refs
        # alongside one C-absorbed ref -- only the absorbed one needs a sub.
        verdicts = [
            {"sym": "data_x", "verdict": "A-aligned"},
            {"sym": "data_b", "verdict": "C-absorbed",
             "base": "data_a", "base_addr": 0x02100000, "offset": 0x10},
            {"sym": "data_y", "verdict": "B-gap"},
        ]
        self.assertEqual(resolve_absorbed_substitutions(verdicts),
                         {"data_b": "data_a+0x10"})

    def test_no_c_absorbed_returns_empty_dict_not_none(self):
        # nothing to substitute, but nothing blocking either -- distinct
        # from the None-means-give-up case.
        verdicts = [{"sym": "data_x", "verdict": "A-aligned"}]
        self.assertEqual(resolve_absorbed_substitutions(verdicts), {})

    def test_offset_verdict_blocks_substitution(self):
        # a genuinely different unlinkable class (interior pool-word addend)
        # -- this fix does not address it, caller must still refuse.
        verdicts = [
            {"sym": "data_b", "verdict": "C-absorbed",
             "base": "data_a", "base_addr": 0x02100000, "offset": 0x10},
            {"sym": "data_c", "verdict": "OFFSET"},
        ]
        self.assertIsNone(resolve_absorbed_substitutions(verdicts))

    def test_misaddressed_verdict_blocks_substitution(self):
        verdicts = [
            {"sym": "data_b", "verdict": "C-absorbed",
             "base": "data_a", "base_addr": 0x02100000, "offset": 0x10},
            {"sym": "data_bad", "verdict": "MISADDRESSED"},
        ]
        self.assertIsNone(resolve_absorbed_substitutions(verdicts))

    def test_multiple_c_absorbed_all_substituted(self):
        # matches func_ov006_021ca5e8's real shape: 3 C-absorbed refs into
        # the SAME base at different offsets.
        verdicts = [
            {"sym": "data_b", "verdict": "C-absorbed",
             "base": "data_a", "base_addr": 0x02100000, "offset": 0x2},
            {"sym": "data_c", "verdict": "C-absorbed",
             "base": "data_a", "base_addr": 0x02100000, "offset": 0x6},
            {"sym": "data_d", "verdict": "C-absorbed",
             "base": "data_a", "base_addr": 0x02100000, "offset": 0x24a},
        ]
        self.assertEqual(resolve_absorbed_substitutions(verdicts), {
            "data_b": "data_a+0x2",
            "data_c": "data_a+0x6",
            "data_d": "data_a+0x24a",
        })


class TestThumbMode(unittest.TestCase):
    """brief 406 stretch: the Thumb gap-object fix. parse_objdump must accept
    4-hex halfwords and `xxxx yyyy` 32-bit pairs (bl); to_mwasm_thumb maps the
    UAL spellings onto mwasmarm's legacy Thumb dialect (probed live: the UAL
    flag-setting names are rejected; reg-reg `movs` is the lsls-#0 encoding,
    NOT legacy `mov` which assembles to adds-#0); pool_addrs uses the Thumb
    pc-rel base Align(addr+4, 4)."""

    _THUMB = """\
00000000 <func_thumb>:
   0:\tb5f0      \tpush\t{r4, r5, r6, r7, lr}
   2:\t2000      \tmovs\tr0, #0
   4:\t0019      \tmovs\tr1, r3
   6:\t4902      \tldr\tr1, [pc, #8]\t@ (10 <func_thumb+0x10>)
   8:\tf7ff fffa \tbl\t0 <func_thumb>
\t\t\t8: R_ARM_THM_PC22\tfunc_ext
   c:\td0f8      \tbeq.n\t0 <func_thumb>
   e:\tbdf0      \tpop\t{r4, r5, r6, r7, pc}
  10:\t12345678\t.word\t0x12345678
"""

    def test_parse_halfwords_and_pairs(self):
        words = parse_objdump(self._THUMB, "func_thumb")
        self.assertEqual([w["bytes"] for w in words],
                         ["b5f0", "2000", "0019", "4902", "f7fffffa",
                          "d0f8", "bdf0", "12345678"])
        self.assertEqual(words[4]["reloc"], "func_ext")

    def test_thumb_pool_base(self):
        words = parse_objdump(self._THUMB, "func_thumb")
        # ldr at 0x6: Align(0x6+4, 4) + 8 = 0x8 + 8 = 0x10
        self.assertEqual(pool_addrs(words, thumb=True), {0x10})

    def test_to_mwasm_thumb_dialect(self):
        from asm_escape import to_mwasm_thumb
        self.assertEqual(to_mwasm_thumb("movs r0, #0"), "mov r0, #0")
        self.assertEqual(to_mwasm_thumb("movs r1, r3"), "lsl r1, r3, #0x0")
        self.assertEqual(to_mwasm_thumb("lsls r0, r1, #2"), "lsl r0, r1, #2")
        self.assertEqual(to_mwasm_thumb("adds r0, r0, r1"), "add r0, r0, r1")
        self.assertEqual(to_mwasm_thumb("negs r3, r3"), "neg r3, r3")
        self.assertEqual(to_mwasm_thumb("beq.n 20"), "beq 20")
        self.assertEqual(to_mwasm_thumb("push {r4, lr}"), "push {r4, lr}")
        self.assertEqual(to_mwasm_thumb("cmp r5, #0"), "cmp r5, #0")

    def test_thumb_emit_has_thumb_directive_and_aligned_pool(self):
        words = parse_objdump(self._THUMB, "func_thumb")
        s = emit_asm("func_thumb", words, whole=True, thumb=True)
        self.assertIn(".thumb", s)
        self.assertNotIn(".arm", s)
        self.assertIn(".align 2", s)
        self.assertIn("_LIT0: .word 0x12345678", s)
        self.assertIn("mov r0, #0x0", s)
        self.assertIn("lsl r1, r3, #0x0", s)
        self.assertIn("bl func_ext", s)


class TestIntermediatePool(unittest.TestCase):
    """brief 418: a large function threads an INTERMEDIATE literal pool through
    its code so every `ldr [pc, …]` stays within the ±4 KB ARM offset field.
    Words BEHIND such a load are reached by a backward `[pc, #-N]`; the pool
    must be emitted INLINE at its address (not appended at the end) so the
    pc-relative offsets reproduce byte-for-byte. The fixture: a one-word pool
    island at 0xc reached ONLY by a backward load (the pre-418 blind spot) and
    a second at 0x10 reached by a forward load, with code after both."""

    _MID = """\
00000000 <func_mid>:
   0:\te92d4010 \tpush\t{r4, lr}
   4:\te59f1004 \tldr\tr1, [pc, #4]\t@ 10 <.L_fwd>
   8:\tea000002 \tb\t18 <.L_resume>
   c:\t11111111                                ....
  10:\t22222222                                ....
  14:\te51f3010 \tldr\tr3, [pc, #-16]\t@ c <.L_bwd>
  18:\te8bd8010 \tpop\t{r4, pc}
"""

    def test_backward_load_is_a_pool_word(self):
        # 0xc is reached ONLY by the backward [pc, #-16] at 0x14; the pre-418
        # `#(\d+)` regex missed it, so it leaked into the .s as a `....` word.
        self.assertEqual(pool_addrs(parse_objdump(self._MID, "func_mid")),
                         {0xC, 0x10})

    def test_pool_emitted_inline_not_appended(self):
        s = emit_asm("func_mid", parse_objdump(self._MID, "func_mid"), whole=True)
        # both pool words become inline .word slots (no `....` gutter leak)
        self.assertIn("_LIT0: .word 0x11111111", s)   # the backward-only word
        self.assertIn("_LIT1: .word 0x22222222", s)
        self.assertNotIn("....", s)                    # nothing leaked as data
        self.assertEqual(s.count("11111111"), 1)       # only the .word, no leak
        # forward load -> _LIT1 (0x10), backward load -> _LIT0 (0xc)
        self.assertIn("ldr r1, _LIT1", s)
        self.assertIn("ldr r3, _LIT0", s)
        # INLINE: the pool sits before the trailing pop, not after it
        self.assertLess(s.index("_LIT0: .word"), s.index("ldmia sp!, {r4, pc}"))


class TestDiffWordsPoolGuard(unittest.TestCase):
    """brief 418, Verify-gate item 7: diff_words is the safety net generate_whole
    trusts. The pre-418 comparator tolerated ANY byte mismatch whose rendering
    started with `.word` — but mwasmarm marks every emitted pool word `$d`, so
    objdump prints MY side `.word 0x…` for EVERY pool word, raw constants
    included. A corrupted raw pool constant therefore slipped through GREEN.
    These cases are the RED that must be seen before the green is trusted: the
    corrupted-pool test FAILS against the pre-418 tolerance and passes now."""

    @staticmethod
    def _w(b, mnem, reloc=None):
        return {"addr": 0, "bytes": b, "mnem": mnem, "reloc": reloc}

    def test_identical_raw_pool_matches(self):
        # my side renders `.word 0x…`, orig renders the data gutter; bytes equal
        mine = [self._w("000015d5", ".word 0x000015d5")]
        orig = [self._w("000015d5", "....")]
        self.assertEqual(diff_words(mine, orig), [])

    def test_corrupted_raw_pool_is_flagged_red(self):
        # THE hole: one-bit-off pool constant, my side still renders `.word`.
        # Must be flagged — this assertion is RED against the pre-418 tolerance.
        mine = [self._w("000015d4", ".word 0x000015d4")]
        orig = [self._w("000015d5", "....")]
        self.assertTrue(diff_words(mine, orig),
                        "a corrupted raw pool word MUST be flagged, not tolerated")

    def test_symbol_pointer_matches_by_name(self):
        # a relocated pool pointer: bytes differ by construction (0 + ABS32 vs
        # resolved), so compare by symbol — same symbol -> match
        mine = [self._w("00000000", ".word data_x", "data_ov002_x")]
        orig = [self._w("00000000", "....", "data_ov002_x")]
        self.assertEqual(diff_words(mine, orig), [])

    def test_symbol_pointer_wrong_target_flagged(self):
        mine = [self._w("00000000", ".word data_y", "data_ov002_y")]
        orig = [self._w("00000000", "....", "data_ov002_x")]
        self.assertTrue(diff_words(mine, orig))

    def test_self_pointer_section_reloc_matches(self):
        # mwasm canonicalises `.word func_self` to a relocation against the
        # standalone TU's offset-zero `.text` section. It resolves to the same
        # address as the original function-symbol relocation.
        mine = [self._w("00000000", ".word func_self", ".text")]
        orig = [self._w("00000000", "....", "func_self")]
        self.assertEqual(diff_words(mine, orig, self_func="func_self"), [])

    def test_text_reloc_does_not_mask_another_symbol(self):
        mine = [self._w("00000000", ".word func_other", ".text")]
        orig = [self._w("00000000", "....", "func_other")]
        self.assertTrue(diff_words(mine, orig, self_func="func_self"))

    def test_code_byte_mismatch_flagged(self):
        self.assertTrue(diff_words([self._w("e3a00001", "mov r0, #1")],
                                   [self._w("e3a00000", "mov r0, #0")]))

    def test_extra_word_is_flagged_red(self):
        # zip(..., strict=False) used to compare only the shared prefix, so a
        # truncated or overlong object could verify green.
        orig = [self._w("e12fff1e", "bx lr")]
        mine = orig + [self._w("00000000", ".word 0")]
        self.assertEqual(diff_words(mine, orig),
                         ["word count differs: mine=2 orig=1"])


if __name__ == "__main__":
    unittest.main()
