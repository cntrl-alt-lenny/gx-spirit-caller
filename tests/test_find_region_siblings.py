"""Unit tests for tools/find_region_siblings.py.

Pins the v2 byte-level disambiguation logic. The integration path
(loading 3 regions' real symbol tables, running fingerprint match,
scoring HIGH/MEDIUM/LOW) is exercised by the brief 061 + brief 064
500-sample surveys; this test file pins the smaller pure-Python
units that the survey relies on so schema/algorithmic drift gets
caught at unittest time rather than after a survey re-run.

Run locally:
    python -m unittest tests.test_find_region_siblings
"""

from __future__ import annotations

import sys
import unittest
from pathlib import Path

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

from find_region_siblings import (  # noqa: E402
    Function,
    _byte_similarity,
    _mask_relocs,
    _score,
)


class TestByteSimilarity(unittest.TestCase):
    def test_empty_equal(self):
        self.assertEqual(_byte_similarity(b"", b""), 1.0)

    def test_identical(self):
        self.assertEqual(_byte_similarity(b"abc", b"abc"), 1.0)

    def test_disjoint(self):
        self.assertEqual(_byte_similarity(b"abc", b"xyz"), 0.0)

    def test_half_match(self):
        # 2 of 4 bytes equal → 0.5
        self.assertAlmostEqual(_byte_similarity(b"abcd", b"abef"), 0.5)

    def test_length_mismatch_returns_zero(self):
        self.assertEqual(_byte_similarity(b"abc", b"abcd"), 0.0)


class TestMaskRelocs(unittest.TestCase):
    def test_no_relocs_passthrough(self):
        self.assertEqual(
            _mask_relocs(b"\x01\x02\x03\x04", 0x100, []),
            b"\x01\x02\x03\x04",
        )

    def test_single_reloc_at_word_start(self):
        # Function starts at 0x100, reloc at 0x100 (offset 0).
        # The whole first 4-byte word should be zeroed.
        result = _mask_relocs(
            b"\xaa\xbb\xcc\xdd\xee\xff\x11\x22",
            0x100,
            [0x100],
        )
        self.assertEqual(result, b"\x00\x00\x00\x00\xee\xff\x11\x22")

    def test_reloc_mid_function_aligns_to_word(self):
        # Function starts at 0x100, reloc at 0x106.
        # Should zero the 4-byte aligned word at 0x104..0x107.
        result = _mask_relocs(
            b"\xaa\xbb\xcc\xdd\xee\xff\x11\x22",
            0x100,
            [0x106],
        )
        # rel = 6; aligned = 4; zero bytes 4..7
        self.assertEqual(result, b"\xaa\xbb\xcc\xdd\x00\x00\x00\x00")

    def test_multiple_relocs(self):
        # Two relocs at start and end.
        result = _mask_relocs(
            b"\xaa\xbb\xcc\xdd\xee\xff\x11\x22",
            0x100,
            [0x100, 0x104],
        )
        self.assertEqual(result, b"\x00\x00\x00\x00\x00\x00\x00\x00")

    def test_out_of_range_reloc_ignored(self):
        # Reloc past the function end should not corrupt earlier bytes.
        result = _mask_relocs(
            b"\xaa\xbb\xcc\xdd",
            0x100,
            [0x108],  # 8 bytes past start; out of range for a 4-byte func
        )
        self.assertEqual(result, b"\xaa\xbb\xcc\xdd")


class TestScore(unittest.TestCase):
    """Cover the fingerprint scoring function's branches.

    These are the v1 fingerprint paths — v2 byte-disambiguation
    runs on top of these. Ensures we don't regress the v1 baseline.
    """

    def _func(self, addr=0x100, size=0x20, name="func_test",
              ish="arm", module="main", rank=0,
              reloc_sig=()):
        return Function(
            addr=addr, size=size, name=name, ish=ish,
            module=module, rank=rank, reloc_sig=reloc_sig,
        )

    def test_identical_relocs_high(self):
        sig = ((0, "arm_call", "main"), (12, "load", "main"))
        a = self._func(reloc_sig=sig)
        b = self._func(addr=0x200, reloc_sig=sig)
        score, _rationale, conf = _score(a, b)
        self.assertEqual(conf, "HIGH")
        self.assertEqual(score, 1.0)

    def test_no_relocs_low(self):
        a = self._func(reloc_sig=())
        b = self._func(addr=0x200, reloc_sig=())
        score, _rationale, conf = _score(a, b)
        # No relocs to compare; ish matches → LOW
        self.assertEqual(conf, "LOW")

    def test_ish_mismatch_demoted(self):
        sig = ((0, "arm_call", "main"),)
        a = self._func(ish="arm", reloc_sig=sig)
        b = self._func(addr=0x200, ish="thumb", reloc_sig=sig)
        score, _rationale, conf = _score(a, b)
        self.assertEqual(conf, "NONE")

    def test_reloc_bag_match_offsets_drift(self):
        # Same (kind, target_module) pair but different offset →
        # MEDIUM via bag-match
        a_sig = ((0, "arm_call", "main"),)
        b_sig = ((4, "arm_call", "main"),)
        a = self._func(reloc_sig=a_sig)
        b = self._func(addr=0x200, reloc_sig=b_sig)
        score, _rationale, conf = _score(a, b)
        self.assertEqual(conf, "MEDIUM")


if __name__ == "__main__":
    unittest.main()
