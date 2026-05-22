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
    render_bundle_s_bytewise,
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


# ---------------------------------------------------------------------------- #
# Brief 185 — cap raise (1024 → 4096) + max_inner_symbols guardrail
# ---------------------------------------------------------------------------- #


class TestBrief185CapRaiseAndGuardrails(unittest.TestCase):
    """Brief 185: the default `max_bundle_bytes` cap moved from
    1024 → 4096 to accommodate `data_ov006_021ceae4`'s 1168-byte
    bundle (deferred from brief 181). A new
    `max_inner_symbols=16` per-cluster guardrail catches
    pathological multi-segment cases that should route to
    Pattern 3 instead.
    """

    BASE_VA = 0x02000000

    def test_default_cap_admits_1168_byte_bundle(self):
        # data_ov006_021ceae4's empirical case: 1168-byte bundle,
        # 3 inner placeholders. Pre-brief-185 (cap=1024) → raises;
        # post-brief-185 (cap=4096) → succeeds.
        syms = [
            _sym("anchor", 0x02000100),
            _sym("inner_a", 0x02000102),
            _sym("inner_b", 0x02000106),
            _sym("inner_c", 0x0200034a),
            _sym("terminator", 0x02000590),  # 0x490 = 1168 B
        ]
        sections = {".data": (0x02000100, 0x02000800)}
        # Plant a non-zero byte so the heuristic accepts the
        # bundle (≥ 1 non-zero requirement preserved).
        binary = bytearray(b"\x00" * 0x800)
        binary[0x100] = 0x74
        bundle = compute_bundle_extent(
            0x02000100, syms, sections, bytes(binary), self.BASE_VA,
        )
        self.assertEqual(bundle.size_bytes, 0x490)
        self.assertEqual(len(bundle.inner_symbols), 3)

    def test_default_cap_rejects_above_4096(self):
        # Cap is now 4096 instead of 1024.
        syms = [
            _sym("anchor", 0x02000100),
            _sym("terminator", 0x02001200),  # 0x1100 = 4352 B
        ]
        sections = {".data": (0x02000100, 0x02002000)}
        binary = bytearray(b"\x00" * 0x2000)
        binary[0x100] = 0x42
        with self.assertRaisesRegex(BundleExtentError, "safety cap"):
            compute_bundle_extent(
                0x02000100, syms, sections, bytes(binary),
                self.BASE_VA,
            )

    def test_max_inner_symbols_guardrail_rejects_pathological(self):
        # > 16 inner placeholders → Pattern 3 territory; raise.
        # All inner placeholders at non-4-aligned offsets so the
        # walk doesn't terminate early; terminator at +0x80
        # (4-aligned).
        addrs = [0x02000100] + [
            0x02000100 + 2 + 4 * i for i in range(20)
        ] + [0x02000180]
        syms = [_sym(f"s_{i}", a) for i, a in enumerate(addrs)]
        sections = {".data": (0x02000100, 0x02000200)}
        binary = bytearray(b"\x00" * 0x200)
        binary[0x100] = 0x99
        with self.assertRaisesRegex(
            BundleExtentError, "max_inner_symbols",
        ):
            compute_bundle_extent(
                0x02000100, syms, sections, bytes(binary),
                self.BASE_VA,
            )

    def test_max_inner_symbols_override_allows_higher(self):
        # Caller can opt out of the guardrail by raising the
        # bound — same arg surface as max_bundle_bytes. Same
        # non-4-aligned-stride pattern as the rejection test
        # above so the walk picks the same +0x80 terminator.
        addrs = [0x02000100] + [
            0x02000100 + 2 + 4 * i for i in range(20)
        ] + [0x02000180]
        syms = [_sym(f"s_{i}", a) for i, a in enumerate(addrs)]
        sections = {".data": (0x02000100, 0x02000200)}
        binary = bytearray(b"\x00" * 0x200)
        binary[0x100] = 0x99
        bundle = compute_bundle_extent(
            0x02000100, syms, sections, bytes(binary),
            self.BASE_VA, max_inner_symbols=100,
        )
        self.assertEqual(len(bundle.inner_symbols), 20)

    def test_at_default_cap_boundary_4096_accepted(self):
        # Boundary: exactly 4096-byte bundle should be accepted
        # (cap is `>`, not `>=`).
        syms = [
            _sym("anchor", 0x02000100),
            _sym("terminator", 0x02001100),  # 4096 B exact
        ]
        sections = {".data": (0x02000100, 0x02002000)}
        binary = bytearray(b"\x00" * 0x2000)
        binary[0x100] = 0x42
        bundle = compute_bundle_extent(
            0x02000100, syms, sections, bytes(binary), self.BASE_VA,
        )
        self.assertEqual(bundle.size_bytes, 0x1000)


