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
    detect_cross_overlay_bl,
    detect_legacy_c_cascade_risk,
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
    """C-23: 3+ pc-relative loads + at least one MMIO (`0x04000xxx`)
    literal — the DS HW divider / GX matrix shape.
    """

    def test_mmio_block(self):
        asm = _wrap_asm(
            _objdump_line(0x100, "e59fc020", "ldr\tip, [pc, #32]"),
            _objdump_line(0x104, "e59f3024", "ldr\tr3, [pc, #36]"),
            _objdump_line(0x108, "e59f2028", "ldr\tr2, [pc, #40]"),
            _objdump_line(0x130, "04000280", ".word\t0x04000280"),
        )
        walls = detect_walls(asm)
        self.assertIn("C-23", {w.wall_id for w in walls})

    def test_three_pc_loads_no_mmio_no_match(self):
        # Without an MMIO literal in the pool, this is just an
        # ordinary constant-loading function.
        asm = _wrap_asm(
            _objdump_line(0x100, "e59fc020", "ldr\tip, [pc, #32]"),
            _objdump_line(0x104, "e59f3024", "ldr\tr3, [pc, #36]"),
            _objdump_line(0x108, "e59f2028", "ldr\tr2, [pc, #40]"),
            _objdump_line(0x130, "12345678", ".word\t0x12345678"),
        )
        walls = detect_walls(asm)
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


if __name__ == "__main__":
    unittest.main()
