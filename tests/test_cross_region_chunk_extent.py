"""Tests for tools/cross_region_chunk_extent.py (brief 177).

The tool's core deliverable is `adjust_chunk_extent` — the
multi-symbol generalisation of brief 174's bundle-extent
heuristic. These tests pin the algorithm against:

1. **Synthetic fixtures** exercising each phase (start-adjust,
   end-adjust, iterative end-extension, all guard rails).
2. **Regression against the brief 175 USA ov006 example** —
   the worked example shipped in this PR — to ensure the
   adjustment matches what we built the tool around.
"""

from __future__ import annotations

import sys
import unittest
from pathlib import Path

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
_ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(_TOOLS))

from analyze_symbols import Symbol  # noqa: E402
from cross_region_chunk_extent import (  # noqa: E402
    ChunkExtentError,
    adjust_chunk_extent,
)


def _sym(name: str, addr: int) -> Symbol:
    return Symbol(
        name=name, module="main", addr=addr, size=0,
        type="data", mode="any",
    )


def _binary(base_va: int, values: dict[int, bytes], pad_to: int = 0x1000) -> bytes:
    out = bytearray(b"\xcc" * pad_to)
    for va, raw in values.items():
        fo = va - base_va
        out[fo:fo + len(raw)] = raw
    return bytes(out)


# --------------------------------------------------------------------------- #
# Synthetic fixtures — Phase A (start-adjust)
# --------------------------------------------------------------------------- #


class TestPhaseA(unittest.TestCase):
    """Pin the left-side start-adjustment logic."""

    BASE_VA = 0x02000000
    DATA_VA = 0x02000100
    DATA_END = 0x02000800

    def _sections(self):
        return {".data": (self.DATA_VA, self.DATA_END)}

    def test_no_adjustment_when_start_at_named(self):
        # Target start IS at a named-symbol vaddr → no Phase A change.
        syms = [
            _sym("data_X", 0x02000100),
            _sym("data_Y", 0x02000140),
            _sym("data_Z", 0x02000180),
        ]
        binary = _binary(self.BASE_VA, {
            0x02000100: b"\xaa" * 0x40,
        })
        result = adjust_chunk_extent(
            0x02000100, 0x02000140, syms, self._sections(),
            binary, self.BASE_VA,
        )
        self.assertEqual(result.start, 0x02000100)
        self.assertEqual(result.target_start, 0x02000100)

    def test_lower_start_to_absorb_predecessor(self):
        # Predecessor's extent reaches into target chunk → lower start.
        syms = [
            _sym("data_PRED", 0x02000100),
            _sym("data_AFTER", 0x02000200),
        ]
        # PRED's extent = 0x02000200 - 0x02000100 = 256 bytes
        # → reaches past target_start (0x02000180)
        binary = _binary(self.BASE_VA, {
            0x02000100: b"\xaa" * 0x100,
        })
        result = adjust_chunk_extent(
            0x02000180, 0x02000200, syms, self._sections(),
            binary, self.BASE_VA,
        )
        # Start lowered to data_PRED's vaddr.
        self.assertEqual(result.start, 0x02000100)
        self.assertEqual(result.start_delta, 0x80)

    def test_phase_a_rejects_non_4_aligned_predecessor(self):
        # Predecessor at non-4-aligned vaddr → can't lower.
        syms = [
            _sym("data_PRED_odd", 0x02000101),
            _sym("data_AFTER", 0x02000200),
        ]
        binary = _binary(self.BASE_VA, {
            0x02000100: b"\xaa" * 0x100,
        })
        with self.assertRaisesRegex(ChunkExtentError, "non-4-aligned"):
            adjust_chunk_extent(
                0x02000180, 0x02000200, syms, self._sections(),
                binary, self.BASE_VA,
            )

    def test_phase_a_skips_when_no_predecessor(self):
        # Target start at section start → no predecessor to consider.
        syms = [
            _sym("data_X", 0x02000200),
        ]
        binary = _binary(self.BASE_VA, {
            0x02000100: b"\xaa" * 0x100,
        })
        result = adjust_chunk_extent(
            0x02000100, 0x02000200, syms, self._sections(),
            binary, self.BASE_VA,
        )
        # Start stays at target.
        self.assertEqual(result.start, 0x02000100)


# --------------------------------------------------------------------------- #
# Synthetic fixtures — Phase B (end-adjust)
# --------------------------------------------------------------------------- #


