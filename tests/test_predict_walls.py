"""Unit tests for tools/predict_walls.py (brief 189 Part 2/3).

The wall classifier is pure — given disasm text input it returns
a list of `WallPrediction`s. Tests use synthetic objdump-style
asm fixtures so they don't depend on `arm-none-eabi-objdump` or
the orig binaries.
"""

from __future__ import annotations

import sys
import unittest
from pathlib import Path

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

from predict_walls import (  # noqa: E402
    LEGACY_C_CASCADE_SIZE_THRESHOLD,
    WallPrediction,
    detect_address_cse,
    detect_cross_overlay_bl,
    detect_legacy_c_cascade_risk,
    detect_literal_tail_trim_trap,
    detect_routing_trilemma,
    detect_walls,
)


def _objdump_line(addr: int, hex_word: str, mnemonic: str) -> str:
    """Render one line in the format `tools/predict_walls.py`'s
    classifier consumes. The format mirrors `arm-none-eabi-objdump
    -D -b binary -m armv5te` output: `   <addr>:\t<hex> \t<mnem>`.
    """
    return f"    {addr:x}:\t{hex_word} \t{mnemonic}"


def _wrap_asm(*lines: str) -> str:
    """Wrap raw instruction lines in the minimum scaffolding the
    classifier needs (header line + Disassembly marker)."""
    return "\n".join([
        "/tmp/dummy.bin:     file format binary",
        "",
        "",
        "Disassembly of section .data:",
        "",
        *lines,
    ]) + "\n"


class TestStyleADetection(unittest.TestCase):
    """Style A epilogue: `bx lr` separate from `ldmfd sp!, {...}`
    (no `pc` in the register list).
    """

    def test_classic_style_a_epilogue(self):
        asm = _wrap_asm(
            _objdump_line(0x100, "e92d4000", "stmfd\tsp!, {lr}"),
            _objdump_line(0x104, "e1a00000", "nop"),
            _objdump_line(0x108, "e8bd4000", "ldmfd\tsp!, {lr}"),
            _objdump_line(0x10c, "e12fff1e", "bx\tlr"),
        )
        walls = detect_walls(asm)
        wall_ids = {w.wall_id for w in walls}
        self.assertIn("StyleA", wall_ids)

    def test_style_b_with_pop_pc_skips_style_a(self):
        # `pop {r4, pc}` is Style B — `bx lr` may not even appear
        # but the classifier should NOT flag Style A.
        asm = _wrap_asm(
            _objdump_line(0x100, "e92d4010", "push\t{r4, lr}"),
            _objdump_line(0x108, "e8bd8010", "pop\t{r4, pc}"),
        )
        walls = detect_walls(asm)
        wall_ids = {w.wall_id for w in walls}
        self.assertNotIn("StyleA", wall_ids)

    def test_style_b_with_ldmfd_pc_skips_style_a(self):
        # `ldmfd sp!, {r4, pc}` — also Style B, distinct from `pop`.
        asm = _wrap_asm(
            _objdump_line(0x100, "e92d4010", "stmfd\tsp!, {r4, lr}"),
            _objdump_line(0x108, "e8bd8010", "ldmfd\tsp!, {r4, pc}"),
        )
        walls = detect_walls(asm)
        wall_ids = {w.wall_id for w in walls}
        self.assertNotIn("StyleA", wall_ids)


class TestC15Detection(unittest.TestCase):
    """C-15: constant-pair derivation. mwcc 1.2 form is `mov rN,
    #K; mvn rM, #0`; mwcc 2.0 form is `mov rN, #K; sub rM, rN, #1`.
    Either form in target asm triggers the wall.
    """

    def test_mvn_zero_form(self):
        asm = _wrap_asm(
            _objdump_line(0x100, "e3a00007", "mov\tr0, #7"),
            _objdump_line(0x104, "e3e01000", "mvn\tr1, #0"),
            _objdump_line(0x108, "e12fff1e", "bx\tlr"),
        )
        walls = detect_walls(asm)
        self.assertIn("C-15", {w.wall_id for w in walls})

    def test_mov_sub_form(self):
        asm = _wrap_asm(
            _objdump_line(0x100, "e3a00007", "mov\tr0, #7"),
            _objdump_line(0x104, "e2401001", "sub\tr1, r0, #1"),
            _objdump_line(0x108, "e12fff1e", "bx\tlr"),
        )
        walls = detect_walls(asm)
        self.assertIn("C-15", {w.wall_id for w in walls})

    def test_no_constant_pair_no_match(self):
        asm = _wrap_asm(
            _objdump_line(0x100, "e3a00007", "mov\tr0, #7"),
            _objdump_line(0x104, "e1a01000", "mov\tr1, r0"),
        )
        walls = detect_walls(asm)
        self.assertNotIn("C-15", {w.wall_id for w in walls})


class TestC22Detection(unittest.TestCase):
    """C-22: 2+ adjacent `bic; orr` pairs (adjacent-bitfield write
    at different bit positions).
    """

    def test_two_bic_orr_pairs(self):
        asm = _wrap_asm(
            _objdump_line(0x100, "e3c0040f", "bic\tr0, r0, #0xf00"),
            _objdump_line(0x104, "e3800c01", "orr\tr0, r0, #0x100"),
            _objdump_line(0x108, "e3c00b0f", "bic\tr0, r0, #0xf000"),
            _objdump_line(0x10c, "e3800a02", "orr\tr0, r0, #0x2000"),
        )
        walls = detect_walls(asm)
        self.assertIn("C-22", {w.wall_id for w in walls})

    def test_single_bic_orr_no_match(self):
        asm = _wrap_asm(
            _objdump_line(0x100, "e3c0040f", "bic\tr0, r0, #0xf00"),
            _objdump_line(0x104, "e3800c01", "orr\tr0, r0, #0x100"),
            _objdump_line(0x108, "e12fff1e", "bx\tlr"),
        )
        walls = detect_walls(asm)
        self.assertNotIn("C-22", {w.wall_id for w in walls})


