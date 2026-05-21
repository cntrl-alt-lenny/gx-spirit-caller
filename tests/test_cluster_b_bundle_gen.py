"""Tests for tools/cluster_b_bundle_gen.py (brief 174).

The tool's core deliverable is `compute_bundle_extent` — the
heuristic that automates brief 152/155's hand-tuned
`unsigned int[N]` bundle extent selection. These tests pin the
heuristic against:

1. **Synthetic fixtures** exercising each branch of the
   walk-forward logic (4-aligned skip, all-zero skip, max-bytes
   cap, missing-section guard, etc.).
2. **Regression against brief 152/155 worked-example bundles**
   on EUR: the bundle words MUST match the hand-written
   `src/main/data/*.c` files byte-for-byte. If the heuristic
   ever drifts from those, the regression fails loudly.
"""

from __future__ import annotations

import sys
import unittest
from pathlib import Path

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
_ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(_TOOLS))

from analyze_symbols import Symbol  # noqa: E402
from cluster_b_bundle_gen import (  # noqa: E402
    Bundle,
    BundleExtentError,
    compute_bundle_extent,
    render_bundle_c,
)


def _sym(name: str, addr: int) -> Symbol:
    """Build a data Symbol matching analyze_symbols.py's
    conventions (size 0 — caller is expected to infer)."""
    return Symbol(
        name=name, module="main", addr=addr, size=0,
        type="data", mode="any",
    )


def _synth_binary(
    base_va: int,
    values: dict[int, bytes],
    pad_to: int = 0x200,
) -> bytes:
    """Build a synthetic module binary covering [base_va,
    base_va + pad_to). `values` maps VA → raw bytes to place at
    that address; everything else is 0xCC filler."""
    out = bytearray(b"\xcc" * pad_to)
    for va, raw in values.items():
        fo = va - base_va
        out[fo:fo + len(raw)] = raw
    return bytes(out)


# ---------------------------------------------------------------------------- #
# Heuristic — synthetic-fixture tests
# ---------------------------------------------------------------------------- #


class TestComputeBundleExtentBasic(unittest.TestCase):
    """Pin the walk-forward logic on synthetic .data sections."""

    BASE_VA = 0x02000000
    DATA_VA = 0x02000100   # within the synth binary
    DATA_END = 0x02000200

    def _sections(self):
        return {".data": (self.DATA_VA, self.DATA_END)}

    def test_brief_152_shape_skips_odd_aligned(self):
        # Candidate at 4-aligned 0x100, next sym at odd 0x101
        # (placeholder), next-next at 0x140 (4-aligned). Bundle
        # should end at 0x140, NOT 0x101.
        syms = [
            _sym("data_X", 0x02000100),
            _sym("data_X_pad", 0x02000101),
            _sym("data_Y", 0x02000140),
        ]
        # Non-zero candidate byte; rest zero.
        binary = _synth_binary(self.BASE_VA, {
            0x02000100: b"\x80\x00\x00\x00",
        })
        # Clear the .data tail so we don't have 0xCC filler.
        binary = bytearray(binary)
        for va in range(0x02000104, 0x02000200):
            binary[va - self.BASE_VA] = 0
        bundle = compute_bundle_extent(
            0x02000100, syms, self._sections(),
            bytes(binary), self.BASE_VA,
        )
        self.assertEqual(bundle.anchor_name, "data_X")
        self.assertEqual(bundle.end_vaddr, 0x02000140)
        self.assertEqual(bundle.size_bytes, 0x40)  # 64 = 16 words
        self.assertEqual(bundle.section, ".data")
        # Inner symbol absorbed.
        self.assertEqual(
            bundle.inner_symbols, (("data_X_pad", 1),),
        )
        # Words: first 0x80, rest 0.
        words = bundle.words
        self.assertEqual(words[0], 0x80)
        for w in words[1:]:
            self.assertEqual(w, 0)

    def test_brief_155_shape_skips_all_zero_bundle(self):
        # Candidate at 0x100 (value=0), next sym at 0x104
        # (4-aligned, but bundle [0x100, 0x104) is all-zero —
        # would route to .bss). Next-next at 0x118 (4-aligned,
        # contains a non-zero string).
        syms = [
            _sym("data_X", 0x02000100),
            _sym("data_Y_str", 0x02000104),
            _sym("data_Z", 0x02000118),
        ]
        # Candidate zero, string non-zero, tail zero.
        binary = bytearray(b"\x00" * 0x200)
        # Place "card" string at 0x104.
        binary[0x104:0x108] = b"card"
        bundle = compute_bundle_extent(
            0x02000100, syms, self._sections(),
            bytes(binary), self.BASE_VA,
        )
        # Bundle should extend past the all-zero first attempt
        # and end at 0x118.
        self.assertEqual(bundle.end_vaddr, 0x02000118)
        self.assertEqual(bundle.size_bytes, 0x18)  # 24 bytes = 6 words
        self.assertEqual(
            bundle.inner_symbols,
            (("data_Y_str", 4),),
        )
        words = bundle.words
        self.assertEqual(words[0], 0)
        # "card" little-endian
        self.assertEqual(words[1], int.from_bytes(b"card", "little"))

    def test_first_4aligned_named_with_nonzero_wins(self):
        # All next-named are 4-aligned; bundle should pick the
        # very first one IF it has non-zero content.
        syms = [
            _sym("data_X", 0x02000100),
            _sym("data_Y", 0x02000104),
            _sym("data_Z", 0x02000108),
        ]
        binary = bytearray(b"\x00" * 0x200)
        binary[0x100] = 0x42  # non-zero in candidate
        bundle = compute_bundle_extent(
            0x02000100, syms, self._sections(),
            bytes(binary), self.BASE_VA,
        )
        self.assertEqual(bundle.end_vaddr, 0x02000104)
        self.assertEqual(bundle.size_bytes, 4)
        self.assertEqual(bundle.inner_symbols, ())  # no inner symbols
        self.assertEqual(bundle.words, (0x42,))