class TestPhaseB(unittest.TestCase):

    BASE_VA = 0x02000000
    DATA_VA = 0x02000100
    DATA_END = 0x02000800

    def _sections(self):
        return {".data": (self.DATA_VA, self.DATA_END)}

    def test_no_adjustment_when_extents_fit(self):
        # All inner extents fit within target end + end is at
        # named-symbol boundary.
        syms = [
            _sym("data_X", 0x02000100),
            _sym("data_Y", 0x02000140),
            _sym("data_Z", 0x02000200),
        ]
        binary = _binary(self.BASE_VA, {
            0x02000100: b"\xaa" * 0x100,
        })
        result = adjust_chunk_extent(
            0x02000100, 0x02000200, syms, self._sections(),
            binary, self.BASE_VA,
        )
        self.assertEqual(result.end, 0x02000200)
        self.assertEqual(result.end_delta, 0)

    def test_extend_end_to_cover_inner_extent(self):
        # Last inner symbol's extent reaches past target end.
        syms = [
            _sym("data_X", 0x02000100),
            _sym("data_Y", 0x02000140),  # extent = 0x80 (to data_Z)
            _sym("data_Z", 0x020001c0),
            _sym("data_END", 0x02000200),
        ]
        binary = _binary(self.BASE_VA, {
            0x02000100: b"\xaa" * 0x100,
        })
        # Target end 0x02000180 splits data_Y's extent (which
        # reaches to 0x020001c0) → must extend to 0x020001c0.
        result = adjust_chunk_extent(
            0x02000100, 0x02000180, syms, self._sections(),
            binary, self.BASE_VA,
        )
        # End raised to 0x020001c0 (data_Z's vaddr).
        self.assertGreaterEqual(result.end, 0x020001c0)

    def test_phase_b_iterates_to_chain(self):
        # Chain: target end forces 1 absorption. After
        # absorption, end lands at data_B's vaddr (0x140) — which
        # is OUTSIDE the chunk (`s.addr < end` is exclusive). So
        # no further iteration needed; final end = 0x140.
        #
        # This pins the EXCLUSIVE-end semantics: a named symbol AT
        # `end` belongs to the next gap-file, not the chunk, so
        # its extent doesn't constrain this chunk.
        syms = [
            _sym("data_X", 0x02000100),
            _sym("data_A", 0x02000110),  # extent → data_B (0x140)
            _sym("data_B", 0x02000140),  # extent → data_END (0x200)
            _sym("data_END", 0x02000200),
        ]
        binary = _binary(self.BASE_VA, {
            0x02000100: b"\xaa" * 0x100,
        })
        result = adjust_chunk_extent(
            0x02000100, 0x02000120, syms, self._sections(),
            binary, self.BASE_VA,
        )
        # Phase B iter 1: data_A's extent (0x140) > end (0x120)
        #   → end raised to 0x140
        # Phase B iter 2: inner now [data_X, data_A] (data_B at
        #   0x140 is NOT inner). data_A's extent 0x140 == end →
        #   stable.
        self.assertEqual(result.end, 0x02000140)
        # data_B not absorbed (it's at the exclusive end).
        names = [n for n, _ in result.inner_symbols]
        self.assertIn("data_A", names)
        self.assertNotIn("data_B", names)


# --------------------------------------------------------------------------- #
# Synthetic fixtures — full pipeline + guards
# --------------------------------------------------------------------------- #