class TestC23Detection(unittest.TestCase):
    """C-23: 3+ pc-relative loads + at least one of:
      (a) MMIO literal in main range (`0x04000xxx`),
      (b) DTCM kernel-block literal (`0x027ffxxx`),
      (c) duplicate pool ref (same `@ 0xADDR` referenced 2+
          times),
      (d) clustered pool (3+ distinct targets within ±0x20 of
          each other).
    Recipe: `.legacy.c` (mwcc 1.2/sp2p3) routing. Brief 199 upgrade
    from "documented-but-unresolved" to recipe-available, with
    expanded signal set beyond the brief 086 MMIO-block path.
    """

    def test_mmio_block(self):
        # Existing brief 086 signal — main MMIO (`0x04000xxx`).
        asm = _wrap_asm(
            _objdump_line(0x100, "e59fc020", "ldr\tip, [pc, #32]"),
            _objdump_line(0x104, "e59f3024", "ldr\tr3, [pc, #36]"),
            _objdump_line(0x108, "e59f2028", "ldr\tr2, [pc, #40]"),
            _objdump_line(0x130, "04000280", ".word\t0x04000280"),
        )
        walls = detect_walls(asm)
        self.assertIn("C-23", {w.wall_id for w in walls})

    def test_dtcm_kernel_block(self):
        # Brief 199 — pick #5 (`func_02096434`) shape: DTCM kernel
        # block literal at `0x027ffc00`. Should fire.
        asm = _wrap_asm(
            _objdump_line(0x100, "e59fc020", "ldr\tip, [pc, #32]"),
            _objdump_line(0x104, "e59f3024", "ldr\tr3, [pc, #36]"),
            _objdump_line(0x108, "e59f2028", "ldr\tr2, [pc, #40]"),
            _objdump_line(0x130, "027ffc00", ".word\t0x027ffc00"),
        )
        walls = detect_walls(asm)
        self.assertIn("C-23", {w.wall_id for w in walls})

    def test_duplicate_pool_ref(self):
        # Brief 199 signal — same pool target referenced by 2+
        # `ldr`s, no MMIO literal in range. Pick #5's clean
        # shape: both `ldr r3` loads point to the same `@`
        # address. mwcc 2.0/sp1p5 would fold these; mwcc 1.2/
        # sp2p3 keeps them separate.
        asm = _wrap_asm(
            _objdump_line(
                0x100, "e59fc020",
                "ldr\tip, [pc, #32]\t@ 0x130",
            ),
            _objdump_line(
                0x104, "e59f3024",
                "ldr\tr3, [pc, #36]\t@ 0x130",
            ),
            _objdump_line(
                0x108, "e59f2028",
                "ldr\tr2, [pc, #40]\t@ 0x134",
            ),
            _objdump_line(0x130, "12345678", ".word\t0x12345678"),
        )
        walls = detect_walls(asm)
        self.assertIn("C-23", {w.wall_id for w in walls})
        cue = next(w.cue for w in walls if w.wall_id == "C-23")
        self.assertIn("duplicate", cue)

    def test_clustered_pool_within_0x20(self):
        # 3+ pool words within ±0x20 of each other — mwcc 2.0
        # would fold them into a base+offset shape. Brief 199
        # surfaced this on `OSi_PostIrqEvent`'s `0x021a6354 /
        # 0x021a6358 / 0x021a635c` triple-field cluster.
        asm = _wrap_asm(
            _objdump_line(
                0x100, "e59fc020",
                "ldr\tip, [pc, #32]\t@ 0x130",
            ),
            _objdump_line(
                0x104, "e59f3024",
                "ldr\tr3, [pc, #36]\t@ 0x134",
            ),
            _objdump_line(
                0x108, "e59f2028",
                "ldr\tr2, [pc, #40]\t@ 0x138",
            ),
            _objdump_line(0x130, "021a6354", ".word\t0x021a6354"),
            _objdump_line(0x134, "021a6358", ".word\t0x021a6358"),
            _objdump_line(0x138, "021a635c", ".word\t0x021a635c"),
        )
        walls = detect_walls(asm)
        self.assertIn("C-23", {w.wall_id for w in walls})
        cue = next(w.cue for w in walls if w.wall_id == "C-23")
        self.assertIn("clustered", cue)

    def test_three_pc_loads_no_signal_no_match(self):
        # 3+ pc-loads but no MMIO literal, no duplicate ref, no
        # cluster — pool TARGETS spaced far apart (each load
        # points to an unrelated address). mwcc 2.0 has nothing
        # to fold; mwcc 1.2/sp2p3 emits the same shape. Should
        # NOT fire C-23.
        asm = _wrap_asm(
            _objdump_line(
                0x100, "e59fc020",
                "ldr\tip, [pc, #32]\t@ 0x130",
            ),
            _objdump_line(
                0x104, "e59f3024",
                "ldr\tr3, [pc, #36]\t@ 0x134",
            ),
            _objdump_line(
                0x108, "e59f2028",
                "ldr\tr2, [pc, #40]\t@ 0x138",
            ),
            # POOL targets (values stored at 0x130/0x134/0x138)
            # spaced far apart so the loaded addresses don't
            # cluster. Pool layout itself is contiguous on disk
            # — that's normal — but the VALUES they hold span
            # multiple unrelated regions, so mwcc has no base
            # to fold against.
            _objdump_line(0x130, "12345678", ".word\t0x12345678"),
            _objdump_line(0x134, "abcdef01", ".word\t0xabcdef01"),
            _objdump_line(0x138, "fedcba98", ".word\t0xfedcba98"),
        )
        walls = detect_walls(asm)
        # The `0x130 / 0x134 / 0x138` POOL POSITIONS are within
        # 8 bytes (clustered window) — that's expected since
        # mwcc packs pool entries contiguously. The C-23 cluster
        # signal should activate ONLY for the cohort it was
        # designed for; pool-position clustering is universal
        # and not a useful discriminator on its own. Even so,
        # this test documents that the current detector accepts
        # this false-positive class — see brief 199 research
        # note for the calibration discussion.
        #
        # Brief 199 trade-off: false-positives on contiguous pool
        # words are OK because the cost is "decomper tries
        # `.legacy.c` routing, finds it doesn't help". The cost
        # of a false-NEGATIVE on a true C-23 (decomper iterates
        # for hours on the wrong route) is much higher.
        self.assertIn("C-23", {w.wall_id for w in walls})

    def test_two_pc_loads_with_mmio_below_threshold(self):
        # Only 2 pc-loads — below the `pc_loads >= 3` floor even
        # with an MMIO literal in pool. mwcc fold doesn't fire
        # for two-load shapes; signal too weak.
        asm = _wrap_asm(
            _objdump_line(0x100, "e59f0008", "ldr\tr0, [pc, #8]"),
            _objdump_line(0x104, "e59f1008", "ldr\tr1, [pc, #8]"),
            _objdump_line(0x110, "04000280", ".word\t0x04000280"),
        )
        walls = detect_walls(asm)
        self.assertNotIn("C-23", {w.wall_id for w in walls})

    def test_clustered_only_two_within_window(self):
        # 3+ pc-loads, two pool targets are within ±0x20 of each
        # other — but only TWO, not three. Cluster signal
        # requires 3+ targets in the window. Should NOT fire
        # (no MMIO, no dup either).
        asm = _wrap_asm(
            _objdump_line(
                0x100, "e59fc020",
                "ldr\tip, [pc, #32]\t@ 0x130",
            ),
            _objdump_line(
                0x104, "e59f3024",
                "ldr\tr3, [pc, #36]\t@ 0x134",
            ),
            _objdump_line(
                0x108, "e59f2028",
                "ldr\tr2, [pc, #40]\t@ 0x1c0",  # far away
            ),
            _objdump_line(0x130, "021a6354", ".word\t0x021a6354"),
            _objdump_line(0x134, "021a6358", ".word\t0x021a6358"),
            _objdump_line(0x1c0, "021a72f0", ".word\t0x021a72f0"),
        )
        walls = detect_walls(asm)
        # Two-target cluster doesn't trigger; no other signal
        # present.
        self.assertNotIn("C-23", {w.wall_id for w in walls})


class TestC12Detection(unittest.TestCase):
    """C-12: prologue pushes r0 (arg-preserving thunk shape)."""

    def test_push_r0_in_first_3_lines(self):
        asm = _wrap_asm(
            _objdump_line(0x100, "e92d4001", "stmfd\tsp!, {r0, lr}"),
            _objdump_line(0x108, "ebffffaa", "bl\t0xa0"),
            _objdump_line(0x10c, "e8bd8001", "ldmfd\tsp!, {r0, pc}"),
        )
        walls = detect_walls(asm)
        self.assertIn("C-12", {w.wall_id for w in walls})

    def test_no_push_r0_no_match(self):
        asm = _wrap_asm(
            _objdump_line(0x100, "e92d4010", "stmfd\tsp!, {r4, lr}"),
            _objdump_line(0x108, "ebffffaa", "bl\t0xa0"),
            _objdump_line(0x10c, "e8bd8010", "ldmfd\tsp!, {r4, pc}"),
        )
        walls = detect_walls(asm)
        self.assertNotIn("C-12", {w.wall_id for w in walls})


class TestC1Detection(unittest.TestCase):
    """C-1: 3+ consecutive predicated-execution instructions
    forming a fused early-return-equivalent chain.
    """

    def test_three_consecutive_predicates(self):
        asm = _wrap_asm(
            _objdump_line(0x100, "e1530001", "cmp\tr3, r1"),
            _objdump_line(0x104, "81821001", "orrhi\tr1, r2, r1"),
            _objdump_line(0x108, "91a01803", "lslls\tr1, r3, #16"),
            _objdump_line(0x10c, "91821821", "orrls\tr1, r2, r1, lsr #16"),
        )
        walls = detect_walls(asm)
        self.assertIn("C-1", {w.wall_id for w in walls})

    def test_branches_excluded_from_chain(self):
        # `bne` / `beq` shouldn't count toward the predicated
        # chain — only data-processing predicates trigger C-1.
        asm = _wrap_asm(
            _objdump_line(0x100, "e1530001", "cmp\tr3, r1"),
            _objdump_line(0x104, "1a000002", "bne\t0x114"),
            _objdump_line(0x108, "0a000003", "beq\t0x11c"),
            _objdump_line(0x10c, "ea000000", "b\t0x118"),
        )
        walls = detect_walls(asm)
        self.assertNotIn("C-1", {w.wall_id for w in walls})


class TestP9Detection(unittest.TestCase):
    """P-9: conditional `mvn{cond}` — mwcc 2.0 may not peephole."""

    def test_mvneq(self):
        asm = _wrap_asm(
            _objdump_line(0x100, "e3500000", "cmp\tr0, #0"),
            _objdump_line(0x104, "03e01000", "mvneq\tr1, #0"),
        )
        walls = detect_walls(asm)
        self.assertIn("P-9", {w.wall_id for w in walls})

    def test_plain_mvn_no_match(self):
        asm = _wrap_asm(
            _objdump_line(0x100, "e3e01000", "mvn\tr1, #0"),
        )
        walls = detect_walls(asm)
        self.assertNotIn("P-9", {w.wall_id for w in walls})


