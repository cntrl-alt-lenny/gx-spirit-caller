"""Tests for tools/m2c_feed.py — the m2c cold-RE feeder (brief 274).

Two halves:
  - `render()` is the pure objdump→GAS parser; unit-tested on fixtures
    (no objdump binary needed), incl. the failure modes the brief
    requires (empty input fails LOUDLY, not silently).
  - `resolve_symbol()` runs against the committed `config/eur` so the
    name / ambiguous-address / unknown paths are covered end-to-end.
"""

from __future__ import annotations

import sys
import unittest
from pathlib import Path

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

from m2c_feed import (  # noqa: E402
    FeedError,
    main,
    render,
    resolve_symbol,
)

# A realistic `objdump -d -r` slice (tabs matter — match objdump's layout).
ARM_LINES = [
    "00000000 <func_test>:",
    "   0:\te92d4008 \tpush\t{r3, lr}",
    "   4:\teb000000 \tbl\t0 <helper>",
    "\t\t\t4: R_ARM_PC24\thelper-0x8",
    "   8:\te59f0010 \tldr\tr0, [pc, #16]\t@ 20 <.L_data>",
    "   c:\te5900000 \tldr\tr0, [r0]",
    "  10:\te3500000 \tcmp\tr0, #0",
    "  14:\t0a000000 \tbeq\t1c <.L_after>",
    "  18:\te8bd8008 \tpop\t{r3, pc}",
    "0000001c <.L_after>:",
    "  1c:\te1a00000 \tnop",
    "00000020 <.L_data>:",
    "  20:\t00000000                                ....",
    "\t\t\t20: R_ARM_ABS32\tg_global",
]

THUMB_LINES = [
    "00000002 <func_t>:",
    "   2:\tb510      \tpush\t{r4, lr}",
    "   4:\t2000      \tmovs\tr0, #0",
    "   6:\tbd10      \tpop\t{r4, pc}",
]


class TestRenderArm(unittest.TestCase):
    def setUp(self):
        self.s = render(ARM_LINES, "func_test", thumb=False)

    def test_arm_header(self):
        self.assertIn(".text", self.s)
        self.assertIn("\t.align 2", self.s)
        self.assertIn("\t.globl func_test", self.s)
        self.assertIn("func_test:", self.s)
        self.assertNotIn(".syntax unified", self.s)

    def test_strips_address_hex_and_comments(self):
        self.assertIn("\tpush\t{r3, lr}", self.s)
        self.assertNotIn("e92d4008", self.s)       # hex column stripped
        self.assertNotIn("@", self.s)               # @ comments stripped
        self.assertNotIn("R_ARM", self.s)           # reloc lines stripped

    def test_bl_target_rewritten_to_label(self):
        self.assertIn("\tbl\thelper", self.s)       # `bl 0 <helper>` → `bl helper`

    def test_pc_load_resolved_to_equals_symbol(self):
        # `ldr r0, [pc, #16] @ 1c <.L_data>` → `ldr r0, =g_global`
        self.assertIn("ldr r0, =g_global", self.s)
        self.assertNotIn("[pc", self.s)

    def test_code_label_kept_data_label_folded(self):
        self.assertIn(".L_after:", self.s)          # code label survives
        self.assertNotIn(".L_data:", self.s)        # data pool label folded into =sym

    def test_size_directive(self):
        self.assertIn("\t.size func_test, .-func_test", self.s)


class TestRenderThumb(unittest.TestCase):
    def test_thumb_markers(self):
        s = render(THUMB_LINES, "func_t", thumb=True)
        self.assertIn("\t.syntax unified", s)
        self.assertIn("\t.code 16", s)
        self.assertIn("\t.thumb_func", s)
        self.assertIn("\tpush\t{r4, lr}", s)


class TestRenderFailsLoudly(unittest.TestCase):
    def test_func_absent_raises(self):
        # the requested func is not a header in the dump → loud, not silent
        with self.assertRaises(FeedError):
            render(ARM_LINES, "func_missing", thumb=False)

    def test_empty_function_raises(self):
        # header present but zero instructions (data-only) → loud
        lines = ["00000000 <func_empty>:", "00000004 <func_next>:", "   4:\te1a00000 \tnop"]
        with self.assertRaises(FeedError):
            render(lines, "func_empty", thumb=False)

    def test_truly_empty_input_raises(self):
        with self.assertRaises(FeedError):
            render([], "func_test", thumb=False)


class TestResolveSymbol(unittest.TestCase):
    """Against the committed config/eur."""

    def test_resolve_by_name(self):
        info = resolve_symbol("eur", "func_ov002_021aa4a0")
        self.assertEqual(info["module"], "ov002")
        self.assertEqual(info["isa"], "arm")
        self.assertEqual(info["addr"], 0x021AA4A0)

    def test_ambiguous_address_fails_loudly(self):
        # 0x021aa4a0 is shared by overlapping overlays → must NOT silently pick one
        with self.assertRaises(FeedError) as ctx:
            resolve_symbol("eur", "0x021aa4a0")
        self.assertIn("ambiguous", str(ctx.exception))

    def test_address_disambiguated_by_module(self):
        info = resolve_symbol("eur", "0x021aa4a0", module_hint="ov002")
        self.assertEqual(info["name"], "func_ov002_021aa4a0")

    def test_unknown_target_raises(self):
        with self.assertRaises(FeedError):
            resolve_symbol("eur", "func_ov002_deadbeef")

    def test_non_hex_non_name_raises(self):
        with self.assertRaises(FeedError):
            resolve_symbol("eur", "notahexnoraname")


class TestCliExitCodes(unittest.TestCase):
    def test_unknown_func_exit_1(self):
        rc = main(["--version", "eur", "func_ov002_deadbeef"])
        self.assertEqual(rc, 1)

    def test_missing_objdump_exit_2(self):
        rc = main(["--version", "eur", "func_ov002_021aa4a0",
                   "--objdump", "/no/such/objdump-binary-xyz"])
        self.assertEqual(rc, 2)

    def test_bad_target_exit_1(self):
        rc = main(["--version", "eur", "notahexnoraname"])
        self.assertEqual(rc, 1)


if __name__ == "__main__":
    unittest.main()