class TestFullPipeline(unittest.TestCase):

    BASE_VA = 0x02000000
    DATA_VA = 0x02000100
    DATA_END = 0x02000800

    def _sections(self):
        return {".data": (self.DATA_VA, self.DATA_END)}

    def test_brief_175_shape_left_extend_then_right_extend(self):
        # Both Phase A AND Phase B trigger. Matches the brief 175
        # ov006 case structurally:
        #   - predecessor at 0x100, extent to 0x200 → reaches past
        #     target_start (0x180) → lower start to 0x100
        #   - inside [0x100, 0x300): data_X (extent 0x200),
        #     data_Y (extent 0x400) → extend end to 0x400
        syms = [
            _sym("data_X", 0x02000100),  # extent → data_Y (0x200)
            _sym("data_Y", 0x02000200),  # extent → data_Z (0x400)
            _sym("data_Z", 0x02000400),
        ]
        binary = _binary(self.BASE_VA, {
            0x02000100: b"\xaa" * 0x300,
        })
        result = adjust_chunk_extent(
            0x02000180, 0x02000300, syms, self._sections(),
            binary, self.BASE_VA,
        )
        # Phase A: start lowered to 0x02000100.
        self.assertEqual(result.start, 0x02000100)
        # Phase B: end extended to 0x02000400 (covers data_Y's
        # extent).
        self.assertEqual(result.end, 0x02000400)
        # Inner symbols include both X and Y.
        names = [n for n, _ in result.inner_symbols]
        self.assertIn("data_X", names)
        self.assertIn("data_Y", names)

    def test_require_nonzero_data_section(self):
        # `.data` chunk with all-zero bytes → raise.
        syms = [
            _sym("data_X", 0x02000100),
            _sym("data_Y", 0x02000140),
        ]
        binary = b"\x00" * 0x1000
        with self.assertRaisesRegex(ChunkExtentError, "route to .bss"):
            adjust_chunk_extent(
                0x02000100, 0x02000140, syms, self._sections(),
                binary, self.BASE_VA,
            )

    def test_rodata_section_skips_nonzero_check(self):
        # `.rodata` chunks don't have the bss-routing concern;
        # all-zero is OK.
        syms = [
            _sym("data_X", 0x02000100),
            _sym("data_Y", 0x02000140),
        ]
        binary = b"\x00" * 0x1000
        sections = {".rodata": (self.DATA_VA, self.DATA_END)}
        # Should NOT raise — `.rodata` exempt.
        result = adjust_chunk_extent(
            0x02000100, 0x02000140, syms, sections,
            binary, self.BASE_VA,
        )
        self.assertEqual(result.section, ".rodata")

    def test_target_outside_any_section(self):
        with self.assertRaisesRegex(ChunkExtentError, "not inside any section"):
            adjust_chunk_extent(
                0x03000000, 0x03000010, [], self._sections(),
                b"", self.BASE_VA,
            )

    def test_target_end_beyond_section(self):
        # Target end > section end → reject.
        with self.assertRaisesRegex(ChunkExtentError, "exceeds section"):
            adjust_chunk_extent(
                0x02000100, 0x02100000, [], self._sections(),
                b"\xaa" * 0x1000, self.BASE_VA,
            )

    def test_target_end_le_target_start_rejected(self):
        with self.assertRaisesRegex(ChunkExtentError, "must be >"):
            adjust_chunk_extent(
                0x02000100, 0x02000100, [], self._sections(),
                b"\xaa" * 0x1000, self.BASE_VA,
            )

    def test_was_adjusted_flag(self):
        # No-op case: was_adjusted is False.
        syms = [
            _sym("data_X", 0x02000100),
            _sym("data_Y", 0x02000110),
        ]
        binary = _binary(self.BASE_VA, {0x02000100: b"\xaa" * 0x10})
        result = adjust_chunk_extent(
            0x02000100, 0x02000110, syms, self._sections(),
            binary, self.BASE_VA,
        )
        self.assertFalse(result.was_adjusted)


# --------------------------------------------------------------------------- #
# Regression — brief 175 USA ov006 worked example
# --------------------------------------------------------------------------- #


class TestBrief175USAOv006(unittest.TestCase):
    """Brief 177's headline worked example: the USA ov006 chunk
    that brief 175 hit as the FIRST failure of mechanical D-3
    cross-region apply. The adjusted extent computed by this
    tool MUST match the values used to ship the worked example
    (else the tool drifted and the worked example wouldn't
    SHA1 PASS)."""

    @classmethod
    def setUpClass(cls):
        from analyze_symbols import parse_symbols_file
        from cross_region_cluster_apply import parse_delinks

        cfg = _ROOT / "config/usa/arm9/overlays/ov006"
        if not (cfg / "symbols.txt").is_file():
            raise unittest.SkipTest("USA ov006 config not extracted")
        cls.symbols = parse_symbols_file(cfg / "symbols.txt", "ov006")
        cls.delinks = parse_delinks(cfg / "delinks.txt")
        binary_path = _ROOT / "extract/usa/arm9_overlays/ov006.bin"
        if not binary_path.is_file():
            raise unittest.SkipTest("USA ov006.bin not extracted")
        cls.binary = binary_path.read_bytes()
        cls.base_va = min(s for s, _ in cls.delinks.sections.values())

    def test_adjusts_brief_175_target_extent(self):
        # Target: [0x021cca88, 0x021ccd08) per brief 175's
        # research note. Expected adjustment:
        #   start lowered to 0x021cca68 (absorb data_ov006_021cca68)
        #   end raised to 0x021ccf68 (cover data_ov006_021ccce8's extent)
        adj = adjust_chunk_extent(
            0x021cca88, 0x021ccd08, self.symbols,
            self.delinks.sections, self.binary, self.base_va,
        )
        self.assertEqual(adj.start, 0x021cca68)
        self.assertEqual(adj.end, 0x021ccf68)
        self.assertEqual(adj.size_bytes, 1280)  # 0x500
        self.assertEqual(adj.section, ".data")
        self.assertTrue(adj.was_adjusted)
        # 2 inner symbols: data_ov006_021cca68 + data_ov006_021ccce8.
        names = [n for n, _ in adj.inner_symbols]
        self.assertIn("data_ov006_021cca68", names)
        self.assertIn("data_ov006_021ccce8", names)


if __name__ == "__main__":
    unittest.main()