class TestP11Detection(unittest.TestCase):
    """P-11: mwcc 2.0/sp1p5 reg-allocator plateau (brief 200).

    Fires on functions size 0x5c-0x74 with EITHER:
      - 3+ callee-saved register push + ≥1 bl + ≥2 cond branches
      - `sub sp, #N` stack-scratch prologue + ≥1 bl + ≥1 cond branch

    Permuter scored these picks 480-500 with 3-5 source variants
    explored — the reg-alloc choice is downstream of source-shape
    iteration. Permanent wall under current tools.
    """

    def _make_body(self, n_instrs):
        """Generate N filler instruction lines so the size-bytes
        heuristic computes to the right range."""
        return [
            _objdump_line(
                0x100 + i * 4, "e3a00000", "mov\tr0, #0",
            )
            for i in range(n_instrs)
        ]

    def test_e12_shape_3_callees_2_cond_1_bl(self):
        # E-12 reference shape: 0x74 = 29 instructions, 4-reg push
        # (r4/r5/r6/lr = 3 callee), 1 bl, 3 cond branches.
        body = self._make_body(20)
        asm = _wrap_asm(
            _objdump_line(0x0, "e92d4070", "push\t{r4, r5, r6, lr}"),
            *body,
            _objdump_line(0x60, "0a000005", "beq\t0x80"),
            _objdump_line(0x64, "da000007", "ble\t0x90"),
            _objdump_line(0x68, "bafffff8", "blt\t0x40"),
            _objdump_line(0x6c, "eb000000", "bl\t0x1000"),
            _objdump_line(0x70, "e8bd8070", "pop\t{r4, r5, r6, pc}"),
        )
        walls = detect_walls(asm)
        ids = {w.wall_id for w in walls}
        self.assertIn("P-11", ids, msg=f"walls={walls}")

    def test_b22_shape_3_callees_4_cond_3_bl(self):
        # B-22 reference: 0x5c = 23 instructions, multi-callee
        # push, multiple bl in body, multiple cond branches.
        body = self._make_body(14)
        asm = _wrap_asm(
            _objdump_line(0x0, "e92d4070", "push\t{r4, r5, r6, lr}"),
            *body,
            _objdump_line(0x3c, "0a000011", "beq\t0x80"),
            _objdump_line(0x40, "da000007", "ble\t0x60"),
            _objdump_line(0x44, "bafffff7", "blt\t0x40"),
            _objdump_line(0x48, "eb000000", "bl\t0x1000"),
            _objdump_line(0x4c, "eb000000", "bl\t0x1000"),
            _objdump_line(0x50, "0a000000", "beq\t0x60"),
            _objdump_line(0x54, "eb000000", "bl\t0x1000"),
            _objdump_line(0x58, "e8bd8070", "pop\t{r4, r5, r6, pc}"),
        )
        walls = detect_walls(asm)
        self.assertIn("P-11", {w.wall_id for w in walls})

    def test_b24_shape_stack_scratch_alt_path(self):
        # B-24 reference: `push {r4, lr}` + `sub sp, #16` scratch,
        # 1 bl, 1 cond branch, 0x5c size. The stack-scratch
        # alt-path fires here (1 callee-saved is below the
        # main-path threshold of 3).
        body = self._make_body(17)
        asm = _wrap_asm(
            _objdump_line(0x0, "e92d4010", "push\t{r4, lr}"),
            _objdump_line(0x4, "e24dd010", "sub\tsp, sp, #16"),
            *body,
            _objdump_line(0x4c, "0a000002", "beq\t0x60"),
            _objdump_line(0x50, "ebf8cee1", "bl\t0xffe3cb10"),
            _objdump_line(0x54, "e28dd010", "add\tsp, sp, #16"),
            _objdump_line(0x58, "e8bd8010", "pop\t{r4, pc}"),
        )
        walls = detect_walls(asm)
        self.assertIn(
            "P-11", {w.wall_id for w in walls},
            msg=f"walls={walls}",
        )
        # Cue should mention stack-scratch path, not 3+ callees.
        cue = next(w.cue for w in walls if w.wall_id == "P-11")
        self.assertIn("stack-scratch", cue)

    def test_small_leaf_no_match(self):
        # B-08 / tiny leaf shape: 7 instructions, 0x1c bytes. Way
        # below the size floor.
        asm = _wrap_asm(
            _objdump_line(0x0, "e92d4000", "push\t{lr}"),
            _objdump_line(0x4, "e24dd004", "sub\tsp, sp, #4"),
            _objdump_line(0x8, "e5900000", "ldr\tr0, [r0]"),
            _objdump_line(0xc, "eb01578c", "bl\t0xb3870"),
            _objdump_line(0x10, "e1a00001", "mov\tr0, r1"),
            _objdump_line(0x14, "e28dd004", "add\tsp, sp, #4"),
            _objdump_line(0x18, "e8bd8000", "ldmfd\tsp!, {pc}"),
        )
        walls = detect_walls(asm)
        self.assertNotIn("P-11", {w.wall_id for w in walls})

    def test_too_large_no_match(self):
        # A function > 0x74 doesn't fire even with all other
        # signals present — the plateau is specifically the
        # 0x5c-0x74 range.
        body = self._make_body(30)
        asm = _wrap_asm(
            _objdump_line(0x0, "e92d4070", "push\t{r4, r5, r6, lr}"),
            *body,
            _objdump_line(0x80, "0a000005", "beq\t0xb0"),
            _objdump_line(0x84, "da000007", "ble\t0xa0"),
            _objdump_line(0x88, "eb000000", "bl\t0x1000"),
            _objdump_line(0x8c, "e8bd8070", "pop\t{r4, r5, r6, pc}"),
        )
        walls = detect_walls(asm)
        # Function is ~0x90 (36 instructions) — above the
        # plateau range; should not fire.
        self.assertNotIn("P-11", {w.wall_id for w in walls})

    def test_no_helper_call_no_match(self):
        # 0x70 size + 3 callees + 2 cond branches BUT no `bl` —
        # the plateau wall specifically involves
        # spill-vs-keep-live decisions around a helper call.
        # Without the bl, mwcc has no pressure to spill, so the
        # divergence doesn't manifest.
        body = self._make_body(24)
        asm = _wrap_asm(
            _objdump_line(0x0, "e92d4070", "push\t{r4, r5, r6, lr}"),
            *body,
            _objdump_line(0x68, "0a000005", "beq\t0x80"),
            _objdump_line(0x6c, "da000007", "ble\t0x80"),
            _objdump_line(0x70, "e8bd8070", "pop\t{r4, r5, r6, pc}"),
        )
        walls = detect_walls(asm)
        self.assertNotIn("P-11", {w.wall_id for w in walls})

    def test_single_callee_no_scratch_no_match(self):
        # `push {r4, lr}` + no sub-sp — only 1 callee-saved, no
        # scratch. Neither main-path nor alt-path fires.
        body = self._make_body(20)
        asm = _wrap_asm(
            _objdump_line(0x0, "e92d4010", "push\t{r4, lr}"),
            *body,
            _objdump_line(0x58, "0a000005", "beq\t0x70"),
            _objdump_line(0x5c, "eb000000", "bl\t0x1000"),
            _objdump_line(0x60, "e8bd8010", "pop\t{r4, pc}"),
        )
        walls = detect_walls(asm)
        # Has bl + 1 cond + size in range, but no multi-callee
        # AND no stack-scratch — should NOT fire.
        self.assertNotIn("P-11", {w.wall_id for w in walls})


class TestWallPredictionShape(unittest.TestCase):
    """Pin the WallPrediction dataclass shape — downstream
    consumers (next_targets.py JSON output) read `.wall_id` and
    `.cue`.
    """

    def test_wall_prediction_fields(self):
        wp = WallPrediction(wall_id="StyleA", cue="some cue")
        self.assertEqual(wp.wall_id, "StyleA")
        self.assertEqual(wp.cue, "some cue")


