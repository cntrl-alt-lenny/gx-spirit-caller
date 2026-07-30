"""Thumb-mode parsing + fail-closed comparison in tools/fastmatch.py.

Two coupled defects, found 2026-07-29 by a read-only analysis swarm and
verified against the code before fixing:

1. `_INSN` only matched 8-hex-digit (4-byte, ARM) instruction words. Thumb
   instructions disassemble as 4 hex digits, so for a Thumb-mode function the
   regex matched NOTHING and `_parse_words` returned an empty list.
2. `match_percent` then hit its `total == 0` branch and returned **100.0** --
   "a perfect match of nothing".

Together those made fastmatch report a confident false PASS
(`100.0%  OK`) on every Thumb candidate it was ever pointed at, without
comparing a single instruction. 119 `.thumb.c` TUs are in-tree.

`tools/verify.py:69` already carried the regex half of this fix (brief 683,
which recorded the identical empty-word-list false `OBJDIFF 100% (0 insns)`);
it was never ported to fastmatch.

Both tests fail against pre-fix code: the parse test returns `[]`, and the
fail-closed test returns 100.0.
"""
from __future__ import annotations

import sys
import unittest
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent.parent / "tools"))

import fastmatch  # noqa: E402


# A real `arm-none-eabi-objdump -d -r` shape for a Thumb function: 4-hex-digit
# instruction words, then an 8-hex-digit literal-pool `.word` entry.
THUMB_DUMP = """
021ae350 <func_ov002_021ae350>:
 21ae350:\tb510      \tpush\t{r4, lr}
 21ae352:\t4604      \tmov\tr4, r0
 21ae354:\t4b02      \tldr\tr3, [pc, #8]
 21ae356:\tbd10      \tpop\t{r4, pc}
 21ae358:\t021c0a40 \t.word\t0x021c0a40
"""

ARM_DUMP = """
021ae400 <func_arm_example>:
 21ae400:\te92d4010 \tpush\t{r4, lr}
 21ae404:\te1a04000 \tmov\tr4, r0
 21ae408:\te8bd8010 \tpop\t{r4, pc}
"""


class TestThumbWordParsing(unittest.TestCase):
    def test_thumb_instructions_are_parsed_not_dropped(self):
        words = fastmatch._parse_words(THUMB_DUMP, "func_ov002_021ae350")
        self.assertGreater(
            len(words), 0,
            "Thumb instructions were dropped entirely -- this is the empty "
            "word list that made match_percent report a false 100.0%",
        )
        self.assertEqual([w for w, _ in words][:4],
                         ["b510", "4604", "4b02", "bd10"])

    def test_eight_digit_pool_word_not_split_into_two_thumb_halves(self):
        words = [w for w, _ in
                 fastmatch._parse_words(THUMB_DUMP, "func_ov002_021ae350")]
        self.assertIn("021c0a40", words,
                      "the 4-byte literal-pool word must stay whole; matching "
                      "4 digits before 8 would split it into '021c'/'0a40'")
        self.assertNotIn("021c", words)

    def test_arm_parsing_still_works(self):
        words = [w for w, _ in fastmatch._parse_words(ARM_DUMP, "func_arm_example")]
        self.assertEqual(words, ["e92d4010", "e1a04000", "e8bd8010"])


class TestFailClosedOnZeroInstructions(unittest.TestCase):
    def test_two_empty_word_lists_do_not_report_a_match(self):
        pct, diffs = fastmatch.match_percent([], [])
        self.assertNotEqual(
            pct, 100.0,
            "comparing nothing to nothing must never read as a verified "
            "match -- every real function has at least one instruction, so "
            "zero words means the disassembly was not parsed",
        )
        self.assertEqual(pct, 0.0)
        self.assertTrue(diffs, "the reason must be visible to the caller")
        self.assertIn("NO-INSTRUCTIONS-PARSED", diffs[0][1])

    def test_a_real_identical_pair_still_reports_100(self):
        w = [("b510", False), ("4604", False)]
        pct, diffs = fastmatch.match_percent(list(w), list(w))
        self.assertEqual(pct, 100.0)
        self.assertEqual(diffs, [])

    def test_a_real_differing_pair_still_reports_a_mismatch(self):
        pct, diffs = fastmatch.match_percent(
            [("b510", False), ("4604", False)],
            [("b510", False), ("4605", False)],
        )
        self.assertEqual(pct, 50.0)
        self.assertEqual(len(diffs), 1)


if __name__ == "__main__":
    unittest.main()