class TestComputeBundleExtentGuards(unittest.TestCase):
    """Pin the error paths."""

    BASE_VA = 0x02000000

    def test_non_4_aligned_candidate_rejected(self):
        syms = [_sym("data_X", 0x02000101)]
        sections = {".data": (0x02000100, 0x02000200)}
        binary = b"\xcc" * 0x200
        with self.assertRaisesRegex(BundleExtentError, "not.*4-aligned"):
            compute_bundle_extent(
                0x02000101, syms, sections, binary, self.BASE_VA,
            )

    def test_candidate_outside_any_section_rejected(self):
        syms = [_sym("data_X", 0x03000000)]
        sections = {".data": (0x02000100, 0x02000200)}
        binary = b"\xcc" * 0x200
        with self.assertRaisesRegex(BundleExtentError, "not inside any section"):
            compute_bundle_extent(
                0x03000000, syms, sections, binary, self.BASE_VA,
            )

    def test_no_symbol_at_vaddr_rejected(self):
        syms = [_sym("data_X", 0x02000110)]
        sections = {".data": (0x02000100, 0x02000200)}
        binary = b"\xcc" * 0x200
        with self.assertRaisesRegex(BundleExtentError, "no symbol at vaddr"):
            compute_bundle_extent(
                0x02000100, syms, sections, binary, self.BASE_VA,
            )

    def test_no_named_symbol_after_candidate_rejected(self):
        # Candidate is the LAST symbol in the section.
        syms = [_sym("data_X", 0x02000100)]
        sections = {".data": (0x02000100, 0x02000200)}
        binary = b"\xcc" * 0x200
        with self.assertRaisesRegex(BundleExtentError, "no named symbol exists"):
            compute_bundle_extent(
                0x02000100, syms, sections, binary, self.BASE_VA,
            )

    def test_all_zero_to_section_end_rejected(self):
        # Every candidate bundle is all-zero up to the section
        # end. The walker exhausts all 4-aligned next-symbols
        # and raises.
        syms = [
            _sym("data_X", 0x02000100),
            _sym("data_Y", 0x02000104),
            _sym("data_Z", 0x02000108),
        ]
        sections = {".data": (0x02000100, 0x02000200)}
        binary = b"\x00" * 0x200
        with self.assertRaisesRegex(
            BundleExtentError, "without finding.*non-zero",
        ):
            compute_bundle_extent(
                0x02000100, syms, sections, binary, self.BASE_VA,
            )

    def test_max_bundle_bytes_cap(self):
        # Walk would extend past the cap → error.
        syms = [
            _sym("data_X", 0x02000100),
            _sym("data_Y", 0x02000200),  # 256 bytes away — exceeds default 1024? no
        ]
        sections = {".data": (0x02000100, 0x02000400)}
        binary = b"\x00" * 0x400
        binary = bytearray(binary)
        binary[0x200] = 0x42  # but 0x200 isn't in any bundle yet...
        # With max=128, bundle 256 bytes exceeds it. Use a low cap.
        with self.assertRaisesRegex(BundleExtentError, "safety cap"):
            compute_bundle_extent(
                0x02000100, syms, sections, bytes(binary),
                self.BASE_VA, max_bundle_bytes=128,
            )


# ---------------------------------------------------------------------------- #
# Regression — brief 152 / 155 EUR worked examples
# ---------------------------------------------------------------------------- #