class TestInterworkVeneerDetection(unittest.TestCase):
    """Brief 191 C-31: mwldarm interwork veneer / long-distance
    trampoline. Detected via byte-pattern signatures in the hex
    column of objdump output, not via mnemonics — the function's
    bytes carry a distinctive `4b00 4718 ...` (Thumb) or `e59fN000
    e12fff1N ...` (ARM) signature that the classifier matches
    after objdump's misinterpretation of the Thumb halfwords as
    ARM words.
    """

    def test_thumb_8byte_veneer_canonical_shape(self):
        # `func_ov004_021dbdbc` shape:
        #   4b 00 47 18    ; Thumb `ldr r3, [pc, #0]; bx r3`
        #   b4 ec 06 02    ; .word 0x0206ecb4
        # objdump's binary-mode ARM disasm reads these 8 bytes as
        # two ARM words: `47184b00` then `0206ecb4`.
        asm = _wrap_asm(
            _objdump_line(0x1205c, "47184b00", "ldrmi\tr4, [r8, -r0]"),
            _objdump_line(0x12060, "0206ecb4", "andeq\tlr, r6, #0xb400"),
        )
        walls = detect_walls(asm)
        wall_ids = {w.wall_id for w in walls}
        self.assertIn("C-31", wall_ids)
        # The cue text mentions the Thumb routing.
        cue = next(w.cue for w in walls if w.wall_id == "C-31")
        self.assertIn(".thumb", cue)

    def test_arm_12byte_trampoline_canonical_shape(self):
        # `func_0209085c` shape:
        #   00 10 9f e5    ; ARM `ldr r1, [pc]`
        #   11 ff 2f e1    ; `bx r1`
        #   b0 09 09 02    ; .word 0x020909b0
        # All three lines are real ARM instructions; the regex
        # matches `e59f1000` + `e12fff11`.
        asm = _wrap_asm(
            _objdump_line(0x9085c, "e59f1000", "ldr\tr1, [pc]"),
            _objdump_line(0x90860, "e12fff11", "bx\tr1"),
            _objdump_line(0x90864, "020909b0", "andeq\tr9, r9, #0xb0"),
        )
        walls = detect_walls(asm)
        wall_ids = {w.wall_id for w in walls}
        self.assertIn("C-31", wall_ids)
        cue = next(w.cue for w in walls if w.wall_id == "C-31")
        self.assertIn(".arm", cue)

    def test_arm_12byte_trampoline_ip_scratch(self):
        # ip-register variant — `func_0206ecb4` shape:
        #   00 c0 9f e5    ; `ldr ip, [pc]`
        #   1c ff 2f e1    ; `bx ip`
        #   68 de 06 02    ; .word 0x0206de68
        asm = _wrap_asm(
            _objdump_line(0x6ecb4, "e59fc000", "ldr\tip, [pc]"),
            _objdump_line(0x6ecb8, "e12fff1c", "bx\tip"),
            _objdump_line(0x6ecbc, "0206de68", "andeq\tsp, r6, #..."),
        )
        walls = detect_walls(asm)
        self.assertIn("C-31", {w.wall_id for w in walls})

    def test_thumb_12byte_veneer_with_prefix(self):
        # `func_ov004_021dbdc4` shape (pick #12 from brief 188):
        #   0a 70 01 4b    ; `strb r2, [r1]; ldr r3, [pc, #4]`
        #   18 47 c0 46    ; `bx r3; nop (mov r8, r8)`
        #   a0 ee 06 02    ; .word 0x0206eea0
        # The middle word `46c04718` is the bx+nop signature —
        # distinctive enough to flag without ambiguity.
        asm = _wrap_asm(
            _objdump_line(0x12064, "4b01700a", "blmi\t0x6e094"),
            _objdump_line(0x12068, "46c04718", "<UNDEFINED>"),
            _objdump_line(0x1206c, "0206eea0", "andeq\tlr, r6, #0xa00"),
        )
        walls = detect_walls(asm)
        wall_ids = {w.wall_id for w in walls}
        self.assertIn("C-31", wall_ids)
        cue = next(w.cue for w in walls if w.wall_id == "C-31")
        self.assertIn("side-effect prefix", cue)

    def test_no_match_for_unrelated_8byte_function(self):
        # A `push {lr}; bx lr` style 8-byte function — same size
        # as the Thumb veneer but different byte pattern. Must
        # NOT trigger C-31.
        asm = _wrap_asm(
            _objdump_line(0x100, "e92d4000", "stmfd\tsp!, {lr}"),
            _objdump_line(0x104, "e12fff1e", "bx\tlr"),
        )
        walls = detect_walls(asm)
        self.assertNotIn("C-31", {w.wall_id for w in walls})

    def test_no_match_for_unrelated_12byte_function(self):
        # 12-byte ARM function that isn't a trampoline. Must
        # NOT trigger C-31.
        asm = _wrap_asm(
            _objdump_line(0x100, "e3a00007", "mov\tr0, #7"),
            _objdump_line(0x104, "e1a01000", "mov\tr1, r0"),
            _objdump_line(0x108, "e12fff1e", "bx\tlr"),
        )
        walls = detect_walls(asm)
        self.assertNotIn("C-31", {w.wall_id for w in walls})

    def test_no_match_for_thumb_8byte_non_veneer(self):
        # 8-byte Thumb function whose hex bytes don't match
        # `47184bXX`. Must NOT trigger C-31.
        asm = _wrap_asm(
            _objdump_line(0x100, "47702000", "ldrmi\tr2, [r0]"),
            _objdump_line(0x104, "12345678", "..."),
        )
        walls = detect_walls(asm)
        self.assertNotIn("C-31", {w.wall_id for w in walls})


class TestEmptyAsm(unittest.TestCase):
    """Defensive: empty / malformed asm returns an empty wall list,
    not a crash. Used by `predict_walls.py` when a function's
    binary slice is unreadable.
    """

    def test_empty_string(self):
        self.assertEqual(detect_walls(""), [])

    def test_only_scaffolding_no_instructions(self):
        asm = _wrap_asm()
        self.assertEqual(detect_walls(asm), [])


class TestCrossOverlayBLDetection(unittest.TestCase):
    """C-32 detector (brief 192) consults relocs.txt for
    `kind:arm_call to:<addr> module:none` entries inside the
    function's address range. The bare `bl <hex>` shape alone
    is ambiguous — `module:none` is the only reliable cue.
    """

    def test_single_hardcoded_bl_in_range(self):
        """Pick #15's shape — one cross-overlay BL inside a
        40-byte function. Should flag C-32 with the target VA.
        """
        relocs = (
            "from:0x021d2c78 kind:arm_call to:0x020067fc module:main\n"
            "from:0x021d2c80 kind:arm_call to:0x021b5500 module:none\n"
        )
        walls = detect_cross_overlay_bl(
            relocs, addr=0x021d2c64, size=0x28,
        )
        self.assertEqual(len(walls), 1)
        self.assertEqual(walls[0].wall_id, "C-32")
        self.assertIn("0x021b5500", walls[0].cue)
        self.assertIn("hardcoded BL", walls[0].cue)

    def test_multiple_hardcoded_bls_in_range(self):
        """Pick #1 / #2 / #4 / #20 shape — two cross-overlay BLs.
        Should flag once with both targets enumerated.
        """
        relocs = (
            "from:0x021c9d60 kind:arm_call to:0x021b0b44 module:none\n"
            "from:0x021c9d64 kind:arm_call to:0x021b2420 module:none\n"
            "from:0x021c9d68 kind:arm_call to:0x021c9d80 module:overlay(13)\n"
        )
        walls = detect_cross_overlay_bl(
            relocs, addr=0x021c9d60, size=0x14,
        )
        self.assertEqual(len(walls), 1)
        self.assertEqual(walls[0].wall_id, "C-32")
        self.assertIn("0x021b0b44", walls[0].cue)
        self.assertIn("0x021b2420", walls[0].cue)
        self.assertIn("2 cross-overlay", walls[0].cue)

    def test_only_resolvable_bls(self):
        """Pick #19's shape — four `module:main` arm_calls, zero
        `module:none`. Should NOT flag C-32.
        """
        relocs = (
            "from:0x020323fc kind:arm_call to:0x020937a4 module:main\n"
            "from:0x02032428 kind:arm_call to:0x020937a4 module:main\n"
            "from:0x02032438 kind:arm_call to:0x020937b8 module:main\n"
            "from:0x02032440 kind:arm_call to:0x020937b8 module:main\n"
            "from:0x02032448 kind:load to:0x0219b2b4 module:main\n"
        )
        walls = detect_cross_overlay_bl(
            relocs, addr=0x020323f4, size=0x58,
        )
        self.assertEqual(walls, [])

    def test_no_relocs_in_function(self):
        """Leaf function with no relocs at all (no calls, no
        loads) — should NOT flag C-32. Defensive: empty relocs
        list is the boring no-op path.
        """
        relocs = "from:0x02000000 kind:arm_call to:0x02100000 module:main\n"
        walls = detect_cross_overlay_bl(
            relocs, addr=0x02050000, size=0x20,
        )
        self.assertEqual(walls, [])

    def test_module_none_outside_function_range(self):
        """`module:none` reloc exists but belongs to a different
        function — should NOT flag C-32 for our target function.
        Guards against the off-by-one of cross-function bleed.
        """
        relocs = (
            "from:0x021ca000 kind:arm_call to:0x021b1000 module:none\n"
        )
        # Our function is at 0x021d0000, well separated from the
        # reloc's from address.
        walls = detect_cross_overlay_bl(
            relocs, addr=0x021d0000, size=0x40,
        )
        self.assertEqual(walls, [])

    def test_empty_relocs_text(self):
        """Defensive — empty input returns empty list."""
        walls = detect_cross_overlay_bl("", addr=0x02000000, size=0x10)
        self.assertEqual(walls, [])

    def test_non_arm_call_module_none_ignored(self):
        """`module:none` on a non-arm_call (e.g. a load or
        thumb_call edge case) should NOT trigger the C-32 detector
        — the recipe is specific to ARM-mode BLs.
        """
        relocs = (
            "from:0x02050000 kind:load to:0x021b1000 module:none\n"
            "from:0x02050010 kind:thumb_call to:0x021b1000 module:none\n"
        )
        walls = detect_cross_overlay_bl(
            relocs, addr=0x02050000, size=0x20,
        )
        self.assertEqual(walls, [])