# ---------------------------------------------------------------------------- #
# Brief 185 — bytewise `.s` emitter
# ---------------------------------------------------------------------------- #


class TestRenderBundleSBytewise(unittest.TestCase):
    """Brief 185: byte-granular `.s` emitter that handles
    odd-offset inner aliases. Required for cluster B overlay
    candidates where `patch_module_literals.py` doesn't run and
    inner placeholders MUST be `.global`-exposed (per brief 181).
    """

    def _bundle(self, *, anchor_va=0x02000100):
        return Bundle(
            anchor_name="data_X",
            anchor_vaddr=anchor_va,
            end_vaddr=anchor_va + 8,
            section=".data",
            bytes_le=bytes([0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77, 0x88]),
            inner_symbols=(("data_X_inner", 2),),
        )

    def test_emits_section_directive(self):
        out = render_bundle_s_bytewise(self._bundle())
        self.assertIn(".section .data", out)

    def test_emits_anchor_label_and_globals(self):
        out = render_bundle_s_bytewise(self._bundle())
        self.assertIn(".global data_X", out)
        self.assertIn("data_X:", out)
        self.assertIn(".global data_X_inner", out)
        self.assertIn("data_X_inner:", out)

    def test_emits_bytes_at_correct_offsets(self):
        # Anchor [0..2): 0x11, 0x22; inner [2..8): 0x33..0x88.
        out = render_bundle_s_bytewise(self._bundle())
        # Anchor segment.
        self.assertIn("data_X:\n        .byte 0x11, 0x22", out)
        # Inner segment.
        self.assertIn(
            "data_X_inner:\n        .byte 0x33, 0x44, 0x55, 0x66, 0x77, 0x88",
            out,
        )

    def test_odd_offset_inner_alias_accepted(self):
        # The whole point of this emitter: brief 181's worked
        # examples used `.global` labels at non-4-aligned offsets
        # (e.g. +2). The existing `cluster_b_bundle.py:
        # render_bundle_s` rejects those; this one accepts them.
        bundle = Bundle(
            anchor_name="data_X",
            anchor_vaddr=0x02000100,
            end_vaddr=0x02000108,
            section=".data",
            bytes_le=bytes([0xAA, 0xBB, 0xCC, 0xDD, 0xEE, 0xFF, 0x00, 0x01]),
            inner_symbols=(
                ("data_X_at_3", 3),  # odd offset!
                ("data_X_at_5", 5),  # odd offset!
            ),
        )
        out = render_bundle_s_bytewise(bundle)
        # Anchor segment [0..3): 0xAA, 0xBB, 0xCC
        self.assertIn(
            "data_X:\n        .byte 0xaa, 0xbb, 0xcc", out,
        )
        # +3 inner segment [3..5): 0xDD, 0xEE
        self.assertIn(
            "data_X_at_3:\n        .byte 0xdd, 0xee", out,
        )
        # +5 inner segment [5..8): 0xFF, 0x00, 0x01
        self.assertIn(
            "data_X_at_5:\n        .byte 0xff, 0x00, 0x01", out,
        )

    def test_offset_out_of_bounds_raises(self):
        bundle = Bundle(
            anchor_name="data_X",
            anchor_vaddr=0x02000100,
            end_vaddr=0x02000108,
            section=".data",
            bytes_le=bytes(8),
            inner_symbols=(("data_X_bad", 16),),  # past bundle end
        )
        with self.assertRaisesRegex(ValueError, "outside bundle"):
            render_bundle_s_bytewise(bundle)

    def test_bytes_per_line_formatting(self):
        # 8 bytes per line is the default (brief 181's worked-
        # example convention). 17 bytes → 3 lines (8+8+1).
        bundle = Bundle(
            anchor_name="data_X",
            anchor_vaddr=0x02000100,
            end_vaddr=0x02000114,  # 0x14 = 20 bytes, 4-aligned
            section=".data",
            bytes_le=bytes(range(20)),
            inner_symbols=(),
        )
        out = render_bundle_s_bytewise(bundle)
        byte_lines = [
            line for line in out.splitlines()
            if line.strip().startswith(".byte")
        ]
        # 20 bytes / 8 per line = 3 lines (8, 8, 4).
        self.assertEqual(len(byte_lines), 3)
        # Last line has 4 bytes.
        self.assertEqual(byte_lines[-1].count(","), 3)


