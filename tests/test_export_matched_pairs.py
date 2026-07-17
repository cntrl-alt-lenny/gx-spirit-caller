import sys
import unittest
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "tools"))

from export_matched_pairs import mnemonics_from_objdump  # noqa: E402


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


if __name__ == "__main__":
    unittest.main()