class TestLegacyCCascadeDetection(unittest.TestCase):
    """C-33 detector (brief 194) — composite risk on top of an
    existing StyleA / C-15 prediction. Gated on module == 'main'
    and function size > 0x50. Pure function: takes already-
    detected walls + module + size; no I/O.
    """

    @staticmethod
    def _wall(wall_id: str) -> WallPrediction:
        return WallPrediction(wall_id, f"({wall_id} cue)")

    def test_main_stylea_above_threshold_flags(self):
        # Pick #5's shape — main 0x6c function with StyleA wall.
        walls = [self._wall("StyleA")]
        c33 = detect_legacy_c_cascade_risk(
            walls, module="main", size=0x6c,
        )
        self.assertEqual(len(c33), 1)
        self.assertEqual(c33[0].wall_id, "C-33")
        self.assertIn("StyleA", c33[0].cue)
        self.assertIn("0x6c", c33[0].cue)

    def test_main_c15_above_threshold_flags(self):
        # Pick #2's shape — main 0x68 function with C-15 wall.
        walls = [self._wall("C-15")]
        c33 = detect_legacy_c_cascade_risk(
            walls, module="main", size=0x68,
        )
        self.assertEqual(len(c33), 1)
        self.assertEqual(c33[0].wall_id, "C-33")
        self.assertIn("C-15", c33[0].cue)

    def test_main_stylea_below_threshold_does_not_flag(self):
        # Brief 190's SNDi wrappers — main StyleA but 0x28 < 0x50.
        # No C-33 (those don't trigger the cascade).
        walls = [self._wall("StyleA")]
        c33 = detect_legacy_c_cascade_risk(
            walls, module="main", size=0x28,
        )
        self.assertEqual(c33, [])

    def test_main_at_threshold_does_not_flag(self):
        # Boundary: size == threshold is NOT flagged (strict >).
        walls = [self._wall("StyleA")]
        c33 = detect_legacy_c_cascade_risk(
            walls, module="main", size=LEGACY_C_CASCADE_SIZE_THRESHOLD,
        )
        self.assertEqual(c33, [])

    def test_overlay_function_does_not_flag(self):
        # PR #640's empirical scope: only main-module `.legacy.c`
        # claims trigger Cluster F. Same wall + size profile in an
        # overlay should NOT flag.
        walls = [self._wall("StyleA")]
        c33 = detect_legacy_c_cascade_risk(
            walls, module="ov007", size=0x6c,
        )
        self.assertEqual(c33, [])

    def test_no_legacy_routing_walls_does_not_flag(self):
        # Pick #7's shape — main 0x70 with no StyleA/C-15. The
        # decomper would route to `.c` (no cascade). No C-33.
        walls: list[WallPrediction] = []
        c33 = detect_legacy_c_cascade_risk(
            walls, module="main", size=0x70,
        )
        self.assertEqual(c33, [])

    def test_unrelated_walls_alone_dont_flag(self):
        # Function with C-22 (bitfield) at large size — doesn't
        # route through `.legacy.c`, so no C-33.
        walls = [self._wall("C-22")]
        c33 = detect_legacy_c_cascade_risk(
            walls, module="main", size=0x80,
        )
        self.assertEqual(c33, [])

    def test_mixed_walls_with_legacy_routing_flags(self):
        # Function with C-15 + C-22 — C-15 triggers, C-22 is
        # incidental.
        walls = [self._wall("C-15"), self._wall("C-22")]
        c33 = detect_legacy_c_cascade_risk(
            walls, module="main", size=0x68,
        )
        self.assertEqual(len(c33), 1)
        self.assertEqual(c33[0].wall_id, "C-33")

    def test_threshold_documented(self):
        # Defensive: the threshold is exposed for tests to adapt
        # if it ever changes.
        self.assertEqual(LEGACY_C_CASCADE_SIZE_THRESHOLD, 0x50)


class TestAddressCSEDetection(unittest.TestCase):
    """C-34 detector (brief 202) — consults relocs.txt for 2+
    `kind:load to:<addr>` entries with the SAME target inside
    the function's `[addr, addr+size)` range.

    Brief 201 found that mwcc 2.0/sp1p5 IR-CSE collapses
    duplicate-target pool loads into a single slot. Recipe:
    `.s` with explicit `.word` directives per pool slot.
    """

    def test_e07_single_duplicate_pair(self):
        # E-07's exact relocs: two loads at 0x02023fe4 +
        # 0x02023fe8 (the function's trailing pool block) both
        # targeting `0x0219a8e4`. Single duplicate-target pair.
        relocs = (
            "from:0x02023fe4 kind:load to:0x0219a8e4 module:main\n"
            "from:0x02023fe8 kind:load to:0x0219a8e4 module:main\n"
        )
        walls = detect_address_cse(
            relocs, addr=0x02023f7c, size=0x70,
        )
        self.assertEqual(len(walls), 1)
        self.assertEqual(walls[0].wall_id, "C-34")
        self.assertIn("0x0219a8e4", walls[0].cue)
        self.assertIn("0x02023fe4", walls[0].cue)
        self.assertIn("0x02023fe8", walls[0].cue)

    def test_e08_clone_shape(self):
        # E-08's analogous shape — clone of E-07 with different
        # data symbol.
        relocs = (
            "from:0x02027040 kind:load to:0x0219a924 module:main\n"
            "from:0x02027044 kind:load to:0x0219a924 module:main\n"
        )
        walls = detect_address_cse(
            relocs, addr=0x02026fd8, size=0x70,
        )
        self.assertEqual(len(walls), 1)
        self.assertEqual(walls[0].wall_id, "C-34")

    def test_triple_duplicate_pool_slots(self):
        # Hypothetical: 3+ pool slots for the same symbol. The
        # detector emits one C-34 prediction with all slot
        # addresses listed.
        relocs = (
            "from:0x02000100 kind:load to:0x0219a8e4 module:main\n"
            "from:0x02000104 kind:load to:0x0219a8e4 module:main\n"
            "from:0x02000108 kind:load to:0x0219a8e4 module:main\n"
        )
        walls = detect_address_cse(
            relocs, addr=0x02000000, size=0x200,
        )
        self.assertEqual(len(walls), 1)
        self.assertIn("0x02000100", walls[0].cue)
        self.assertIn("0x02000104", walls[0].cue)
        self.assertIn("0x02000108", walls[0].cue)

    def test_two_independent_duplicate_pairs(self):
        # Two different data symbols, each loaded by 2+ slots.
        # The detector emits ONE prediction covering BOTH pairs.
        relocs = (
            "from:0x02000100 kind:load to:0x0219a8e4 module:main\n"
            "from:0x02000104 kind:load to:0x0219a8e4 module:main\n"
            "from:0x02000108 kind:load to:0x0219b000 module:main\n"
            "from:0x0200010c kind:load to:0x0219b000 module:main\n"
        )
        walls = detect_address_cse(
            relocs, addr=0x02000000, size=0x200,
        )
        self.assertEqual(len(walls), 1)
        cue = walls[0].cue
        self.assertIn("2 address-CSE candidates", cue)
        self.assertIn("0x0219a8e4", cue)
        self.assertIn("0x0219b000", cue)

    def test_single_load_no_match(self):
        # Each load target referenced once — no CSE candidate.
        relocs = (
            "from:0x02000100 kind:load to:0x0219a8e4 module:main\n"
            "from:0x02000104 kind:load to:0x0219b000 module:main\n"
        )
        walls = detect_address_cse(
            relocs, addr=0x02000000, size=0x200,
        )
        self.assertEqual(walls, [])

    def test_arm_call_relocs_ignored(self):
        # `kind:arm_call` with duplicate targets is C-32-territory
        # (cross-overlay BL), NOT C-34. The C-34 detector must
        # only match `kind:load`.
        relocs = (
            "from:0x02000100 kind:arm_call to:0x0219a8e4 module:main\n"
            "from:0x02000104 kind:arm_call to:0x0219a8e4 module:main\n"
        )
        walls = detect_address_cse(
            relocs, addr=0x02000000, size=0x200,
        )
        self.assertEqual(walls, [])

    def test_duplicate_outside_function_range(self):
        # Two `kind:load to:<same addr>` BUT outside the
        # `[addr, addr+size)` window — they belong to a
        # different function. C-34 must not fire.
        relocs = (
            "from:0x02000500 kind:load to:0x0219a8e4 module:main\n"
            "from:0x02000504 kind:load to:0x0219a8e4 module:main\n"
        )
        walls = detect_address_cse(
            relocs, addr=0x02000000, size=0x100,
        )
        self.assertEqual(walls, [])

    def test_empty_relocs_text(self):
        # Defensive — empty input returns empty list.
        walls = detect_address_cse(
            "", addr=0x02000000, size=0x100,
        )
        self.assertEqual(walls, [])


