"""Tests for tools/verify.py (brief 351).

The compile/disassemble CLI shells out to wine + arm-none-eabi-objdump, so it
is not exercised here. The PURE core is — and the one piece that must never
regress is the `.L_` SPAN FIX: dsd gap objects split a function at its internal
labels (default-blocks, switch tails, const pools), so a comparator that stops
at the next `<symbol>:` header reads only the first sub-block and reports a
false near-miss against a whole-function `.o`. These tests pin the span
behaviour on synthetic objdump text (no wine/objdump needed; runs in CI).
"""

from __future__ import annotations

import sys
import unittest
from pathlib import Path

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

from verify import (  # noqa: E402
    compare_words,
    parse_words,
    strip_pool_tail,
)

# The canonical regression: func_0201f0f4 in the GAP object is split into the
# body (func_0201f0f4) + a default-block sublabel (.L_..10c) + the const pool
# (.L_..114). A naive parser stops at .L_..10c and sees only 6 words.
_GAP_SPLIT = """\
00000164 <func_0201f0f4>:
 164:\te3500000 \tcmp\tr0, #0
 168:\tba000003 \tblt\t17c <.L_0201f10c>
 16c:\te3500017 \tcmp\tr0, #23
 170:\t359f100c \tldrcc\tr1, [pc, #12]
 174:\t37910100 \tldrcc\tr0, [r1, r0, lsl #2]
 178:\t312fff1e \tbxcc\tlr

0000017c <.L_0201f10c>:
 17c:\te59f0004 \tldr\tr0, [pc, #4]
 180:\te12fff1e \tbx\tlr

00000184 <.L_0201f114>:
 184:\t00000000 \t.word\t0x00000000
\t\t\t184: R_ARM_ABS32\tdata_020c63bc
 188:\t00000000 \t.word\t0x00000000
\t\t\t188: R_ARM_ABS32\tdata_020c6484

0000018c <func_next>:
 18c:\te12fff1e \tbx\tlr
"""

# The same function compiled fresh: one symbol, body+default-block+pool contiguous.
_MINE_WHOLE = """\
00000000 <func_0201f0f4>:
   0:\te3500000 \tcmp\tr0, #0
   4:\tba000003 \tblt\t18
   8:\te3500017 \tcmp\tr0, #23
   c:\t359f100c \tldrcc\tr1, [pc, #12]
  10:\t37910100 \tldrcc\tr0, [r1, r0, lsl #2]
  14:\t312fff1e \tbxcc\tlr
  18:\te59f0004 \tldr\tr0, [pc, #4]
  1c:\te12fff1e \tbx\tlr
  20:\t00000000 \t.word\t0x00000000
\t\t\t20: R_ARM_ABS32\tdata_020c63bc
  24:\t00000000 \t.word\t0x00000000
\t\t\t24: R_ARM_ABS32\tdata_020c6484
"""


class SpanFix(unittest.TestCase):
    def test_spans_internal_L_sublabels(self):
        """The gap-object split must be read as the WHOLE function: 8 code
        words + 2 pool words, not the 6 of the first sub-block."""
        ws = parse_words(_GAP_SPLIT, "func_0201f0f4")
        self.assertEqual(len(ws), 10)  # 8 insns + 2 pool (the bug gave 6)
        # the two trailing pool words are reloc-flagged
        self.assertTrue(ws[8][1] and ws[9][1])
        # the body + default block are not reloc'd
        self.assertFalse(any(r for _, r in ws[:8]))

    def test_stops_at_next_real_function(self):
        """Spanning must not bleed into the following real function."""
        ws = parse_words(_GAP_SPLIT, "func_0201f0f4")
        self.assertNotIn("e12fff1e", [w for w, _ in ws[10:]])  # func_next not captured
        self.assertEqual(parse_words(_GAP_SPLIT, "func_next"), [("e12fff1e", False)])

    def test_whole_function_matches_split_gap(self):
        """The headline: a whole-function .o is byte-identical to the split
        gap object once .L_ spanning + pool-tail stripping are applied."""
        mine = parse_words(_MINE_WHOLE, "func_0201f0f4")
        orig = parse_words(_GAP_SPLIT, "func_0201f0f4")
        ok, diffs = compare_words(mine, orig)
        self.assertTrue(ok, diffs)

    def test_pool_tail_stripped(self):
        ws = parse_words(_MINE_WHOLE, "func_0201f0f4")
        self.assertEqual(len(strip_pool_tail(ws)), 8)  # 2 reloc'd pool words dropped


class CompareSemantics(unittest.TestCase):
    def test_relocs_are_wildcards(self):
        """Differing pool targets (both reloc'd) must compare equal."""
        mine = [("e59f0000", False), ("aaaaaaaa", True)]
        orig = [("e59f0000", False), ("bbbbbbbb", True)]
        ok, _ = compare_words(mine, orig)
        self.assertTrue(ok)

    def test_real_opcode_diff_caught(self):
        mine = [("e3a00000", False), ("e12fff1e", False)]  # mov r0,#0
        orig = [("e3a00001", False), ("e12fff1e", False)]  # mov r0,#1
        ok, diffs = compare_words(mine, orig)
        self.assertFalse(ok)
        self.assertEqual(diffs[0][0], 0)

    def test_length_mismatch_caught(self):
        ok, diffs = compare_words(
            [("e3a00000", False)], [("e3a00000", False), ("e12fff1e", False)]
        )
        self.assertFalse(ok)


if __name__ == "__main__":
    unittest.main()
