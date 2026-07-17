"""Unit tests for tools/check_delink_dupes.py — the duplicate-delink scanner.

Pins the two behaviours that matter: it catches a genuine two-files-one-address
duplicate, and it does NOT false-positive on a legitimate .s->.c conversion (which
keeps exactly one entry at the address) or on the module's top-of-file .text
section header.
"""
import sys
import unittest
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent.parent / "tools"))

from check_delink_dupes import find_dupes  # noqa: E402

# Top-of-file section headers, exactly as dsd emits them (no src/ block above).
HEADER = (
    "    .text       start:0x021aa3c0 end:0x022bdeb4 kind:code align:32\n"
    "    .rodata     start:0x022bdeb4 end:0x022ca6d8 kind:rodata align:4\n\n"
)


def _block(path: str, start: str, end: str) -> str:
    return f"{path}:\n    complete\n    .text start:{start} end:{end}\n\n"


class TestFindDupes(unittest.TestCase):
    def test_clean_no_dupes(self):
        body = HEADER + _block("src/usa/overlay002/func_ov002_021ab784.c", "0x021ab784", "0x021ab794") \
                      + _block("src/usa/overlay002/func_ov002_021ab794.s", "0x021ab794", "0x021ab980")
        self.assertEqual(find_dupes(body), {})

    def test_real_duplicate_two_files_one_address(self):
        # The bug: a .s and a differently-named file both claim 0x021ae310.
        body = HEADER + _block("src/usa/overlay002/func_ov002_021ae310.s", "0x021ae310", "0x021ae320") \
                      + _block("src/usa/overlay002/func_ov002_021ae310.c", "0x021ae310", "0x021ae320")
        dupes = find_dupes(body)
        self.assertIn("0x021ae310", dupes)
        self.assertEqual(len(set(dupes["0x021ae310"])), 2)

    def test_conversion_is_not_a_dupe(self):
        # A real .s->.c conversion removes the .s and adds the .c: one entry remains.
        body = HEADER + _block("src/usa/overlay002/func_ov002_021ae320.c", "0x021ae320", "0x021ae350")
        self.assertEqual(find_dupes(body), {})

    def test_section_header_not_counted_against_a_func(self):
        # A func whose .text start happens to equal the module .text section start
        # must NOT be flagged — the header line is not inside a src/ block.
        body = HEADER + _block("src/usa/overlay002/func_ov002_021aa3c0.s", "0x021aa3c0", "0x021aa3d0")
        self.assertEqual(find_dupes(body), {})

    def test_case_insensitive_address_match(self):
        body = _block("src/main/func_A.s", "0x0208DF40", "0x0208df60") \
             + _block("src/main/func_B.s", "0x0208df40", "0x0208df60")
        self.assertIn("0x0208df40", find_dupes(body))

    def test_libs_duplicate_two_files_one_address(self):
        body = HEADER + _block("libs/nitro/func_a.c", "0x02001000", "0x02001010") \
                      + _block("libs/runtime/func_b.s", "0x02001000", "0x02001010")
        dupes = find_dupes(body)
        self.assertIn("0x02001000", dupes)
        self.assertEqual(len(set(dupes["0x02001000"])), 2)


if __name__ == "__main__":
    unittest.main()