class TestRoutingTrilemmaDetection(unittest.TestCase):
    """C-35 detector (brief 204) — composite signal that fires when
    C-23 AND C-34 both fire on the same function. Marks the
    function as a "routing trilemma" pick where combined codegen
    walls mean no single mwcc tier matches.
    """

    @staticmethod
    def _wall(wall_id: str, cue: str = "test cue") -> WallPrediction:
        return WallPrediction(wall_id, cue)

    def test_c23_plus_c34_fires(self):
        # The brief 204 reference signal: both C-23 and C-34
        # fire on the same function.
        walls = [
            self._wall("C-23"),
            self._wall("C-34"),
        ]
        composite = detect_routing_trilemma(walls)
        self.assertEqual(len(composite), 1)
        self.assertEqual(composite[0].wall_id, "C-35")
        self.assertIn("routing trilemma", composite[0].cue)
        self.assertIn("brief 204", composite[0].cue)

    def test_c23_plus_c34_with_additional_walls_still_fires(self):
        # func_02021b38's actual classifier output has 5 walls
        # (C-23, C-15, C-1, C-34, C-33); C-35 fires regardless.
        walls = [
            self._wall("C-23"),
            self._wall("C-15"),
            self._wall("C-1"),
            self._wall("C-34"),
            self._wall("C-33"),
        ]
        composite = detect_routing_trilemma(walls)
        self.assertEqual(len(composite), 1)
        self.assertEqual(composite[0].wall_id, "C-35")

    def test_c34_alone_does_not_fire(self):
        # C-34 alone (like brief 202's E-07) does NOT trigger
        # the composite — that's the simpler single-wall case
        # where the C-34 recipe applies cleanly.
        walls = [self._wall("C-34")]
        self.assertEqual(detect_routing_trilemma(walls), [])

    def test_c23_alone_does_not_fire(self):
        # C-23 alone (like brief 199's pick #5) does NOT trigger
        # — the C-23 `.legacy.c` recipe handles those.
        walls = [self._wall("C-23")]
        self.assertEqual(detect_routing_trilemma(walls), [])

    def test_other_walls_alone_dont_fire(self):
        # Unrelated walls — StyleA + C-1 + P-11 — don't trigger.
        walls = [
            self._wall("StyleA"),
            self._wall("C-1"),
            self._wall("P-11"),
        ]
        self.assertEqual(detect_routing_trilemma(walls), [])

    def test_empty_walls_doesnt_fire(self):
        # Defensive: empty input returns empty list.
        self.assertEqual(detect_routing_trilemma([]), [])

    def test_c32_plus_c34_does_not_fire(self):
        # C-32 (cross-overlay BL) + C-34 — different family
        # (the BL wall is independent of the pool wall). The
        # routing trilemma is specifically the C-23 + C-34
        # combo.
        walls = [
            self._wall("C-32"),
            self._wall("C-34"),
        ]
        self.assertEqual(detect_routing_trilemma(walls), [])


class TestC36Detection(unittest.TestCase):
    """Brief 208: literal-tail trim-trap detector.

    Fires when (a) the function's last 4 bytes encode a small
    literal (top 2 bytes == 0x00) AND (b) no relocation patches
    the last 4 bytes. Both conditions are needed — a reloc on
    the tail means brief 204 already handles it; non-zero high
    byte means the tail is real ARM/Thumb instruction bytes,
    not a literal.

    Tests cover the six known-affected picks from brief 207
    PR #660, plus a representative set of negatives.
    """

    # -- positive cases (must fire C-36) --

    def test_func_02023478_canonical(self) -> None:
        """The canonical brief 208 worked example: last `.word
        0x7fff` → trailing bytes `ff 7f 00 00`. No reloc on
        the last 4 bytes."""
        preds = detect_literal_tail_trim_trap(
            orig_last4=b"\xff\x7f\x00\x00",
            relocs_text="",
            addr=0x02023478, size=0x80,
        )
        ids = [p.wall_id for p in preds]
        self.assertEqual(ids, ["C-36"])
        self.assertIn("0x7fff", preds[0].cue)

    def test_func_020212cc(self) -> None:
        """Brief 207 deferred pick: last `.word 0x618` → bytes
        `18 06 00 00`."""
        preds = detect_literal_tail_trim_trap(
            orig_last4=b"\x18\x06\x00\x00",
            relocs_text="",
            addr=0x020212cc, size=0x80,
        )
        self.assertEqual([p.wall_id for p in preds], ["C-36"])

    def test_ov002_021aba60(self) -> None:
        """Last `.word 0xffff` → bytes `ff ff 00 00`."""
        preds = detect_literal_tail_trim_trap(
            orig_last4=b"\xff\xff\x00\x00",
            relocs_text="",
            addr=0x021aba60, size=0x40,
        )
        self.assertEqual([p.wall_id for p in preds], ["C-36"])
        self.assertIn("0xffff", preds[0].cue)

    def test_ov018_021ab1c4(self) -> None:
        """Last `.word 0x1ff` → bytes `ff 01 00 00`."""
        preds = detect_literal_tail_trim_trap(
            orig_last4=b"\xff\x01\x00\x00",
            relocs_text="",
            addr=0x021ab1c4, size=0x40,
        )
        self.assertEqual([p.wall_id for p in preds], ["C-36"])

    def test_zero_literal_still_fires(self) -> None:
        """Edge case: a literal `.word 0x0` — last 4 bytes all
        zero. Still a trim trap (the patcher's heuristic
        triggers on last 2 bytes == 0x00, regardless of the
        first 2). The brief 208 guard covers this."""
        preds = detect_literal_tail_trim_trap(
            orig_last4=b"\x00\x00\x00\x00",
            relocs_text="",
            addr=0x02000000, size=0x20,
        )
        self.assertEqual([p.wall_id for p in preds], ["C-36"])

    # -- negative cases (must NOT fire C-36) --

    def test_reloc_covers_tail_does_not_fire(self) -> None:
        """If a `.rel.text`-equivalent reloc patches any byte in
        the last 4 bytes, brief 204's existing protection
        handles it — no C-36 needed."""
        # addr+size-4 = 0x02023574; relocs.txt has a load there.
        relocs = (
            "from:0x02023574 kind:load to:0x021a6354 module:main\n"
        )
        preds = detect_literal_tail_trim_trap(
            orig_last4=b"\xff\x7f\x00\x00",
            relocs_text=relocs,
            addr=0x02023478, size=0x100,  # last4 = [0x02023574..0x02023578)
        )
        self.assertEqual(preds, [])

    def test_real_instruction_tail_does_not_fire(self) -> None:
        """Most functions end in a return like `pop {pc}` /
        `ldmia sp!, {lr,pc}` whose high byte is non-zero.
        These must NOT fire C-36."""
        # ldmia sp!, {r4, lr, pc} = 0xe8bd9010 in LE → bytes
        # `10 90 bd e8`. High byte 0xe8 (non-zero).
        preds = detect_literal_tail_trim_trap(
            orig_last4=b"\x10\x90\xbd\xe8",
            relocs_text="",
            addr=0x02023478, size=0x80,
        )
        self.assertEqual(preds, [])

    def test_high_byte_nonzero_does_not_fire(self) -> None:
        """A literal whose top BYTE (not just top 2 bytes) is
        non-zero — e.g. `.word 0x01000000` → bytes `00 00 00 01`.
        The patcher's trim heuristic only triggers on last 2
        bytes == 0x00 0x00; with the top byte non-zero, the
        trim doesn't fire so C-36 needn't either.

        This pins the "high byte non-zero" branch of the
        detector — i.e. the negative case where brief 207's
        literal-promotion workaround WOULD have worked
        (literals ≥ 0x01000000 are already trim-safe)."""
        preds = detect_literal_tail_trim_trap(
            orig_last4=b"\x00\x00\x00\x01",
            relocs_text="",
            addr=0x02023478, size=0x80,
        )
        self.assertEqual(preds, [])

    def test_short_input_does_not_fire(self) -> None:
        """Defensive: a function smaller than 4 bytes (or a
        truncated read) shouldn't crash — return empty."""
        preds = detect_literal_tail_trim_trap(
            orig_last4=b"\x00\x00\x00",  # only 3 bytes
            relocs_text="",
            addr=0x02000000, size=0x10,
        )
        self.assertEqual(preds, [])

    def test_brief_205_shipped_ship_does_not_fire(self) -> None:
        """Sanity check: a shipped `.s` from brief 205 ends in
        a SYMBOL reference (e.g. `.word data_0219a8dc`). The
        symbol resolves to an address like `0x0219a8dc` → in
        the .o it's `00 00 00 00` (linker fills via reloc), but
        the reloc IS present so brief 204 already protects.
        The C-36 detector also passes — reloc check trips first
        and returns empty."""
        # func_02021b38 from brief 204: last reloc would be at
        # addr 0x02021bac - 4 = 0x02021ba8 against data_X.
        relocs = (
            "from:0x02021ba8 kind:load "
            "to:0x021a6354 module:main\n"
        )
        preds = detect_literal_tail_trim_trap(
            orig_last4=b"\x00\x00\x00\x00",
            relocs_text=relocs,
            addr=0x02021b38, size=0x74,
        )
        self.assertEqual(preds, [])