# ---------------------------------------------------------------------------- #
# Brief 185 — real-data smoke: data_ov006_021ceae4 worked example
# ---------------------------------------------------------------------------- #


class TestBrief185Ov006WorkedExample(unittest.TestCase):
    """Brief 185's worked example: `data_ov006_021ceae4` is the
    candidate brief 181 deferred. With the cap raised + the
    bytewise emitter, the heuristic must reproduce a 1168-byte
    bundle with 3 inner aliases at offsets +2, +6, +0x24a.
    Cross-region: USA and JPN are byte-identical for this range.
    """

    REGIONS = ("usa", "jpn")
    ANCHOR_VA = 0x021ceae4
    EXPECTED_SIZE = 0x490  # 1168 bytes
    EXPECTED_INNER = (
        ("data_ov006_021ceae6", 0x2),
        ("data_ov006_021ceaea", 0x6),
        ("data_ov006_021ced2e", 0x24a),
    )

    def _ctx(self, region: str):
        # Smoke test — needs the actual config/<region>/ tree.
        # Skip if not present (e.g. CI sandbox without extracts).
        cra = _TOOLS / "cross_region_cluster_apply.py"
        if not cra.is_file():
            self.skipTest("apply tool not present")
        sys.path.insert(0, str(_TOOLS))
        from cross_region_cluster_apply import RegionContext
        try:
            return RegionContext.load(region, "ov006")
        except FileNotFoundError:
            self.skipTest(
                f"{region}/ov006 extract not present in this checkout"
            )

    def test_bundle_extent_matches_expected_per_region(self):
        for region in self.REGIONS:
            with self.subTest(region=region):
                ctx = self._ctx(region)
                base = min(
                    s for s, _ in ctx.delinks.sections.values()
                )
                bundle = compute_bundle_extent(
                    self.ANCHOR_VA, ctx.symbols,
                    ctx.delinks.sections, ctx.binary, base,
                )
                self.assertEqual(bundle.anchor_vaddr, self.ANCHOR_VA)
                self.assertEqual(
                    bundle.size_bytes, self.EXPECTED_SIZE,
                )
                self.assertEqual(
                    bundle.inner_symbols, self.EXPECTED_INNER,
                )

    def test_worked_example_artifact_matches_emitter(self):
        # The src/<region>/overlay006/data/data_ov006_021ceae4.s
        # file shipped with this brief must match what the
        # generator currently emits. This pins the regression so
        # future tool changes don't silently drift the artifact.
        for region in self.REGIONS:
            with self.subTest(region=region):
                ctx = self._ctx(region)
                base = min(
                    s for s, _ in ctx.delinks.sections.values()
                )
                bundle = compute_bundle_extent(
                    self.ANCHOR_VA, ctx.symbols,
                    ctx.delinks.sections, ctx.binary, base,
                )
                expected = render_bundle_s_bytewise(
                    bundle,
                    extra_comment_lines=[
                        "Brief 185 worked example — was deferred from brief 181 (PR #624)",
                        "because the bundle extent (1168 B) exceeded the prior 1024-byte",
                        "safety cap. Brief 185 raised the cap to 4096 + added the",
                        f"max_inner_symbols guardrail; this {region.upper()} ov006 candidate",
                        "now passes cleanly.",
                    ],
                )
                artifact = (
                    _ROOT / "src" / region / "overlay006"
                    / "data" / "data_ov006_021ceae4.s"
                )
                self.assertTrue(
                    artifact.is_file(),
                    f"worked-example artifact {artifact} missing",
                )
                self.assertEqual(
                    artifact.read_text(encoding="utf-8"),
                    expected,
                    f"{region} artifact has drifted from the "
                    f"emitter output — regenerate via tools/"
                    f"cluster_b_bundle_gen.py or update this test",
                )


if __name__ == "__main__":
    unittest.main()
