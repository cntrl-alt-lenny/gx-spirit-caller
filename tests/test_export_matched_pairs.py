import sys
import unittest
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "tools"))

from export_matched_pairs import (  # noqa: E402
    data_relocation_symbols,
    mnemonics_from_objdump,
    relocation_symbols_by_function,
    shape_tokens_from_objdump,
)


class TestExportMatchedPairs(unittest.TestCase):
    def test_extracts_first_word_of_instruction_lines(self):
        disassembly = """
00000000 <func_demo>:
   0:\t00 00 a0 e3\tmov\tr0, #0
   4:\t1e ff 2f e1\tbx\tlr
00000008 <other>:
   8:\t00 00 a0 e3\tmov\tr0, #0
"""
        self.assertEqual(mnemonics_from_objdump(disassembly, "func_demo"), "mov bx")

    def test_extracts_data_relocation_targets(self):
        relocations = """
00000000 R_ARM_ABS32 data_020c3bc0
00000004 R_ARM_CALL func_helper
00000008 R_ARM_LDR_PC_G0 data_020c3bd0+0x4
"""
        self.assertEqual(data_relocation_symbols(relocations),
                         ["data_020c3bc0", "data_020c3bd0"])

    def test_assigns_relocations_to_nearest_function(self):
        disassembly = """
00000000 <func_a>:
   0:\t00 00 a0 e3\tmov\tr0, #0
00000008 <func_b>:
   8:\t1e ff 2f e1\tbx\tlr
"""
        relocations = """
00000004 R_ARM_ABS32 data_a
00000008 R_ARM_ABS32 data_b
"""
        self.assertEqual(relocation_symbols_by_function(relocations, disassembly),
                         {"func_a": ["data_a"], "func_b": ["data_b"]})

    def test_emits_operand_shape_abstractions(self):
        disassembly = """
00000000 <func_demo>:
   0:\t00 00 a0 e3\tmov\tr0, #0
   4:\t00 00 90 e5\tldr\tr0, [r0]
"""
        tokens = shape_tokens_from_objdump(disassembly, "func_demo")
        self.assertIn("reg:gpr", tokens)
        self.assertIn("imm", tokens)
        self.assertIn("mem:bracket", tokens)


if __name__ == "__main__":
    unittest.main()