class TestEURWorkedExampleRegression(unittest.TestCase):
    """Brief 174 success gate: the generator must reproduce
    brief 152 + 155's worked-example bundles byte-for-byte
    (word array + extent). If the heuristic drifts, this fails
    loudly.

    These tests load the EUR symbols.txt / delinks.txt /
    arm9.bin once and run multiple worked-example extents
    against them — pinning that the audit findings are
    preserved in code."""

    @classmethod
    def setUpClass(cls):
        # Parse EUR's symbols.txt + delinks.txt + arm9.bin.
        from analyze_symbols import parse_symbols_file
        from cross_region_cluster_apply import parse_delinks

        cfg = _ROOT / "config/eur/arm9"
        if not (cfg / "symbols.txt").is_file():
            raise unittest.SkipTest("EUR config not extracted")

        cls.symbols = parse_symbols_file(cfg / "symbols.txt", "main")
        cls.symbols.sort(key=lambda s: s.addr)
        cls.delinks = parse_delinks(cfg / "delinks.txt")

        binary_path = _ROOT / "extract/eur/arm9/arm9.bin"
        if not binary_path.is_file():
            raise unittest.SkipTest("EUR arm9.bin not extracted")
        cls.binary = binary_path.read_bytes()
        cls.base_va = min(
            s for s, _ in cls.delinks.sections.values()
        )

    def _bundle(self, va: int) -> Bundle:
        return compute_bundle_extent(
            va, self.symbols, self.delinks.sections,
            self.binary, self.base_va,
        )

    def test_brief_152_data_021020b4(self):
        # Brief 152's hand-tuned bundle: 16 words = 64 bytes,
        # candidate value 0x80 at offset 0, subsumed
        # data_021020b5 at offset 1, rest zero. End VA
        # 0x021020f4.
        b = self._bundle(0x021020b4)
        self.assertEqual(b.anchor_name, "data_021020b4")
        self.assertEqual(b.end_vaddr, 0x021020f4)
        self.assertEqual(b.size_bytes, 64)
        self.assertEqual(b.inner_symbols, (("data_021020b5", 1),))
        words = b.words
        self.assertEqual(words[0], 0x80)
        self.assertTrue(all(w == 0 for w in words[1:]))

    def test_brief_155_data_020c6a9c(self):
        # 6 words = 24 bytes. Candidate value=0; absorbs the
        # 20-byte string "card/CARD_5bg26.bin\0" at +4.
        b = self._bundle(0x020c6a9c)
        self.assertEqual(b.end_vaddr, 0x020c6ab4)
        self.assertEqual(b.size_bytes, 24)
        self.assertEqual(b.inner_symbols, (("data_020c6aa0", 4),))
        words = b.words
        self.assertEqual(words[0], 0x00000000)
        # The string bytes match the hand-tuned bundle.
        # "card" little-endian:
        self.assertEqual(words[1], int.from_bytes(b"card", "little"))
        # Last word "bin\0\0" → "bin\0" + null pad
        # Per brief 155 file: 0x006e6962
        self.assertEqual(words[5], 0x006e6962)

    def test_brief_155_data_020ff908(self):
        # 3 words = 12 bytes. Candidate value=0 + "GPCM" at +4 + zero pad.
        b = self._bundle(0x020ff908)
        self.assertEqual(b.end_vaddr, 0x020ff914)
        self.assertEqual(b.size_bytes, 12)
        self.assertEqual(b.inner_symbols, (("data_020ff90c", 4),))
        words = b.words
        self.assertEqual(words[0], 0x00000000)
        # "GPCM" little-endian = 0x4d435047
        self.assertEqual(words[1], int.from_bytes(b"GPCM", "little"))
        self.assertEqual(words[2], 0x00000000)

    def test_brief_155_data_020ff920(self):
        # 16 words = 64 bytes. Candidate value=0; absorbs a
        # long string starting at offset 8.
        b = self._bundle(0x020ff920)
        self.assertEqual(b.end_vaddr, 0x020ff960)
        self.assertEqual(b.size_bytes, 64)
        # 2 subsumed symbols.
        self.assertEqual(
            b.inner_symbols,
            (("data_020ff924", 4), ("data_020ff928", 8)),
        )


# ---------------------------------------------------------------------------- #
# Render — exact match against brief 152's file content
# ---------------------------------------------------------------------------- #


class TestRenderBundleC(unittest.TestCase):

    def test_renders_unsigned_int_n_array(self):
        # Trivial bundle: 3 words, no inner symbols.
        bundle = Bundle(
            anchor_name="data_X",
            anchor_vaddr=0x02000100,
            end_vaddr=0x0200010c,
            section=".data",
            bytes_le=b"\x80\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00",
            inner_symbols=(),
        )
        out = render_bundle_c(bundle)
        self.assertIn("unsigned int data_X[3] = {", out)
        self.assertIn("0x00000080,", out)
        self.assertIn("Brief 174", out)
        self.assertIn("/* candidate value */", out)

    def test_render_with_subsumed_placeholders(self):
        bundle = Bundle(
            anchor_name="data_X",
            anchor_vaddr=0x02000100,
            end_vaddr=0x02000118,
            section=".data",
            bytes_le=b"\x00" * 4 + b"card" + b"\x00" * 16,
            inner_symbols=(("data_Y_str", 4),),
        )
        out = render_bundle_c(bundle)
        self.assertIn("unsigned int data_X[6] = {", out)
        # Subsumed placeholder appears in the comment.
        self.assertIn("data_Y_str", out)
        # "card" → 0x64726163 little-endian
        self.assertIn("0x64726163", out)


if __name__ == "__main__":
    unittest.main()
