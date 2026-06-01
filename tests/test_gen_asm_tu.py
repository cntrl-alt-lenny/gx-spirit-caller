"""Tests for tools/gen_asm_tu.py — the brief-290/291 ".s escape hatch"
converter that turns a m2c_feed GAS dump (UAL syntax) into a mwasmarm-
assemblable .s translation unit.

Covers the UAL -> old-ARM mnemonic translations mwasm requires (push/pop
-> stmdb/ldmia incl. conditional, lsl/lsr/asr -> mov/movs + shift operand),
the `ldr rX, =sym` -> pool-label + trailing `.word` rewrite, and the
`.extern` collection for external symbols (data/func loads + bl targets).
"""

from __future__ import annotations

import sys
import unittest
from pathlib import Path

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

from gen_asm_tu import convert, xlate  # noqa: E402

# A m2c_feed-style GAS dump exercising every translation path.
GAS = "\n".join(
    [
        "\t.text",
        "\t.align 2",
        "\t.globl func_ov002_dead",
        "func_ov002_dead:",
        "\tpush\t{r4, lr}",
        "\tmov\tr4, r0",
        "\tldr\tr1, =0x00001234",
        "\tldr\tr2, =data_ov002_cafe",
        "\tlsl\tr0, r4, #31",
        "\tlsrs\tr0, r0, #31",
        "\tasr\tr3, r4, #2",
        "\tbl\tfunc_ov002_beef",
        "\tcmp\tr0, #0",
        "\tpopeq\t{r4, pc}",
        "\tpop\t{r4, pc}",
    ]
)


class TestConvert(unittest.TestCase):
    def setUp(self):
        self.out = convert(GAS)
        self.lines = self.out.splitlines()

    def test_header_directives(self):
        self.assertIn("        .text", self.lines)
        self.assertIn("        .global func_ov002_dead", self.lines)
        self.assertIn("        .arm", self.lines)
        self.assertIn("func_ov002_dead:", self.lines)

    def test_no_ual_directives_leak(self):
        # mwasm rejects these — they must not survive the conversion.
        for bad in (".globl ", ".align", ".type", ".size", ".syntax"):
            self.assertNotIn(bad, self.out)

    def test_push_pop_translation(self):
        self.assertIn("\tstmdb sp!, {r4, lr}", self.out)
        self.assertIn("\tldmia sp!, {r4, pc}", self.out)

    def test_conditional_pop_translation(self):
        # popeq -> ldmeqia (condition between ldm and ia)
        self.assertIn("\tldmeqia sp!, {r4, pc}", self.out)
        self.assertNotIn("popeq", self.out)

    def test_shift_to_mov(self):
        self.assertIn("\tmov r0, r4, lsl #31", self.out)
        self.assertIn("\tmovs r0, r0, lsr #31", self.out)  # lsrs -> movs
        self.assertIn("\tmov r3, r4, asr #2", self.out)

    def test_pool_load_rewrite(self):
        # ldr rX, =sym -> ldr rX, .L<fn>_pN  +  trailing .word
        self.assertIn("\tldr r1, .Lfunc_ov002_dead_p0", self.out)
        self.assertIn("\tldr r2, .Lfunc_ov002_dead_p1", self.out)
        self.assertIn(".Lfunc_ov002_dead_p0: .word 0x00001234", self.out)
        self.assertIn(".Lfunc_ov002_dead_p1: .word data_ov002_cafe", self.out)

    def test_extern_collection(self):
        # symbolic pool target + bl target get .extern; numeric literal does not
        self.assertIn("        .extern data_ov002_cafe", self.out)
        self.assertIn("        .extern func_ov002_beef", self.out)
        self.assertNotIn(".extern 0x00001234", self.out)

    def test_no_globl_function_raises(self):
        with self.assertRaises(SystemExit):
            convert("\t.text\n\tnop\n")


class TestXlate(unittest.TestCase):
    def test_unconditional_block_transfer(self):
        self.assertEqual(xlate("\tpush\t{r4, lr}")[0], "\tstmdb sp!, {r4, lr}")
        self.assertEqual(xlate("\tpop\t{r4, pc}")[0], "\tldmia sp!, {r4, pc}")

    def test_conditional_block_transfer(self):
        self.assertEqual(xlate("\tpopge\t{r4, pc}")[0], "\tldmgeia sp!, {r4, pc}")

    def test_shifts(self):
        self.assertEqual(xlate("\tlsl\tr0, r1, #4")[0], "\tmov r0, r1, lsl #4")
        self.assertEqual(xlate("\tlsrs\tr0, r1, #4")[0], "\tmovs r0, r1, lsr #4")

    def test_passthrough_untouched(self):
        # a plain data-processing op is returned verbatim
        self.assertEqual(xlate("\tcmp\tr0, #0")[0], "\tcmp\tr0, #0")


if __name__ == "__main__":
    unittest.main()