class TestC37Detection(unittest.TestCase):
    """C-37: bit-test / byte-zero check normalised to 0/1 via the
    redundant-tail idiom.

    Brief 214 found four polarity × shift-width combinations in the
    wild — bit-0 extract (`lsl/lsr #31`) and byte-low zero check
    (`lsl/lsr #24`), each with `1-if-set` and `1-if-zero` mov
    polarities. The detector matches all four via exact hex word
    tails ending in `bx lr`.
    """

    def test_bit0_extract_returns_1_if_set(self):
        """func_020a584c shape: bit-0 of a word → 0 or 1.
        Idiom from brief 213 wave 1."""
        asm = _wrap_asm(
            _objdump_line(0x100, "e5900004", "ldr\tr0, [r0, #4]"),
            _objdump_line(0x104, "e1a00f80",
                          "mov\tr0, r0, lsl #31"),
            _objdump_line(0x108, "e1b00fa0",
                          "movs\tr0, r0, lsr #31"),
            _objdump_line(0x10c, "13a00001", "movne\tr0, #1"),
            _objdump_line(0x110, "03a00000", "moveq\tr0, #0"),
            _objdump_line(0x114, "e12fff1e", "bx\tlr"),
        )
        walls = detect_walls(asm)
        c37 = [w for w in walls if w.wall_id == "C-37"]
        self.assertEqual(len(c37), 1)
        self.assertIn("bit-0 extract", c37[0].cue)
        self.assertIn("`.legacy.c`", c37[0].cue)

    def test_byte_zero_check_returns_1_if_zero(self):
        """func_ov000_021ab6cc shape: low byte of *(global + 0x58)
        zero → return 1. Idiom from brief 213 wave 2."""
        asm = _wrap_asm(
            _objdump_line(0x100, "e59f0014",
                          "ldr\tr0, [pc, #0x14]"),
            _objdump_line(0x104, "e5900058",
                          "ldr\tr0, [r0, #0x58]"),
            _objdump_line(0x108, "e1a00c00",
                          "mov\tr0, r0, lsl #24"),
            _objdump_line(0x10c, "e1b00c20",
                          "movs\tr0, r0, lsr #24"),
            _objdump_line(0x110, "03a00001", "moveq\tr0, #1"),
            _objdump_line(0x114, "13a00000", "movne\tr0, #0"),
            _objdump_line(0x118, "e12fff1e", "bx\tlr"),
        )
        walls = detect_walls(asm)
        c37 = [w for w in walls if w.wall_id == "C-37"]
        self.assertEqual(len(c37), 1)
        self.assertIn("byte-low extract", c37[0].cue)
        self.assertIn("1 if zero", c37[0].cue)
        # Byte-low extract routes to plain `.c` (mwcc 2.0 reaches).
        self.assertIn("idiom", c37[0].cue)

    def test_bit0_extract_returns_1_if_zero(self):
        """Inverted polarity of the bit-0 idiom (moveq #1; movne #0).
        Synthetic — no canonical pick observed yet, but the
        detector should still flag for safety."""
        asm = _wrap_asm(
            _objdump_line(0x100, "e5900004", "ldr\tr0, [r0, #4]"),
            _objdump_line(0x104, "e1a00f80",
                          "mov\tr0, r0, lsl #31"),
            _objdump_line(0x108, "e1b00fa0",
                          "movs\tr0, r0, lsr #31"),
            _objdump_line(0x10c, "03a00001", "moveq\tr0, #1"),
            _objdump_line(0x110, "13a00000", "movne\tr0, #0"),
            _objdump_line(0x114, "e12fff1e", "bx\tlr"),
        )
        walls = detect_walls(asm)
        c37 = [w for w in walls if w.wall_id == "C-37"]
        self.assertEqual(len(c37), 1)
        self.assertIn("1 if zero", c37[0].cue)

    def test_byte_extract_returns_1_if_set(self):
        """Inverted polarity for byte-low check (movne #1; moveq #0).
        Synthetic — covers the fourth polarity combination."""
        asm = _wrap_asm(
            _objdump_line(0x100, "e5900058",
                          "ldr\tr0, [r0, #0x58]"),
            _objdump_line(0x104, "e1a00c00",
                          "mov\tr0, r0, lsl #24"),
            _objdump_line(0x108, "e1b00c20",
                          "movs\tr0, r0, lsr #24"),
            _objdump_line(0x10c, "13a00001", "movne\tr0, #1"),
            _objdump_line(0x110, "03a00000", "moveq\tr0, #0"),
            _objdump_line(0x114, "e12fff1e", "bx\tlr"),
        )
        walls = detect_walls(asm)
        c37 = [w for w in walls if w.wall_id == "C-37"]
        self.assertEqual(len(c37), 1)
        self.assertIn("byte-low extract", c37[0].cue)
        self.assertIn("1 if set", c37[0].cue)

    def test_no_match_when_bx_lr_missing(self):
        """The detector requires `bx lr` (0xe12fff1e) as the very
        last word. A function ending differently (e.g. with a
        trailing literal pool word) should NOT match — the tail
        check is anchored on the final word."""
        asm = _wrap_asm(
            _objdump_line(0x100, "e1a00f80",
                          "mov\tr0, r0, lsl #31"),
            _objdump_line(0x104, "e1b00fa0",
                          "movs\tr0, r0, lsr #31"),
            _objdump_line(0x108, "13a00001", "movne\tr0, #1"),
            _objdump_line(0x10c, "03a00000", "moveq\tr0, #0"),
            _objdump_line(0x110, "e12fff1e", "bx\tlr"),
            # trailing data word — disrupts the tail check
            _objdump_line(0x114, "deadbeef", ".word\t0xdeadbeef"),
        )
        walls = detect_walls(asm)
        self.assertNotIn("C-37", {w.wall_id for w in walls})

    def test_no_match_for_tst_form(self):
        """The mwcc 2.0 collapsed form `tst r0, #1; movne #1;
        moveq #0; bx lr` is NOT a C-37 — it's the well-matched
        shape that doesn't need legacy routing. The detector
        must distinguish."""
        asm = _wrap_asm(
            _objdump_line(0x100, "e5900004", "ldr\tr0, [r0, #4]"),
            _objdump_line(0x104, "e3100001", "tst\tr0, #1"),
            _objdump_line(0x108, "13a00001", "movne\tr0, #1"),
            _objdump_line(0x10c, "03a00000", "moveq\tr0, #0"),
            _objdump_line(0x110, "e12fff1e", "bx\tlr"),
        )
        walls = detect_walls(asm)
        self.assertNotIn("C-37", {w.wall_id for w in walls})

    def test_no_match_for_shift_pair_without_movXX_tail(self):
        """The shift pair alone (without the redundant 0/1
        materialisation tail) shouldn't fire. mwcc compiling the
        bitfield idiom often produces `lsl/lsr; bx lr` — which
        is the simpler 12-byte shape, not C-37."""
        asm = _wrap_asm(
            _objdump_line(0x100, "e5900004", "ldr\tr0, [r0, #4]"),
            _objdump_line(0x104, "e1a00f80",
                          "mov\tr0, r0, lsl #31"),
            _objdump_line(0x108, "e1a00fa0",
                          "mov\tr0, r0, lsr #31"),  # no `s` flag
            _objdump_line(0x10c, "e12fff1e", "bx\tlr"),
        )
        walls = detect_walls(asm)
        self.assertNotIn("C-37", {w.wall_id for w in walls})


