"""Unit tests for tools/stylea_c94_stub.py (brief 264 stretch goal).

The emitter is pure — given a function's disassembly mnemonics it
classifies the c94 5-arg-helper arg-shape and renders a `.legacy.c`
stub. Fixtures use the real mnemonics of brief 263's c94 picks
(02094cec / 02094d80 / 02094e0c) so the tests track the validated
byte-identical recipe.
"""

from __future__ import annotations

import sys
import unittest
from pathlib import Path

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

from stylea_c94_stub import (  # noqa: E402
    classify_c94,
    emit_stub,
    _insns_for_func,
)

# Real mnemonics (objdump --architecture=armv5te) of the 3 reps.
INSNS_1ARG = [  # func_02094cec — helper(22, a0, 0, 0, 0)
    "stmfd\tsp!, {lr}", "sub\tsp, sp, #4",
    "mov\tr2, #0", "mov\tr1, r0", "mov\tr3, r2", "mov\tr0, #22",
    "str\tr2, [sp]", "bl\t4c4 <func_02094c94>",
    "add\tsp, sp, #4", "ldmfd\tsp!, {lr}", "bx\tlr",
]
INSNS_NOARG = [  # func_02094d80 — helper(24, -1, 0, 0, 0)
    "stmfd\tsp!, {lr}", "sub\tsp, sp, #4",
    "mov\tr2, #0", "mov\tr3, r2", "mov\tr0, #24", "mvn\tr1, #0",
    "str\tr2, [sp]", "bl\t0 <func_02094c94>",
    "add\tsp, sp, #4", "ldmfd\tsp!, {lr}", "bx\tlr",
]
INSNS_2ARG = [  # func_02094e0c — helper(32, a0, a1, 0, 0)
    "stmfd\tsp!, {lr}", "sub\tsp, sp, #4",
    "mov\tr2, r1", "mov\tr3, #0", "mov\tr1, r0", "mov\tr0, #32",
    "str\tr3, [sp]", "bl\t0 <func_02094c94>",
    "add\tsp, sp, #4", "ldmfd\tsp!, {lr}", "bx\tlr",
]


class TestClassify(unittest.TestCase):
    def test_1arg(self):
        self.assertEqual(
            classify_c94(INSNS_1ARG), {"code": 22, "shape": "1arg"},
        )

    def test_noarg_neg1(self):
        self.assertEqual(
            classify_c94(INSNS_NOARG), {"code": 24, "shape": "noarg"},
        )

    def test_2arg(self):
        self.assertEqual(
            classify_c94(INSNS_2ARG), {"code": 32, "shape": "2arg"},
        )

    def test_not_c94_no_helper(self):
        # Same prologue/epilogue but a different helper → not this family.
        insns = [
            "stmfd\tsp!, {lr}", "sub\tsp, sp, #4", "mov\tr0, #3",
            "bl\t0 <func_02093c10>", "str\tr0, [sp]",
            "add\tsp, sp, #4", "ldmfd\tsp!, {lr}", "bx\tlr",
        ]
        self.assertIsNone(classify_c94(insns))

    def test_not_c94_no_stack_arg(self):
        # bl to the helper but no `str rN, [sp]` → not the 5-arg shape.
        insns = [
            "mov\tr1, r0", "mov\tr0, #22", "bl\t0 <func_02094c94>", "bx\tlr",
        ]
        self.assertIsNone(classify_c94(insns))


class TestEmit(unittest.TestCase):
    def test_emit_1arg(self):
        src = emit_stub("func_02094cec", {"code": 22, "shape": "1arg"})
        self.assertIn("void func_02094cec(int a0)", src)
        self.assertIn("func_02094c94(22, a0, 0, 0, 0);", src)

    def test_emit_noarg(self):
        src = emit_stub("func_02094d80", {"code": 24, "shape": "noarg"})
        self.assertIn("void func_02094d80(void)", src)
        self.assertIn("func_02094c94(24, -1, 0, 0, 0);", src)

    def test_emit_2arg(self):
        src = emit_stub("func_02094e0c", {"code": 32, "shape": "2arg"})
        self.assertIn("void func_02094e0c(int a0, int a1)", src)
        self.assertIn("func_02094c94(32, a0, a1, 0, 0);", src)


class TestSlice(unittest.TestCase):
    def test_insns_for_func_skips_other_funcs_and_labels(self):
        disasm = "\n".join([
            "00000000 <func_other>:",
            "   0:\te3a00000 \tmov\tr0, #0",
            "00000010 <func_02094cec>:",
            "  10:\te92d4000 \tstmfd\tsp!, {lr}",
            "  14:\te3a00016 \tmov\tr0, #22",
            "0000001c <.L_internal>:",
            "  1c:\te58d2000 \tstr\tr2, [sp]",
            "00000030 <func_next>:",
            "  30:\te12fff1e \tbx\tlr",
        ])
        insns = _insns_for_func(disasm, "func_02094cec")
        # picks up the func body + its internal-label block, not neighbors
        self.assertIn("stmfd\tsp!, {lr}", insns)
        self.assertIn("str\tr2, [sp]", insns)
        self.assertNotIn("mov\tr0, #0", insns)  # func_other
        self.assertNotIn("bx\tlr", insns)        # func_next


if __name__ == "__main__":
    unittest.main()