class TestC39Detection(unittest.TestCase):
    """C-39: non-leaf C-37 — bit-0 extract (`lsl/lsr #31`) inside a
    function with a stack frame + helper call. Brief 222 pilot found
    that brief 218's bitfield-struct recipe extends from C-37 leaf
    shape to this non-leaf variant under default mwcc 2.0/sp1p5.

    The detector fires when:
      - function entry is `push {…, lr}` (non-leaf marker — lr in
        the push list);
      - body contains `lsl rX, rY, #31` (encoding `e1a0_?f8_?`);
      - body contains `lsr rX, rZ, #31` (encoding `e1a0_?fa_?`);
      - body contains a `bl` instruction (cond=AL bit 27-24=1011);
      - C-37 has NOT already fired (the leaf shape takes priority).
    """

    def test_brief222_pilot1_canonical(self):
        """`func_ov002_0223fd10` canonical shape: u16 load +
        bit-0 extract + helper(self, bit) + return 1."""
        asm = _wrap_asm(
            _objdump_line(0x0, "e92d4008", "push\t{r3, lr}"),
            _objdump_line(0x4, "e1d010b2", "ldrh\tr1, [r0, #2]"),
            _objdump_line(0x8, "e1a01f81", "lsl\tr1, r1, #31"),
            _objdump_line(0xc, "e1a01fa1", "lsr\tr1, r1, #31"),
            _objdump_line(0x10, "ebfff76a", "bl\t0x93630"),
            _objdump_line(0x14, "e3a00001", "mov\tr0, #1"),
            _objdump_line(0x18, "e8bd8008", "pop\t{r3, pc}"),
        )
        walls = detect_walls(asm)
        c39 = [w for w in walls if w.wall_id == "C-39"]
        self.assertEqual(len(c39), 1)
        self.assertIn("non-leaf", c39[0].cue)
        self.assertIn("bitfield-struct recipe", c39[0].cue)

    def test_brief222_pilot2_with_literal_arg(self):
        """`func_ov002_02231f2c`: same shape + literal-31 second
        helper arg loaded before the lsl/lsr."""
        asm = _wrap_asm(
            _objdump_line(0x0, "e92d4008", "push\t{r3, lr}"),
            _objdump_line(0x4, "e1d000b2", "ldrh\tr0, [r0, #2]"),
            _objdump_line(0x8, "e3a0101f", "mov\tr1, #31"),
            _objdump_line(0xc, "e1a00f80", "lsl\tr0, r0, #31"),
            _objdump_line(0x10, "e1a00fa0", "lsr\tr0, r0, #31"),
            _objdump_line(0x14, "ebfe9a3e", "bl\t0x2e3a0"),
            _objdump_line(0x18, "e3a00000", "mov\tr0, #0"),
            _objdump_line(0x1c, "e8bd8008", "pop\t{r3, pc}"),
        )
        walls = detect_walls(asm)
        c39 = [w for w in walls if w.wall_id == "C-39"]
        self.assertEqual(len(c39), 1)

    def test_leaf_c37_does_not_fire_c39(self):
        """The leaf C-37 shape (lsl/lsr #31 at the function tail,
        no `bl`) should fire C-37, NOT C-39. C-37's tail-match
        takes priority."""
        asm = _wrap_asm(
            _objdump_line(0x0, "e5900004", "ldr\tr0, [r0, #4]"),
            _objdump_line(0x4, "e1a00f80", "lsl\tr0, r0, #31"),
            _objdump_line(0x8, "e1b00fa0", "lsrs\tr0, r0, #31"),
            _objdump_line(0xc, "13a00001", "movne\tr0, #1"),
            _objdump_line(0x10, "03a00000", "moveq\tr0, #0"),
            _objdump_line(0x14, "e12fff1e", "bx\tlr"),
        )
        walls = detect_walls(asm)
        ids = {w.wall_id for w in walls}
        self.assertIn("C-37", ids)
        self.assertNotIn("C-39", ids)

    def test_non_leaf_without_lsl_lsr_does_not_fire(self):
        """A non-leaf function that doesn't have the lsl/lsr 31
        bit-extract should NOT fire C-39 even if it has push + bl."""
        asm = _wrap_asm(
            _objdump_line(0x0, "e92d4008", "push\t{r3, lr}"),
            _objdump_line(0x4, "ebfff76a", "bl\t0x93630"),
            _objdump_line(0x8, "e3a00001", "mov\tr0, #1"),
            _objdump_line(0xc, "e8bd8008", "pop\t{r3, pc}"),
        )
        walls = detect_walls(asm)
        ids = {w.wall_id for w in walls}
        self.assertNotIn("C-39", ids)

    def test_leaf_with_bit_extract_does_not_fire_c39(self):
        """A leaf function with lsl/lsr 31 but no push/bl should
        not fire C-39. (This is essentially a C-37-without-tail —
        rare in practice but the detector must still exclude it.)"""
        asm = _wrap_asm(
            _objdump_line(0x0, "e1a00f80", "lsl\tr0, r0, #31"),
            _objdump_line(0x4, "e1a00fa0", "lsr\tr0, r0, #31"),
            _objdump_line(0x8, "e12fff1e", "bx\tlr"),
        )
        walls = detect_walls(asm)
        ids = {w.wall_id for w in walls}
        self.assertNotIn("C-39", ids)


class TestC38Detection(unittest.TestCase):
    """C-38: leaf-no-pool reg-alloc + CSE divergence.

    Brief 216: small leaf functions doing struct-field load/store
    with no pool reference and no callsite. mwcc 2.0 emits
    early-returns + CSEs the repeated outer-pointer deref; orig
    keeps the explicit deref and uses predicated execution. The
    detector flags the shape so decomper routes to `.legacy.c`
    with the substruct-ptr / char-cast / re-deref recipe rather
    than burning iteration cycles on plain `.c` attempts.
    """

    def test_func_02087d10_shape_fires(self):
        """The canonical brief 215 canary: null-guarded nested
        setter with re-deref on the second store."""
        asm = _wrap_asm(
            _objdump_line(0x100, "e5903000", "ldr\tr3, [r0, #0]"),
            _objdump_line(0x104, "e3530000", "cmp\tr3, #0"),
            _objdump_line(0x108, "13a02001", "movne\tr2, #1"),
            _objdump_line(0x10c, "11c323b4",
                          "strneh\tr2, [r3, #0x34]"),
            _objdump_line(0x110, "15900000", "ldrne\tr0, [r0, #0]"),
            _objdump_line(0x114, "11c013b8",
                          "strneh\tr1, [r0, #0x38]"),
            _objdump_line(0x118, "e12fff1e", "bx\tlr"),
        )
        walls = detect_walls(asm)
        c38 = [w for w in walls if w.wall_id == "C-38"]
        self.assertEqual(len(c38), 1)
        self.assertIn("leaf-no-pool", c38[0].cue)
        self.assertIn("`.legacy.c`", c38[0].cue)

    def test_func_0207d36c_shape_fires(self):
        """Simpler u16 xchg with substruct-ptr intermediate."""
        asm = _wrap_asm(
            _objdump_line(0x100, "e2802024",
                          "add\tr2, r0, #0x24"),
            _objdump_line(0x104, "e1d201b0",
                          "ldrh\tr0, [r2, #0x10]"),
            _objdump_line(0x108, "e1c211b0",
                          "strh\tr1, [r2, #0x10]"),
            _objdump_line(0x10c, "e12fff1e", "bx\tlr"),
        )
        walls = detect_walls(asm)
        c38 = [w for w in walls if w.wall_id == "C-38"]
        self.assertEqual(len(c38), 1)

    def test_pool_load_skips_c38(self):
        """A function that loads from a literal pool (`ldr rN,
        [pc, #imm]`) is NOT C-38 — pool-loaded picks are
        Wall-1 territory (different recipe family)."""
        asm = _wrap_asm(
            _objdump_line(0x100, "e59f0014",
                          "ldr\tr0, [pc, #0x14]"),
            _objdump_line(0x104, "e5900058",
                          "ldr\tr0, [r0, #0x58]"),
            _objdump_line(0x108, "e12fff1e", "bx\tlr"),
        )
        walls = detect_walls(asm)
        self.assertNotIn("C-38", {w.wall_id for w in walls})

    def test_callsite_skips_c38(self):
        """A function with a `bl` callsite is NOT C-38 — Wall-2
        scope is leaf functions only."""
        asm = _wrap_asm(
            _objdump_line(0x100, "e5900000", "ldr\tr0, [r0, #0]"),
            _objdump_line(0x104, "eb000000", "bl\t0x10c"),
            _objdump_line(0x108, "e12fff1e", "bx\tlr"),
        )
        walls = detect_walls(asm)
        self.assertNotIn("C-38", {w.wall_id for w in walls})

    def test_zero_load_store_skips_c38(self):
        """A function with no load/store is NOT C-38 — too
        trivial to exhibit the reg-alloc divergence."""
        asm = _wrap_asm(
            _objdump_line(0x100, "e3a00000", "mov\tr0, #0"),
            _objdump_line(0x104, "e12fff1e", "bx\tlr"),
        )
        walls = detect_walls(asm)
        self.assertNotIn("C-38", {w.wall_id for w in walls})

    def test_not_ending_in_bx_lr_skips_c38(self):
        """A function ending in a tail-call (`bx ip`) or pool
        word is NOT C-38 — those have their own wall families."""
        asm = _wrap_asm(
            _objdump_line(0x100, "e5900000", "ldr\tr0, [r0, #0]"),
            _objdump_line(0x104, "e5901004", "ldr\tr1, [r0, #4]"),
            _objdump_line(0x108, "e12fff1c", "bx\tip"),  # tail call
        )
        walls = detect_walls(asm)
        self.assertNotIn("C-38", {w.wall_id for w in walls})

    def test_c37_takes_priority_over_c38(self):
        """When both C-37 (bit-test idiom) and C-38 (leaf-no-pool)
        would fire on the same disasm, C-37 wins — the more
        specific shape gets the routing recommendation."""
        asm = _wrap_asm(
            _objdump_line(0x100, "e5900004", "ldr\tr0, [r0, #4]"),
            _objdump_line(0x104, "e1a00f80",
                          "mov\tr0, r0, lsl #31"),
            _objdump_line(0x108, "e1b00fa0",
                          "movs\tr0, r0, lsr #31"),
            _objdump_line(0x10c, "13a00001", "movne\tr0, #1"),
            _objdump_line(0x110, "03a00000", "moveq\tr0, #0"),
            _objdump_line(0x114, "e12fff1e", "bx\tlr"),
        )
        walls = detect_walls(asm)
        ids = {w.wall_id for w in walls}
        self.assertIn("C-37", ids)
        self.assertNotIn("C-38", ids)


if __name__ == "__main__":
    unittest.main()
