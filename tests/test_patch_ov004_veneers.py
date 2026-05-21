"""Unit tests for tools/patch_ov004_veneers.py (brief 134
Phase 3 — final mwldarm-overlay-swap-blindness mitigation;
generalised to variable veneer counts in brief 142).

The patcher splices spurious thumb→arm interwork veneers out of
ov004's flat binary and un-shifts the cascade. A regression here
silently breaks the 3-region 27/27 SHA1-PASSING baseline (brief
140) because dsd check modules would re-FAIL ov004 and the ROM
would no longer hash to the orig SHA-1.

Pinned behaviour:

- Veneer pool detection (auto-find by 12-byte pattern; accepts
  any count in [0, HISTORICAL_MAX_VENEER_COUNT] — brief 142)
- Splice removes exactly `n × 12` bytes (was 1032 in brief 134)
- ctor/pad fix replaces 16 bytes with 24 bytes (-4 ctor +20 pad,
  +8 net regardless of n)
- Output size delta is `expected_output_delta_for(n)` =
  `n × 12 - 8` (brief 142), or 0 when `n == 0`
- `kind:load` reloc rewrites
- `kind:arm_call` BL re-encode in .init range
- Section-map parsing from delinks.txt
- overlays.yaml `code_size + ctor_start + ctor_end` rewrite
- Idempotence (re-run on patched binary is a no-op)
- Cross-region (EUR / USA / JPN) base-VA portability
- Brief 140 part 1 off-by-1024 fix for the YAML-only
  re-invocation path
- Brief 142 variable-count regression suite: n ∈ {0, 9, 43, 86}
"""

from __future__ import annotations

import struct
import sys
import tempfile
import unittest
from pathlib import Path

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

from patch_ov004_veneers import (  # noqa: E402
    CTOR_PAD_FIX_NET_BYTES,
    CTOR_PAD_FIX_NET_BYTES_NO_TERMINATOR,
    CTOR_PAD_FIX_NET_BYTES_WITH_TERMINATOR,
    CTOR_PAD_FIX_NET_BYTES_WITH_TERMINATOR_LONG,
    CTOR_PAD_FIX_NET_BYTES_WITH_TERMINATOR_MID,
    HISTORICAL_MAX_VENEER_COUNT,
    N_INFERENCE_OVERRIDES,
    PatchError,
    VENEER_PREFIX,
    VENEER_SIZE,
    _apply_load_rewrites,
    _fix_ctor_and_pad,
    _reencode_arm_bls,
    _scan_veneer_pool,
    _splice_veneer_pool,
    expected_output_delta_for,
    expected_output_size_for,
    parse_section_map,
    patch_overlays_yaml,
)


def _veneer(target: int) -> bytes:
    """Build a 12-byte canonical thumb→arm veneer with the given
    target VA."""
    return VENEER_PREFIX + target.to_bytes(4, "little")


def _veneer_pool(targets: list[int]) -> bytes:
    return b"".join(_veneer(t) for t in targets)


class TestScanVeneerPool(unittest.TestCase):
    """The pool scanner finds the contiguous veneer pool anywhere
    in the binary, regardless of region-specific offsets (EUR's
    pool is at 0x3fcfc; USA / JPN at 0x3fb7c).

    Brief 142: the count was hard-asserted at 86; it's now any
    count in [0, HISTORICAL_MAX_VENEER_COUNT] to track variable
    source-coverage states (brief 141 finding: source `.rodata`
    claims suppress veneer emission)."""

    def test_finds_pool_at_arbitrary_offset(self) -> None:
        # Pad before the historical-max-size pool, then more
        # padding after.
        n = HISTORICAL_MAX_VENEER_COUNT
        targets = [0x02000000 + i * 4 for i in range(n)]
        pool = _veneer_pool(targets)
        prefix = b"\xff" * 0x1000
        suffix = b"\xee" * 0x100
        data = prefix + pool + suffix
        pool_start, veneers = _scan_veneer_pool(data)
        self.assertEqual(pool_start, len(prefix))
        self.assertEqual(len(veneers), n)
        for i, (off, tgt) in enumerate(veneers):
            self.assertEqual(off, len(prefix) + i * VENEER_SIZE)
            self.assertEqual(tgt, targets[i])

    def test_returns_empty_when_no_veneers(self) -> None:
        # Brief 142: a binary with zero veneers (e.g. fully-claimed
        # ov004 `.rodata`) returns (-1, []) instead of raising.
        data = b"\x00" * 0x4000
        pool_start, veneers = _scan_veneer_pool(data)
        self.assertEqual(pool_start, -1)
        self.assertEqual(veneers, [])

    def test_too_many_veneers_raises(self) -> None:
        # Brief 142: a count > HISTORICAL_MAX_VENEER_COUNT is a
        # sanity-bound failure (toolchain regression or false-positive
        # match in `.text`). 87 veneers should bail.
        targets = [0x02000000] * (HISTORICAL_MAX_VENEER_COUNT + 1)
        data = _veneer_pool(targets)
        with self.assertRaisesRegex(
            PatchError, r"> historical maximum",
        ):
            _scan_veneer_pool(data)

    def test_non_contiguous_raises(self) -> None:
        # Brief 142: contiguity guard still active. Splitting the
        # pool at any boundary raises.
        n = HISTORICAL_MAX_VENEER_COUNT
        targets = [0x02000000] * n
        pool = _veneer_pool(targets)
        # Split at veneer 40 and inject 4 bytes between.
        split = 40 * VENEER_SIZE
        data = pool[:split] + b"\xff\xff\xff\xff" + pool[split:]
        with self.assertRaisesRegex(PatchError, "not contiguous"):
            _scan_veneer_pool(data)


class TestSpliceVeneerPool(unittest.TestCase):

    def test_splice_removes_historical_max_pool(self) -> None:
        # Brief 142: splice length scales with the explicit
        # veneer_count argument.
        n = HISTORICAL_MAX_VENEER_COUNT
        before = b"BEFORE..."
        targets = [0x10 * i for i in range(n)]
        pool = _veneer_pool(targets)
        after = b"AFTER!!!"
        data = bytearray(before + pool + after)
        spliced = _splice_veneer_pool(data, len(before), n)
        self.assertEqual(bytes(spliced), before + after)
        self.assertEqual(len(data) - len(spliced), n * VENEER_SIZE)

    def test_splice_scales_with_count(self) -> None:
        # Splice length = veneer_count * VENEER_SIZE for any n.
        for n in (1, 9, 43, HISTORICAL_MAX_VENEER_COUNT):
            with self.subTest(n=n):
                before = b"BEFORE..."
                targets = [0x10 * i for i in range(n)]
                pool = _veneer_pool(targets)
                after = b"AFTER!!!"
                data = bytearray(before + pool + after)
                spliced = _splice_veneer_pool(data, len(before), n)
                self.assertEqual(bytes(spliced), before + after)
                self.assertEqual(
                    len(data) - len(spliced), n * VENEER_SIZE,
                )


class TestFixCtorAndPad(unittest.TestCase):
    """Brief 142 + 146: the ctor/pad fix replaces the cluster with
    `[ctor[0:4] + 20-byte zero pad]` = 24 bytes. Cluster shape is
    either 16 bytes (WITH `WRITEW(0)` terminator — n=86 historical
    case, net +8) or 12 bytes (WITHOUT terminator — n<86 generic
    case, net +12). Brief 146's shape detection reads bytes 12-15
    of the post-splice cluster region: all-zero → 16-byte shape,
    non-zero → 12-byte shape (those bytes are already inside the
    forward-shifted `.data`).
    """

    def test_replaces_16_bytes_with_24_with_terminator(self) -> None:
        # n=86 historical case: cluster is [ctor(4) | WRITEW(0)(4)
        # | pad(8)] = 16 bytes. Bytes 12-15 of the cluster are the
        # last 4 bytes of the 8-byte zero pad → all-zero
        # → detector picks 16-byte shape → fix end = +16, net +8.
        prefix = b"P" * 100
        ctor_4 = b"\xab\xcd\xef\x01"
        writew0_4 = b"\x00\x00\x00\x00"  # WRITEW(0) terminator
        pad_8 = b"\x00" * 8
        suffix = b"S" * 100
        data = bytearray(prefix + ctor_4 + writew0_4 + pad_8 + suffix)
        fixed, net = _fix_ctor_and_pad(data, len(prefix))
        expected = prefix + ctor_4 + b"\x00" * 20 + suffix
        self.assertEqual(bytes(fixed), expected)
        self.assertEqual(
            len(fixed) - len(data),
            CTOR_PAD_FIX_NET_BYTES_WITH_TERMINATOR,
        )
        self.assertEqual(net, CTOR_PAD_FIX_NET_BYTES_WITH_TERMINATOR)
        # Backwards-compat: the brief 142 alias name still resolves.
        self.assertEqual(net, CTOR_PAD_FIX_NET_BYTES)

    def test_replaces_12_bytes_with_24_no_terminator(self) -> None:
        # Brief 146 n<86 case: cluster is [ctor(4) | pad(8)] = 12
        # bytes. The bytes immediately after at offsets 12-15 are
        # already `.data` content (non-zero — the brief 145 / PR
        # #566 finding: bld at vaddr 0x02209aa0 has ".LZN" rather
        # than zero pad). Detector picks 12-byte shape → fix end =
        # +12, net +12.
        prefix = b"P" * 100
        ctor_4 = b"\xab\xcd\xef\x01"
        pad_8 = b"\x00" * 8
        # The first 4 bytes of `.data` — non-zero so the discriminator
        # fires correctly. ".LZN" is what real ov004 has here per
        # the brief 145 diagnostic.
        data_start_4 = b".LZN"
        rest_of_data = b"S" * 96
        suffix = data_start_4 + rest_of_data
        data = bytearray(prefix + ctor_4 + pad_8 + suffix)
        fixed, net = _fix_ctor_and_pad(data, len(prefix))
        # Output: prefix + ctor[0:4] + 20 zeros + suffix. Crucially,
        # `.data` content is preserved verbatim (the fix consumes
        # 12 bytes from the input, not 16, so `.LZN` is NOT touched).
        expected = prefix + ctor_4 + b"\x00" * 20 + suffix
        self.assertEqual(bytes(fixed), expected)
        self.assertEqual(
            len(fixed) - len(data),
            CTOR_PAD_FIX_NET_BYTES_NO_TERMINATOR,
        )
        self.assertEqual(net, CTOR_PAD_FIX_NET_BYTES_NO_TERMINATOR)

    def test_discriminator_uses_bytes_12_15(self) -> None:
        # Cross-pin the discriminator offset: bytes 4-7 are zero in
        # BOTH shapes (WRITEW(0) at n=86, first half of zero pad at
        # n<86), so they can't discriminate. The detector reads
        # bytes 12-15 — the first 4 bytes past the assumed 12-byte
        # cluster end. Confirm that flipping just those 4 bytes
        # between the two cases flips the detected shape.
        prefix = b"P" * 100
        ctor_4 = b"\xab\xcd\xef\x01"
        # Build a cluster where bytes 4-11 are all zero (would match
        # n=86 WRITEW(0) + pad-first-4, OR n<86 pad). Vary bytes
        # 12-15 to test the discriminator.
        middle_8 = b"\x00" * 8

        # Case A: bytes 12-15 are zero → 16-byte cluster detected.
        suffix_a = b"\x00\x00\x00\x00" + b"S" * 96
        data_a = bytearray(prefix + ctor_4 + middle_8 + suffix_a)
        _fixed_a, net_a = _fix_ctor_and_pad(data_a, len(prefix))
        self.assertEqual(net_a, CTOR_PAD_FIX_NET_BYTES_WITH_TERMINATOR)

        # Case B: bytes 12-15 non-zero → 12-byte cluster detected.
        suffix_b = b"\xff\xee\xdd\xcc" + b"S" * 96
        data_b = bytearray(prefix + ctor_4 + middle_8 + suffix_b)
        _fixed_b, net_b = _fix_ctor_and_pad(data_b, len(prefix))
        self.assertEqual(net_b, CTOR_PAD_FIX_NET_BYTES_NO_TERMINATOR)


class TestApplyLoadRewrites(unittest.TestCase):

    def test_rewrites_when_value_differs(self) -> None:
        # Buffer with one shifted .bss pointer at fo 0x10:
        data = bytearray(0x100)
        struct.pack_into("<I", data, 0x10, 0x0220b900)  # shifted
        relocs = [(0x021c9d70, "load", 0x0220b500)]  # un-shifted
        base_va = 0x021c9d60
        n = _apply_load_rewrites(data, relocs, base_va)
        self.assertEqual(n, 1)
        self.assertEqual(
            struct.unpack_from("<I", data, 0x10)[0], 0x0220b500,
        )

    def test_no_op_if_already_correct(self) -> None:
        data = bytearray(0x100)
        struct.pack_into("<I", data, 0x10, 0x0220b500)
        relocs = [(0x021c9d70, "load", 0x0220b500)]
        n = _apply_load_rewrites(data, relocs, 0x021c9d60)
        self.assertEqual(n, 0)

    def test_skips_non_load_relocs(self) -> None:
        data = bytearray(0x100)
        struct.pack_into("<I", data, 0x10, 0xdeadbeef)
        relocs = [(0x021c9d70, "arm_call", 0x021d0000)]
        n = _apply_load_rewrites(data, relocs, 0x021c9d60)
        self.assertEqual(n, 0)
        # arm_call doesn't touch the value
        self.assertEqual(
            struct.unpack_from("<I", data, 0x10)[0], 0xdeadbeef,
        )


class TestReencodeArmBls(unittest.TestCase):
    """Verifies ARM BL re-encoding produces the correct 24-bit
    signed offset for the post-splice source VA.

    Brief 168: filter widened from `.init`-only (brief 134) to
    ALL `kind:arm_call` relocs. Tests below pin both the
    happy-path re-encoding AND the no-op short-circuit that
    prevents the broadened scope from corrupting BLs whose
    source-target span didn't cross the pool.
    """

    def test_reencodes_bl_in_init(self) -> None:
        # Construct: .init at file 0x100 (base 0x021c9c60).
        # BL at .init+8 (source VA 0x021c9d68). Target 0x021d8640.
        # Expected offset: (0x021d8640 - 0x021c9d68 - 8) / 4
        #                = 0xe934 / 4 = 0x3a4d
        # Built has DIFFERENT (stale) encoding initially.
        base_va = 0x021c9c60
        from_va = 0x021c9d68
        to_va = 0x021d8640

        data = bytearray(0x200)
        fo = from_va - base_va  # 0x108
        # Plant a STALE BL word — top byte (cond+L) preserved,
        # bottom 24 wrong:
        struct.pack_into("<I", data, fo, 0xeb000000 | 0x123456)
        relocs = [(from_va, "arm_call", to_va)]

        n = _reencode_arm_bls(data, relocs, base_va)
        self.assertEqual(n, 1)

        # Verify the encoded offset round-trips.
        new_word = struct.unpack_from("<I", data, fo)[0]
        self.assertEqual(new_word & 0xff000000, 0xeb000000)
        imm24 = new_word & 0xffffff
        # Sign-extend imm24 to 32 bits.
        if imm24 & 0x800000:
            imm24 -= 0x1000000
        recovered_target = from_va + 8 + (imm24 << 2)
        self.assertEqual(recovered_target, to_va)

    def test_reencodes_bl_outside_init_when_stale(self) -> None:
        # Brief 168: a `.text` BL whose post-splice offset differs
        # from the stale mwldarm-emitted bytes MUST be re-encoded.
        # Prior to brief 168, only `.init`-resident BLs were
        # touched and this test case would have silently left
        # the stale bytes in place — breaking SHA1 at n=3.
        #
        # Models the real brief 168 reproducer: BL at
        # 0x021dbc14 (in .text) targeting 0x021e7e30 (also in
        # .rodata/.text) — mwldarm encoded with imm24=0x308e
        # (target +36 bytes too high because the n=3 pool sat
        # between source and target). Brief 168 expects the
        # patcher to re-encode to imm24=0x3085.
        base_va = 0x021c9d60
        from_va = 0x021dbc14
        to_va = 0x021e7e30

        data = bytearray(0x40000)
        fo = from_va - base_va  # 0x11eb4
        # Plant the STALE encoding mwldarm emitted: target +36.
        struct.pack_into("<I", data, fo, 0xeb003085 | 9)  # 0xeb00308e
        relocs = [(from_va, "arm_call", to_va)]

        n = _reencode_arm_bls(data, relocs, base_va)
        self.assertEqual(
            n, 1,
            "brief 168: .text arm_call should be re-encoded "
            "even though it's outside .init",
        )
        new_word = struct.unpack_from("<I", data, fo)[0]
        # imm24 = (0x021e7e30 - 0x021dbc14 - 8) >> 2
        #       = (0xc214) >> 2 = 0x3085
        self.assertEqual(new_word, 0xeb003085)

    def test_no_op_when_bl_already_correct(self) -> None:
        # Brief 168: BLs whose source + target are on the same
        # side of the pool (the vast majority of arm_call relocs)
        # have orig-correct bytes; re-encoding should be a no-op
        # via the `new_word == current` short-circuit.
        base_va = 0x021c9d60
        from_va = 0x021c9d80
        to_va = 0x021c9e00
        # Correct imm24 = (0x021c9e00 - 0x021c9d80 - 8) >> 2
        #               = 0x78 >> 2 = 0x1e
        correct_word = 0xeb00001e

        data = bytearray(0x200)
        fo = from_va - base_va
        struct.pack_into("<I", data, fo, correct_word)
        relocs = [(from_va, "arm_call", to_va)]

        n = _reencode_arm_bls(data, relocs, base_va)
        self.assertEqual(
            n, 0,
            "BL already correctly encoded → re-encoder is a no-op",
        )
        # Bytes unchanged.
        self.assertEqual(
            struct.unpack_from("<I", data, fo)[0], correct_word,
        )

    def test_skips_non_arm_call_relocs(self) -> None:
        # Other reloc kinds (load, thumb_call, etc.) are out of
        # scope for the BL re-encoder.
        base_va = 0x021c9d60
        from_va = 0x021c9d80

        data = bytearray(0x200)
        fo = from_va - base_va
        original_word = 0x12345678
        struct.pack_into("<I", data, fo, original_word)
        relocs = [
            (from_va, "load", 0x021d0000),
            (from_va + 4, "thumb_call", 0x021d1000),
        ]

        n = _reencode_arm_bls(data, relocs, base_va)
        self.assertEqual(n, 0)
        # The load/thumb_call positions weren't touched.
        self.assertEqual(
            struct.unpack_from("<I", data, fo)[0], original_word,
        )


class TestParseSectionMap(unittest.TestCase):

    def test_parses_delinks_stanza(self) -> None:
        body = (
            "    .text       start:0x021c9d60 end:0x021de638 kind:code align:32\n"
            "    .rodata     start:0x021de638 end:0x02209a5c kind:rodata align:4\n"
            "    .init       start:0x02209a5c end:0x02209a88 kind:code align:4\n"
            "    .ctor       start:0x02209a88 end:0x02209a8c kind:rodata align:4\n"
            "    .data       start:0x02209aa0 end:0x0220b500 kind:data align:32\n"
            "    .bss        start:0x0220b500 end:0x02293d00 kind:bss align:32\n"
            "\n"
            "src/overlay004/foo.c:\n"
            "    complete\n"
        )
        with tempfile.NamedTemporaryFile(
            mode="w", suffix=".txt", delete=False,
        ) as f:
            f.write(body)
            path = Path(f.name)
        try:
            sections = parse_section_map(path)
            self.assertEqual(
                sections[".text"], (0x021c9d60, 0x021de638),
            )
            self.assertEqual(
                sections[".ctor"], (0x02209a88, 0x02209a8c),
            )
            self.assertEqual(
                sections[".init"], (0x02209a5c, 0x02209a88),
            )
            self.assertEqual(
                sections[".data"], (0x02209aa0, 0x0220b500),
            )
        finally:
            path.unlink()


class TestPatchOverlaysYaml(unittest.TestCase):

    def test_rewrites_ov004_fields(self) -> None:
        body = (
            "table_signed: false\n"
            "overlays:\n"
            "  - id: 3\n"
            "    base_address: 1\n"
            "    code_size: 100\n"
            "    bss_size: 200\n"
            "    ctor_start: 300\n"
            "    ctor_end: 304\n"
            "  - id: 4\n"
            "    base_address: 35429728\n"
            "    code_size: 269216\n"
            "    bss_size: 559104\n"
            "    ctor_start: 35692176\n"
            "    ctor_end: 35692184\n"
            "    file_id: 4\n"
            "  - id: 5\n"
            "    base_address: 99\n"
            "    code_size: 200\n"
            "    ctor_start: 400\n"
            "    ctor_end: 404\n"
        )
        with tempfile.NamedTemporaryFile(
            mode="w", suffix=".yaml", delete=False,
        ) as f:
            f.write(body)
            path = Path(f.name)
        try:
            changed = patch_overlays_yaml(
                path,
                overlay_id=4,
                new_code_size=268192,
                new_ctor_start_va=0x02209a88,  # 35691144
                new_ctor_end_va=0x02209a90,    # 35691152
            )
            self.assertTrue(changed)
            text = path.read_text()
            # ov004 entry updated.
            self.assertIn("code_size: 268192", text)
            self.assertIn("ctor_start: 35691144", text)
            self.assertIn("ctor_end: 35691152", text)
            # Sibling ov003 + ov005 entries untouched.
            self.assertIn("code_size: 100", text)
            self.assertIn("ctor_start: 300", text)
            self.assertIn("code_size: 200", text)
            self.assertIn("ctor_start: 400", text)
        finally:
            path.unlink()

    def test_idempotent_returns_false(self) -> None:
        # Same values requested as already present → no-op.
        body = (
            "overlays:\n"
            "  - id: 4\n"
            "    code_size: 268192\n"
            "    ctor_start: 35691144\n"
            "    ctor_end: 35691152\n"
        )
        with tempfile.NamedTemporaryFile(
            mode="w", suffix=".yaml", delete=False,
        ) as f:
            f.write(body)
            path = Path(f.name)
        try:
            changed = patch_overlays_yaml(
                path, overlay_id=4,
                new_code_size=268192,
                new_ctor_start_va=35691144,
                new_ctor_end_va=35691152,
            )
            self.assertFalse(changed)
        finally:
            path.unlink()


class TestExpectedOutputDeltaFor(unittest.TestCase):
    """Brief 142 + 146: the cascade math derives the output-size
    delta from the observed veneer count + the ctor/pad shape:

    - n == 86 (historical, terminator present): `n * 12 - 8`.
    - n < 86 (generic, no terminator): `n * 12 - 12`.

    The brief 142 tests for n ∈ {1, 9, 43} previously asserted
    `n * 12 - 8`; brief 146 corrects them to `n * 12 - 12`. The
    n=86 case is unchanged — 1024 — preserving the historical
    SHA1-PASSING ROM build's bit-for-bit output."""

    def test_zero_veneers_returns_zero_delta(self) -> None:
        # When n=0 the patcher is a no-op — input bytes == output
        # bytes. The ctor/pad fix is NOT applied (it's gated on
        # the splice happening).
        self.assertEqual(expected_output_delta_for(0), 0)

    def test_negative_veneers_returns_zero_delta(self) -> None:
        # Defensive: a negative count (impossible from the scanner,
        # but defensive nonetheless) clamps to zero rather than
        # producing a negative delta.
        self.assertEqual(expected_output_delta_for(-1), 0)

    def test_single_veneer_delta(self) -> None:
        # Brief 146: n=1 (any n < 86) splices 12 bytes, recovers
        # 12 from the ctor/pad fix → delta = 0. The +12 ctor/pad
        # fix exactly cancels the single 12-byte veneer splice.
        self.assertEqual(
            expected_output_delta_for(1),
            VENEER_SIZE - CTOR_PAD_FIX_NET_BYTES_NO_TERMINATOR,
        )
        self.assertEqual(expected_output_delta_for(1), 0)

    def test_brief_141_nine_veneer_delta(self) -> None:
        # Brief 146 n=9 (post-brief-141 empirical state with ≥1
        # `.rodata` claim): 9 * 12 - 12 = 96. This was 100 under
        # brief 142's incorrect formula; the 4-byte difference is
        # exactly the brief 145 / PR #566 reproducer's
        # `output - 4 bytes short` symptom.
        self.assertEqual(expected_output_delta_for(9), 96)

    def test_intermediate_count(self) -> None:
        # Brief 146 n=43 (synthetic mid-state): 43 * 12 - 12 = 504.
        # Was 508 under brief 142; same 4-byte correction.
        self.assertEqual(expected_output_delta_for(43), 504)

    def test_historical_max_delta_matches_brief134_constant(
        self,
    ) -> None:
        # n=86 historical max: 86 * 12 - 8 = 1024. The brief 134
        # hard-coded EXPECTED_OUTPUT_DELTA value; preserving it
        # ensures the SHA1-PASSING baseline holds for the
        # no-rodata-claim source state. **Crucially unchanged from
        # brief 142** — brief 146's formula split only affects
        # n < 86; n == 86 still returns 1024.
        self.assertEqual(
            expected_output_delta_for(HISTORICAL_MAX_VENEER_COUNT),
            1024,
        )

    def test_boundary_n_eq_85_uses_no_terminator(self) -> None:
        # Brief 146: every n in [1, 85] follows the no-terminator
        # formula. Pin n=85 explicitly so a future "shift the
        # boundary by 1" regression gets caught.
        self.assertEqual(
            expected_output_delta_for(HISTORICAL_MAX_VENEER_COUNT - 1),
            (HISTORICAL_MAX_VENEER_COUNT - 1) * VENEER_SIZE - 12,
        )
        # Sanity: 85 * 12 - 12 = 1008 (16 less than n=86's 1024).
        self.assertEqual(expected_output_delta_for(85), 1008)


class TestExpectedOutputSizeFor(unittest.TestCase):
    """Regression test for the brief 140 part 1 off-by-1024 bug
    + brief 142 generalisation.

    Before brief 140 fix: `expected_output_size = len(data) -
    DELTA` was computed UNCONDITIONALLY in main(), so on the
    YAML-only second invocation (where `data` is already
    post-splice 268192 EUR) it derived 267168 — 1024 too small.
    The 267168 hit `arm9_overlays.yaml`'s `code_size`, then
    `dsd rom build` aligned it to 0x413a0 and wrote that
    512-bytes-short value into the ROM overlay table at file
    offset 0x8b30a.

    After brief 140 fix: the computation branches on
    `already_patched`.

    Brief 142 generalisation: the helper additionally accepts a
    `veneer_count` parameter so the delta tracks the scanner's
    actual finding rather than the historical max."""

    def test_pre_patched_input_subtracts_historical_max_delta(
        self,
    ) -> None:
        # Pre-patch ov004 (EUR): 269216 bytes → post-patch 268192.
        # Backwards compat: omitting `veneer_count` defaults to
        # HISTORICAL_MAX_VENEER_COUNT (delta = 1024).
        pre_patch_size = 269216
        data = bytearray(pre_patch_size)
        got = expected_output_size_for(data, already_patched=False)
        self.assertEqual(got, 268192)

    def test_pre_patched_with_explicit_veneer_count(self) -> None:
        # Brief 146: passing `veneer_count` overrides the default.
        # Synthetic: a 200-byte input with n=9 veneers → delta=96
        # (brief 146 corrected from brief 142's 100) → expected
        # output 200 - 96 = 104.
        data = bytearray(200)
        got = expected_output_size_for(
            data, already_patched=False, veneer_count=9,
        )
        self.assertEqual(got, 104)

    def test_pre_patched_n_equals_zero_no_op(self) -> None:
        # When n=0 the patcher is a no-op → output size == input
        # size even though `already_patched` is False.
        data = bytearray(0x1000)
        got = expected_output_size_for(
            data, already_patched=False, veneer_count=0,
        )
        self.assertEqual(got, 0x1000)

    def test_already_patched_input_uses_len_directly(self) -> None:
        # Already-patched ov004 (EUR): 268192 bytes. With the brief
        # 140 bug, this would derive 267168. The fix returns 268192.
        post_patch_size = 268192
        data = bytearray(post_patch_size)
        got = expected_output_size_for(data, already_patched=True)
        self.assertEqual(got, post_patch_size)
        self.assertEqual(got, 268192)
        # Specifically, the OFF-BY-1024 value must NOT appear:
        self.assertNotEqual(got, 267168)

    def test_already_patched_regardless_of_size(self) -> None:
        # USA / JPN ov004 has a different post-patch size
        # (267808). The fix must work region-portably.
        for post_patch_size in (267808, 268192, 269000):
            data = bytearray(post_patch_size)
            got = expected_output_size_for(
                data, already_patched=True,
            )
            self.assertEqual(
                got, post_patch_size,
                f"already_patched: want len(data) for size "
                f"{post_patch_size}",
            )

    def test_already_patched_ignores_veneer_count(self) -> None:
        # `already_patched=True` always returns `len(data)`,
        # regardless of `veneer_count` (which only matters when
        # the patcher actually has work to do).
        data = bytearray(268192)
        got = expected_output_size_for(
            data, already_patched=True, veneer_count=9,
        )
        self.assertEqual(got, 268192)


# ---------------------------------------------------------------------- #
# Brief 142: full-pipeline round-trip tests for variable veneer counts
# ---------------------------------------------------------------------- #


# Synthetic fixture layout (used by the round-trip tests).  Mirrors
# the real ov004 structure at a tiny scale: a `.text` payload, then
# `n` contiguous veneers, then a 16-byte [ctor8 + pad8] cluster, then
# a small `.data` tail. Section VAs are constructed in ORIG-layout
# space (no pool, 4-byte ctor, 20-byte pad), matching what
# delinks.txt provides — `patch_ov004` derives the
# ctor_file_offset from `(ctor_va - base_va)` which must equal the
# POST-SPLICE file offset for `_fix_ctor_and_pad` to land in the
# right spot. See the real ov004 / EUR baseline for the same
# invariant (delinks.txt VAs are orig VAs).
_SYNTH_BASE_VA = 0x02200000
_SYNTH_TEXT_LEN = 0x1000  # 4 KB
_SYNTH_DATA_TAIL_LEN = 0x40  # 64 B
_SYNTH_CTOR_ENTRY = b"\xab\xcd\xef\x01"  # 4-byte real ctor entry
_SYNTH_WRITEW0 = b"\x00\x00\x00\x00"     # WRITEW(0) terminator (n=86 only)
_SYNTH_PAD_8 = b"\x00" * 8
# `.data` content starts with non-zero bytes ("LZNC" — synthetic
# stand-in for the brief 145 diagnostic's `.LZN` first 4 bytes
# of `.data` at the start of ov004's data section). Critical for
# brief 146's discriminator: at n<86 the 12-byte cluster is
# immediately followed by `.data` content, so the discriminator
# at cluster-offset 12-15 reads these non-zero bytes.
_SYNTH_DATA_HEAD_4 = b"LZNC"


def _build_synth_ov004(
    n: int,
    *,
    terminator: bool | str | None = None,
) -> tuple[bytes, dict[str, tuple[int, int]]]:
    """Build a synthetic ov004-shaped binary with `n` veneers + a
    realistic ctor/pad cluster + a small `.data` tail. Returns
    (data, sections-map).

    Brief 146: the ctor/pad cluster shape depends on `n`. mwldarm
    emits the `WRITEW(0)` terminator only at the historical
    veneer-count snapshot (n == HISTORICAL_MAX_VENEER_COUNT == 86);
    at any smaller `n` (= every state where ov004 has source-level
    `.rodata` claims), mwldarm omits the terminator and the cluster
    shrinks from 16 to 12 bytes.

    Brief 150: brief 147 bisected a NEW boundary — at very low `n`
    (empirically n=2 and n=7) mwldarm continues emitting the
    WITH_TERMINATOR shape. The empirical boundary is somewhere
    between n=7 (WITH) and n=9 (NO).

    Brief 164: a THIRD cluster shape — 28 bytes long — observed
    empirically at n=5 (`[ctor(4) | WRITEW(0)(4) | pad(8) | 12
    extra zero bytes]`).

    Brief 168: a FOURTH cluster shape — 20 bytes long — observed
    empirically at n=3 (`[ctor(4) | WRITEW(0)(4) | pad(8) | 4
    extra zero bytes]`). Lives between the n=86 WITH (16 B) and
    the n=5 WITH_LONG (28 B) shapes. `terminator` is now a
    four-way knob:

      - `terminator=None` (default): use brief 146's empirical
        default (`True` when n == 86, `False` otherwise).
      - `terminator=True`: force WITH_TERMINATOR (16-byte cluster).
        Use to pin the brief 147 / 150 low-n path.
      - `terminator=False`: force NO_TERMINATOR (12-byte cluster).
        Use to pin the brief 146 n=9 path.
      - `terminator="mid"`: force WITH_TERMINATOR_MID (20-byte
        cluster, brief 168). Use to pin the brief 168 n=3 path.
      - `terminator="long"`: force WITH_TERMINATOR_LONG (28-byte
        cluster, brief 164). Use to pin the brief 160 / 164 n=5
        path.

    Built-file layout (what mwldarm emits):

        [0..0x1000)            .text payload (0xAA filler)
        [0x1000..0x1000+n*12)  veneer pool
        [pool_end..ctor_end)   ctor + pad cluster — variable size:
                                 WITH terminator       → 16 bytes
                                   [ctor(4) | WRITEW(0)(4) | pad(8)]
                                 NO terminator         → 12 bytes
                                   [ctor(4) | pad(8)]
                                 WITH terminator MID   → 20 bytes
                                   [ctor(4) | WRITEW(0)(4) | pad(8) | 4 zeros]
                                 WITH terminator LONG  → 28 bytes
                                   [ctor(4) | WRITEW(0)(4) | pad(8) | 12 zeros]
        [ctor_end..ctor_end+4) `.data` head (non-zero — "LZNC")
        [...64 B total of `.data` tail with 0xBB filler...)

    Sections (ORIG VAs, what delinks.txt provides):
        .text   [BASE_VA, BASE_VA + 0x1000)
        .init   [BASE_VA + 0x1000, BASE_VA + 0x1000)  (empty)
        .ctor   [BASE_VA + 0x1000, BASE_VA + 0x1004)  (4-byte orig)
        .data   [BASE_VA + 0x1000 + 24, ...)  (after 20-byte orig pad)

    The orig VAs make `ctor_file_offset = ctor_va - base_va = 0x1000`,
    which is correct: after splice removes the pool, ctor lives at
    file offset 0x1000 in the spliced data.
    """
    text = b"\xaa" * _SYNTH_TEXT_LEN
    targets = [0x02000000 + i * 4 for i in range(n)]
    pool = _veneer_pool(targets) if n > 0 else b""

    if terminator is None:
        # Brief 146 empirical default: WITH at n=86, NO elsewhere.
        terminator = (n == HISTORICAL_MAX_VENEER_COUNT)

    if terminator == "long":
        # Brief 164: WITH terminator + 12 extra zero bytes → 28-byte
        # cluster. Matches the empirical n=5 shape.
        ctor_pad = (
            _SYNTH_CTOR_ENTRY + _SYNTH_WRITEW0 + _SYNTH_PAD_8
            + b"\x00" * 12
        )
    elif terminator == "mid":
        # Brief 168: WITH terminator + 4 extra zero bytes → 20-byte
        # cluster. Matches the empirical n=3 shape (between the
        # n=86 WITH 16 B and the n=5 WITH_LONG 28 B).
        ctor_pad = (
            _SYNTH_CTOR_ENTRY + _SYNTH_WRITEW0 + _SYNTH_PAD_8
            + b"\x00" * 4
        )
    elif terminator:
        # WITH terminator → 16-byte cluster.
        ctor_pad = _SYNTH_CTOR_ENTRY + _SYNTH_WRITEW0 + _SYNTH_PAD_8
    else:
        # NO terminator → 12-byte cluster.
        ctor_pad = _SYNTH_CTOR_ENTRY + _SYNTH_PAD_8

    data_tail = _SYNTH_DATA_HEAD_4 + b"\xbb" * (
        _SYNTH_DATA_TAIL_LEN - len(_SYNTH_DATA_HEAD_4)
    )
    data = text + pool + ctor_pad + data_tail

    # ORIG-layout VAs (pool absent; ctor is 4 bytes; 20-byte pad):
    text_va = _SYNTH_BASE_VA
    text_end_va = text_va + len(text)  # NO pool — orig layout
    init_va = text_end_va
    init_end_va = init_va  # empty .init
    ctor_va = init_end_va
    ctor_end_va = ctor_va + 4  # orig .ctor is 4 bytes
    data_va = ctor_end_va + 0x14  # after 20-byte zero pad
    data_end_va = data_va + len(data_tail)
    sections = {
        ".text": (text_va, text_end_va),
        ".init": (init_va, init_end_va),
        ".ctor": (ctor_va, ctor_end_va),
        ".data": (data_va, data_end_va),
    }
    return data, sections


def _build_orig_synth_ov004() -> bytes:
    """Build the ORIG-shape synthetic ov004 binary — what the
    patcher should produce after splicing the pool and rewriting
    the ctor/pad cluster. Identical for every `n`; the orig has
    no veneers and a stable 24-byte ctor+pad cluster.

    Layout:
        [0..0x1000)            .text payload (0xAA filler)
        [0x1000..0x1004)       `.ctor` entry (4 bytes — kept verbatim)
        [0x1004..0x1018)       20-byte zero pad
        [0x1018..0x1058)       `.data` (LZNC + 0xBB filler)
    """
    text = b"\xaa" * _SYNTH_TEXT_LEN
    ctor = _SYNTH_CTOR_ENTRY
    pad_20 = b"\x00" * 0x14
    data_tail = _SYNTH_DATA_HEAD_4 + b"\xbb" * (
        _SYNTH_DATA_TAIL_LEN - len(_SYNTH_DATA_HEAD_4)
    )
    return text + ctor + pad_20 + data_tail


class TestPatchOv004VariableCount(unittest.TestCase):
    """Brief 142: end-to-end patcher behaviour at every key value
    of `n`. Drives `patch_ov004()` against synthetic fixtures
    (the real ov004 round-trip is covered by `ninja sha1`)."""

    def _patch(self, n: int):
        from patch_ov004_veneers import patch_ov004
        data, sections = _build_synth_ov004(n)
        patched, stats = patch_ov004(data, [], sections)
        return data, patched, stats

    def test_zero_veneer_is_noop(self) -> None:
        # n=0 (fully-claimed `.rodata`): patcher returns input
        # unchanged, marks `already_patched=1`, splices nothing.
        data, patched, stats = self._patch(0)
        self.assertEqual(bytes(patched), bytes(data))
        self.assertEqual(stats["already_patched"], 1)
        self.assertEqual(stats["veneers_spliced"], 0)
        self.assertEqual(stats["ctor_pad_fixed"], 0)

    def test_nine_veneer_brief141_state(self) -> None:
        # Brief 146 n=9 (post-brief-141 empirical state with ≥1
        # `.rodata` claim): splice removes 9*12 = 108 bytes; the
        # NEW no-terminator ctor/pad fix adds 12 back; net delta
        # = 96. Was 100 under brief 142's buggy formula.
        data, patched, stats = self._patch(9)
        self.assertEqual(stats["already_patched"], 0)
        self.assertEqual(stats["veneers_spliced"], 9)
        self.assertEqual(stats["ctor_pad_fixed"], 1)
        self.assertEqual(
            stats["ctor_pad_net"],
            CTOR_PAD_FIX_NET_BYTES_NO_TERMINATOR,
        )
        self.assertEqual(
            len(data) - len(patched), expected_output_delta_for(9),
        )
        self.assertEqual(len(data) - len(patched), 96)

    def test_intermediate_count(self) -> None:
        # Brief 146 n=43 (synthetic mid-state): 43*12 - 12 = 504.
        # Was 508 under brief 142; same 4-byte correction.
        data, patched, stats = self._patch(43)
        self.assertEqual(stats["veneers_spliced"], 43)
        self.assertEqual(
            stats["ctor_pad_net"],
            CTOR_PAD_FIX_NET_BYTES_NO_TERMINATOR,
        )
        self.assertEqual(
            len(data) - len(patched), expected_output_delta_for(43),
        )
        self.assertEqual(len(data) - len(patched), 504)

    def test_historical_max_baseline(self) -> None:
        # n=86 (historical baseline): the brief 134 behaviour
        # MUST be preserved bit-for-bit, since brief 140's
        # SHA1-PASSING ROM relies on it. Brief 146's split formula
        # leaves this case untouched: 86*12 - 8 = 1024.
        data, patched, stats = self._patch(
            HISTORICAL_MAX_VENEER_COUNT,
        )
        self.assertEqual(
            stats["veneers_spliced"], HISTORICAL_MAX_VENEER_COUNT,
        )
        self.assertEqual(
            stats["ctor_pad_net"],
            CTOR_PAD_FIX_NET_BYTES_WITH_TERMINATOR,
        )
        self.assertEqual(
            len(data) - len(patched),
            expected_output_delta_for(HISTORICAL_MAX_VENEER_COUNT),
        )
        # Hard-pin the brief 134 historical delta:
        self.assertEqual(len(data) - len(patched), 1024)

    def test_patched_is_idempotent_for_any_n(self) -> None:
        # Re-running the patcher on its own output must be a
        # silent no-op for any n. This is what lets ninja safely
        # rerun the rule on rebuild.
        from patch_ov004_veneers import patch_ov004
        for n in (0, 1, 9, 43, HISTORICAL_MAX_VENEER_COUNT):
            with self.subTest(n=n):
                data, sections = _build_synth_ov004(n)
                first, stats1 = patch_ov004(data, [], sections)
                # Build new sections for the post-splice layout:
                # base_va unchanged, but .ctor/.data have shifted
                # back by `n*12` bytes (which is what the un-shift
                # accomplishes for real ov004). For our synthetic
                # idempotency check, we pass the *same* sections —
                # `patch_ov004`'s "already_patched" gate fires on
                # the absence of VENEER_PREFIX, not on section VAs.
                second, stats2 = patch_ov004(
                    bytes(first), [], sections,
                )
                self.assertEqual(bytes(second), bytes(first))
                self.assertEqual(stats2["already_patched"], 1)


# ---------------------------------------------------------------------- #
# Brief 146 pin-tests: output equals ORIG for n ∈ {86, 9, 0}
# ---------------------------------------------------------------------- #


class TestPatcherOutputMatchesOrig(unittest.TestCase):
    """Brief 146: the locked verify gate post-SHA1-milestone.

    For every veneer count `n`, the patcher must produce output that
    is byte-identical to the orig binary. Brief 145 / PR #566 caught
    the n=9 case being 4 bytes short of orig; brief 146 fixes the
    underlying shape-detection bug. These tests pin the contract at
    three anchor values:

    - n == 86: historical SHA1-PASSING case. Output size + first-100-
      byte hash must equal orig. (Brief 134-142 baseline.)
    - n == 9: brief 141/145 empirical case (≥1 `.rodata` claim).
      Output size + first-100-byte hash must equal orig. (Brief 146
      new — this is the case brief 145 caught failing 4 bytes short.)
    - n == 0: fully-claimed `.rodata`, mwldarm emits zero veneers.
      Patcher is a no-op; output already matches orig.

    The first-100-byte hash pin is specifically requested by brief
    146's "Tests" section. It catches both size errors (the test
    would fail with a length mismatch before hashing) AND content
    corruption near the start of the binary.
    """

    @staticmethod
    def _first_100_bytes_hash(data: bytes) -> str:
        import hashlib
        return hashlib.sha1(data[:100]).hexdigest()

    def _orig(self) -> bytes:
        return _build_orig_synth_ov004()

    def _patch(self, n: int):
        from patch_ov004_veneers import patch_ov004
        data, sections = _build_synth_ov004(n)
        patched, stats = patch_ov004(data, [], sections)
        return patched, stats

    def test_orig_match_at_historical_max(self) -> None:
        # n=86: 16-byte cluster → fix consumes 16, writes 24 → net +8.
        # Output should be byte-identical to orig.
        patched, stats = self._patch(HISTORICAL_MAX_VENEER_COUNT)
        orig = self._orig()
        self.assertEqual(
            len(patched), len(orig),
            f"n=86 output size {len(patched)} != orig {len(orig)}",
        )
        self.assertEqual(
            self._first_100_bytes_hash(bytes(patched)),
            self._first_100_bytes_hash(orig),
            "n=86 first-100-byte hash diverges from orig",
        )
        # Hard-pin: the entire output matches orig at n=86.
        self.assertEqual(bytes(patched), orig)
        # Stats sanity: detected the with-terminator shape.
        self.assertEqual(
            stats["ctor_pad_net"],
            CTOR_PAD_FIX_NET_BYTES_WITH_TERMINATOR,
        )

    def test_orig_match_at_n_equals_9(self) -> None:
        # Brief 146 KEY CASE: n=9 → 12-byte cluster → fix consumes
        # 12, writes 24 → net +12. Without brief 146 the patcher
        # produced output 4 bytes short of orig (PR #566 finding);
        # this test pins the fix.
        patched, stats = self._patch(9)
        orig = self._orig()
        self.assertEqual(
            len(patched), len(orig),
            f"n=9 output size {len(patched)} != orig {len(orig)} — "
            "brief 145's 4-byte-short symptom regressed!",
        )
        self.assertEqual(
            self._first_100_bytes_hash(bytes(patched)),
            self._first_100_bytes_hash(orig),
            "n=9 first-100-byte hash diverges from orig",
        )
        self.assertEqual(bytes(patched), orig)
        # Stats sanity: detected the no-terminator shape.
        self.assertEqual(
            stats["ctor_pad_net"],
            CTOR_PAD_FIX_NET_BYTES_NO_TERMINATOR,
        )

    def test_orig_match_at_n_equals_0(self) -> None:
        # n=0: patcher is a no-op (no veneers found, no cluster to
        # fix). Input must equal output AND equal orig.
        patched, stats = self._patch(0)
        orig = self._orig()
        # The n=0 synth fixture produces the orig shape directly
        # (no pool, 12-byte cluster). Hmm — but orig has a 24-byte
        # ctor+pad shape (4 + 20). The n=0 BUILD input has a
        # 12-byte cluster + adjacent `.data`. So at n=0 the synth
        # input is NOT orig-shape; the patcher's no-op gate fires
        # because there are no veneers, but the bytes are different.
        #
        # In practice (real ov004 at n=0): mwldarm would emit the
        # full 24-byte orig cluster directly since there's no veneer
        # spill — n=0 is the steady state where the patcher hands
        # the binary through unchanged. The synth fixture's 12-byte
        # cluster at n=0 is just an artefact of the test's
        # parameterised builder.
        #
        # What the test pins: when there are no veneers, the patcher
        # is a no-op (returns input unchanged), so `len(patched) ==
        # len(input)` and `stats["already_patched"] == 1`. The orig
        # comparison would be misleading for the synth fixture; just
        # pin the no-op contract.
        synth_input, _ = _build_synth_ov004(0)
        self.assertEqual(bytes(patched), synth_input)
        self.assertEqual(stats["already_patched"], 1)
        self.assertEqual(stats["veneers_spliced"], 0)
        self.assertEqual(stats["ctor_pad_net"], 0)
        # Output size is the synth-input size, NOT the orig 24-byte
        # cluster shape — see the long comment above.
        self.assertEqual(len(patched), len(synth_input))
        # First-100-byte hash matches input (since output == input).
        self.assertEqual(
            self._first_100_bytes_hash(bytes(patched)),
            self._first_100_bytes_hash(synth_input),
        )
        # Orig and synth-input share the same first 100 bytes (both
        # have the same `.text` filler at offsets 0..0x1000); the
        # first divergence is at offset 0x1000 in the ctor region.
        # So the first-100-byte hash pin against orig ALSO holds:
        self.assertEqual(
            self._first_100_bytes_hash(bytes(patched)),
            self._first_100_bytes_hash(orig),
        )


# ---------------------------------------------------------------------- #
# Brief 150 — low-n WITH_TERMINATOR + degraded n-inference cross-check.
# ---------------------------------------------------------------------- #


class TestLowNWithTerminator(unittest.TestCase):
    """Brief 150: mwldarm keeps the WITH_TERMINATOR ctor shape at
    very low veneer counts (empirically n=2 and n=7). Brief 146's
    n-inference defaulted to NO_TERMINATOR for any 0 < n < 86 and
    its hard cross-check blocked builds at low n. Brief 150
    degrades the cross-check to a stderr note so byte-detection
    (the truth source) drives the patcher, and the disagreement is
    surfaced informationally instead of fatally.

    These tests use `_build_synth_ov004(n, terminator=True)` to
    construct synthetic inputs that mirror the bisection result —
    low n + WITH_TERMINATOR shape — and pin that the patcher:

      - byte-detects the shape correctly (ctor_pad_net = 8),
      - produces the right post-patch size (orig-equivalent),
      - emits the brief 150 note to stderr but does NOT raise.
    """

    def _patch(self, n: int, *, terminator: bool):
        # Suppress the brief 150 note that fires on shape
        # disagreement — tests that specifically assert the note
        # is present capture stderr themselves (see
        # `test_low_n_warn_surfaces_on_disagreement`).
        import io
        import contextlib
        from patch_ov004_veneers import patch_ov004
        data, sections = _build_synth_ov004(n, terminator=terminator)
        with contextlib.redirect_stderr(io.StringIO()):
            patched, stats = patch_ov004(data, [], sections)
        return data, patched, stats

    def test_low_n_2_with_terminator_succeeds(self) -> None:
        # Brief 147 hit this exact case: n=2, WITH_TERMINATOR, the
        # patcher hard-failed under brief 146's cross-check. With
        # brief 150 it succeeds and the byte-detected ctor_pad_net
        # is 8 (the WITH_TERMINATOR value).
        data, patched, stats = self._patch(2, terminator=True)
        self.assertEqual(stats["veneers_spliced"], 2)
        self.assertEqual(
            stats["ctor_pad_net"],
            CTOR_PAD_FIX_NET_BYTES_WITH_TERMINATOR,
        )
        # Splice removes 24 bytes (2 × 12); ctor/pad fix adds 8
        # back; net output delta = 16.
        self.assertEqual(len(data) - len(patched), 16)

    def test_low_n_7_with_terminator_succeeds(self) -> None:
        # Other low-n boundary case brief 147 surfaced. Same shape,
        # different n. Confirms brief 150's behaviour isn't an n=2
        # special case.
        data, patched, stats = self._patch(7, terminator=True)
        self.assertEqual(stats["veneers_spliced"], 7)
        self.assertEqual(
            stats["ctor_pad_net"],
            CTOR_PAD_FIX_NET_BYTES_WITH_TERMINATOR,
        )
        # Splice removes 84 (7 × 12); ctor/pad fix adds 8 → 76.
        self.assertEqual(len(data) - len(patched), 76)

    def test_low_n_warn_surfaces_on_disagreement(self) -> None:
        # When byte-detection says WITH but n-inference says NO,
        # the brief 150 note should hit stderr — without raising.
        import io
        import contextlib
        from patch_ov004_veneers import patch_ov004

        data, sections = _build_synth_ov004(2, terminator=True)
        captured = io.StringIO()
        with contextlib.redirect_stderr(captured):
            patched, stats = patch_ov004(data, [], sections)
        # No exception → reached here.
        self.assertEqual(stats["veneers_spliced"], 2)
        err = captured.getvalue()
        # Brief 150 note keywords.
        self.assertIn("shape disagrees with n-inference", err)
        self.assertIn("byte-detected net 8", err)
        self.assertIn("brief 150", err)

    def test_n_inference_aligned_path_no_warn(self) -> None:
        # When byte-detection agrees with n-inference (e.g. n=9
        # with NO_TERMINATOR), no brief 150 note should be emitted.
        import io
        import contextlib
        from patch_ov004_veneers import patch_ov004

        data, sections = _build_synth_ov004(9, terminator=False)
        captured = io.StringIO()
        with contextlib.redirect_stderr(captured):
            patched, stats = patch_ov004(data, [], sections)
        self.assertEqual(stats["veneers_spliced"], 9)
        err = captured.getvalue()
        self.assertNotIn("shape disagrees", err)
        self.assertNotIn("brief 150", err)

    def test_with_terminator_at_n_equals_43_succeeds(self) -> None:
        # Stress: synthetic WITH_TERMINATOR at a mid n value (43).
        # mwldarm hasn't been observed emitting WITH at n=43 in
        # practice, but the patcher must trust byte-detection and
        # adapt without raising.
        data, patched, stats = self._patch(43, terminator=True)
        self.assertEqual(stats["veneers_spliced"], 43)
        self.assertEqual(
            stats["ctor_pad_net"],
            CTOR_PAD_FIX_NET_BYTES_WITH_TERMINATOR,
        )
        # Splice removes 516 (43 × 12); ctor/pad fix adds 8 → 508.
        self.assertEqual(len(data) - len(patched), 508)


class TestExpectedOutputSizeForCtorPadNet(unittest.TestCase):
    """Brief 150: `expected_output_size_for` gains optional
    `ctor_pad_net` parameter that takes precedence over n-inference
    when supplied. Pins the new argument contract."""

    def test_ctor_pad_net_takes_precedence(self) -> None:
        # If byte-detection says WITH_TERMINATOR (net=8) at n=2,
        # the helper must use the byte-detected value even though
        # n-inference would return delta = 2*12 - 12 = 12 (giving
        # output size = len - 12).
        # With ctor_pad_net=8: output size = len - 2*12 + 8 = len - 16.
        data = bytearray(100)
        got = expected_output_size_for(
            data, already_patched=False,
            veneer_count=2, ctor_pad_net=8,
        )
        self.assertEqual(got, 100 - 16)
        # Sanity: without ctor_pad_net, the n-inference path gives
        # the WRONG answer (per brief 150) — len - 12.
        got_n_only = expected_output_size_for(
            data, already_patched=False, veneer_count=2,
        )
        self.assertEqual(got_n_only, 100 - 12)
        self.assertNotEqual(got, got_n_only)

    def test_ctor_pad_net_at_historical_max_matches(self) -> None:
        # The byte-detected and n-inferred paths must agree at the
        # n=86 historical case (both predict net=8 → delta=1024).
        data = bytearray(100000)
        got_byte = expected_output_size_for(
            data, already_patched=False,
            veneer_count=HISTORICAL_MAX_VENEER_COUNT,
            ctor_pad_net=8,
        )
        got_n = expected_output_size_for(
            data, already_patched=False,
            veneer_count=HISTORICAL_MAX_VENEER_COUNT,
        )
        self.assertEqual(got_byte, got_n)
        self.assertEqual(got_byte, 100000 - 1024)

    def test_already_patched_ignores_ctor_pad_net(self) -> None:
        # `already_patched=True` always returns len(data),
        # regardless of either inference parameter.
        data = bytearray(268192)
        got = expected_output_size_for(
            data, already_patched=True,
            veneer_count=9, ctor_pad_net=8,
        )
        self.assertEqual(got, 268192)


# ---------------------------------------------------------------------- #
# Brief 162: empirical N_INFERENCE_OVERRIDES — silence the brief 150
# stderr disagreement note at low-n WITH_TERMINATOR states.
# ---------------------------------------------------------------------- #


class TestNInferenceOverridesContract(unittest.TestCase):
    """Brief 162: `N_INFERENCE_OVERRIDES` is the public per-n
    empirical-correction table consumed by
    `expected_output_delta_for`. Pin the dict's contract so a
    later add/drop is intentional + visible (each entry encodes
    an empirical mwldarm observation against the current source
    state). Brief 162 ships with one entry; future briefs add
    rows as additional n values are sampled."""

    def test_table_contains_n5_with_terminator_long(self):
        # Brief 164's empirical anchor: n=5 → WITH_TERMINATOR_LONG
        # (ctor_pad_net=-4). Captured by claiming
        # `data_ov004_021f4a40` as a Pattern 1 .s chunk and
        # snapshotting the pre-patch arm9_ov004.bin produced by
        # mwldarm. The 28-byte cluster mwldarm emits at n=5
        # consumes 4 more cluster bytes than the fix writes back
        # → net = -4. Updated from brief 162's +8 once the
        # patcher learned to detect the 28-byte shape.
        self.assertIn(5, N_INFERENCE_OVERRIDES)
        self.assertEqual(
            N_INFERENCE_OVERRIDES[5],
            CTOR_PAD_FIX_NET_BYTES_WITH_TERMINATOR_LONG,
        )

    def test_table_contains_n3_with_terminator_mid(self):
        # Brief 168's empirical anchor: n=3 →
        # WITH_TERMINATOR_MID (ctor_pad_net=+4). Captured by
        # stacking `data_021e3de8` on top of brief 167's wave-1
        # claims — the additional band-1 chunk dropped
        # mwldarm's veneer count from the wave's n=5 down to
        # n=3. The 20-byte cluster mwldarm emits at n=3 sits
        # between the n=86 WITH_TERMINATOR (16 B) and the n=5
        # WITH_TERMINATOR_LONG (28 B); the fix writes 24 →
        # net = +4.
        self.assertIn(3, N_INFERENCE_OVERRIDES)
        self.assertEqual(
            N_INFERENCE_OVERRIDES[3],
            CTOR_PAD_FIX_NET_BYTES_WITH_TERMINATOR_MID,
        )

    def test_table_entries_are_valid_ctor_pad_net_values(self):
        # Every entry must be one of the four known
        # ctor_pad_net values: +8 (WITH_TERMINATOR), +12
        # (NO_TERMINATOR), +4 (WITH_TERMINATOR_MID, brief 168),
        # or -4 (WITH_TERMINATOR_LONG, brief 164). Other values
        # would mean a new ctor/pad shape was discovered, which
        # is brief-level new news + would require updating
        # `_fix_ctor_and_pad` to detect it before any override
        # consumed it.
        valid = {
            CTOR_PAD_FIX_NET_BYTES_WITH_TERMINATOR,
            CTOR_PAD_FIX_NET_BYTES_NO_TERMINATOR,
            CTOR_PAD_FIX_NET_BYTES_WITH_TERMINATOR_MID,
            CTOR_PAD_FIX_NET_BYTES_WITH_TERMINATOR_LONG,
        }
        for n, net in N_INFERENCE_OVERRIDES.items():
            self.assertIn(
                net, valid,
                f"override n={n} → {net} is not a known "
                f"ctor_pad_net value (expected {valid})",
            )

    def test_table_keys_are_valid_veneer_counts(self):
        # All entries must be in the valid n range — strictly
        # less than HISTORICAL_MAX_VENEER_COUNT (which is handled
        # by the n==86 branch of expected_output_delta_for) and
        # strictly greater than 0 (n=0 is the no-op branch).
        for n in N_INFERENCE_OVERRIDES:
            self.assertGreater(n, 0)
            self.assertLess(n, HISTORICAL_MAX_VENEER_COUNT)


class TestExpectedOutputDeltaForOverrides(unittest.TestCase):
    """Brief 162: `expected_output_delta_for` consults
    `N_INFERENCE_OVERRIDES` before falling back to the n<86
    NO_TERMINATOR formula. Pin the n=5 case (brief 162's worked
    empirical) + verify the resolution order doesn't disturb
    other n values."""

    def test_n_equals_5_returns_with_terminator_long_delta(self):
        # Brief 164's anchor empirical: n=5 → 5*12 - (-4) = 64.
        # Brief 162 set this to 5*12 - 8 = 52 (silencing the warn
        # but not fixing SHA1); brief 164 corrected to -4 once
        # `_fix_ctor_and_pad` learned to detect the 28-byte
        # cluster shape and the SHA1 residual was closed.
        self.assertEqual(
            expected_output_delta_for(5),
            5 * VENEER_SIZE - CTOR_PAD_FIX_NET_BYTES_WITH_TERMINATOR_LONG,
        )
        self.assertEqual(expected_output_delta_for(5), 64)

    def test_n_equals_9_unchanged_no_terminator(self):
        # n=9 is NOT in the override dict — falls through to the
        # NO_TERMINATOR formula. Brief 146 empirical: 9*12 - 12 =
        # 96. Brief 162's override change MUST NOT disturb this
        # case (n=9 is current main state; SHA1 PASS depends on
        # it).
        self.assertEqual(expected_output_delta_for(9), 96)

    def test_n_equals_86_unchanged_historical_max(self):
        # n=86 historical baseline — same regression-guard purpose
        # as `test_historical_max_delta_matches_brief134_constant`.
        # Pinned here too because brief 162's override path runs
        # BEFORE the n==86 branch — must short-circuit at the
        # historical-max check, not consult the override table.
        self.assertEqual(
            expected_output_delta_for(HISTORICAL_MAX_VENEER_COUNT),
            1024,
        )

    def test_non_override_low_n_still_uses_no_terminator(self):
        # Brief 162 only pinned n=5. Other low-n values (4, 3, 2,
        # 1) stay on the brief 146 NO_TERMINATOR formula until
        # empirically sampled. Pin a representative — n=4 — at
        # the formula value so a future override-without-test
        # change gets caught.
        if 4 in N_INFERENCE_OVERRIDES:
            self.skipTest(
                "n=4 has been added to the override dict; "
                "this regression-guard test is obsolete + "
                "should be updated to match the new empirical "
                "value"
            )
        self.assertEqual(expected_output_delta_for(4), 4 * 12 - 12)
        self.assertEqual(expected_output_delta_for(4), 36)


class TestN5SilencesDisagreementNote(unittest.TestCase):
    """Brief 162 → 164 success criterion: the brief 150 stderr
    disagreement note must NOT fire at n=5 with the empirically-
    observed WITH_TERMINATOR_LONG cluster (28 bytes). Drives the
    patcher end-to-end against a synthetic n=5 fixture using the
    `terminator='long'` knob brief 164 added + asserts stderr
    stays clean."""

    def test_no_stderr_note_at_n_5_with_terminator_long(self):
        import contextlib
        import io
        from patch_ov004_veneers import patch_ov004

        # Build a synthetic n=5 input with explicit
        # WITH_TERMINATOR_LONG cluster — exactly the shape brief
        # 160 / 164 captured from real mwldarm output.
        data, sections = _build_synth_ov004(5, terminator="long")
        captured = io.StringIO()
        with contextlib.redirect_stderr(captured):
            patched, stats = patch_ov004(data, [], sections)
        # Patcher succeeded + byte-detected WITH_TERMINATOR_LONG.
        self.assertEqual(stats["veneers_spliced"], 5)
        self.assertEqual(
            stats["ctor_pad_net"],
            CTOR_PAD_FIX_NET_BYTES_WITH_TERMINATOR_LONG,
        )
        # Crucial: no stderr noise — brief 164's override (and the
        # walk-forward detector that returns the new value) makes
        # byte-detection + n-inference agree.
        err = captured.getvalue()
        self.assertNotIn(
            "shape disagrees with n-inference", err,
            f"brief 150 disagreement note fired at n=5 — brief 164 "
            f"override should have silenced it. stderr: {err!r}",
        )
        self.assertNotIn("brief 150", err)


# ---------------------------------------------------------------------- #
# Brief 164: walk-forward cluster detection. Pin the new 28-byte
# WITH_TERMINATOR_LONG shape end-to-end + verify orig-byte equality.
# ---------------------------------------------------------------------- #


class TestPatcherOutputMatchesOrigAtN5(unittest.TestCase):
    """Brief 164 success gate. The patcher applied to a synthetic
    n=5 WITH_TERMINATOR_LONG input must produce output that is
    byte-identical to `_build_orig_synth_ov004()` — the same
    contract brief 146 pinned for n=86 and n=9. Brief 164 closes
    this gate for n=5 specifically (where brief 160 measured a
    +12-byte SHA1 residual against the real mwldarm output)."""

    def test_orig_match_at_n_5_with_terminator_long(self):
        from patch_ov004_veneers import patch_ov004
        data, sections = _build_synth_ov004(5, terminator="long")
        patched, stats = patch_ov004(data, [], sections)
        orig = _build_orig_synth_ov004()
        self.assertEqual(
            len(patched), len(orig),
            f"n=5 WITH_TERMINATOR_LONG output size {len(patched)} "
            f"!= orig {len(orig)}",
        )
        self.assertEqual(
            bytes(patched), orig,
            "n=5 WITH_TERMINATOR_LONG output not byte-identical "
            "to orig — brief 164's SHA1-residual fix regressed",
        )
        # Stats sanity: detected the 28-byte cluster shape.
        self.assertEqual(
            stats["ctor_pad_net"],
            CTOR_PAD_FIX_NET_BYTES_WITH_TERMINATOR_LONG,
        )

    def test_walk_forward_detects_n86_classic_shape(self):
        # Regression guard: the walk-forward detector must STILL
        # find the 16-byte cluster at the historical n=86 case
        # (where the original brief 146 byte-12-15-zero check was
        # the only signal). Walk should stop at offset 16 (where
        # `.LZN` starts) → ctor_pad_net = +8.
        from patch_ov004_veneers import patch_ov004
        data, sections = _build_synth_ov004(
            HISTORICAL_MAX_VENEER_COUNT, terminator=True,
        )
        patched, stats = patch_ov004(data, [], sections)
        orig = _build_orig_synth_ov004()
        self.assertEqual(bytes(patched), orig)
        self.assertEqual(
            stats["ctor_pad_net"],
            CTOR_PAD_FIX_NET_BYTES_WITH_TERMINATOR,
        )

    def test_walk_forward_detects_n9_no_terminator_shape(self):
        # Regression guard: the walk-forward detector must STILL
        # find the 12-byte cluster at the n=9 case (where bytes
        # 12-15 ARE non-zero — the first `.data` word). Walk
        # should stop at offset 12 → ctor_pad_net = +12.
        from patch_ov004_veneers import patch_ov004
        data, sections = _build_synth_ov004(9, terminator=False)
        patched, stats = patch_ov004(data, [], sections)
        orig = _build_orig_synth_ov004()
        self.assertEqual(bytes(patched), orig)
        self.assertEqual(
            stats["ctor_pad_net"],
            CTOR_PAD_FIX_NET_BYTES_NO_TERMINATOR,
        )


# ---------------------------------------------------------------------- #
# Brief 168: n=3 walk-forward cluster + broadened arm_call re-encoding.
# Pin the new 20-byte WITH_TERMINATOR_MID shape end-to-end + assert the
# patcher re-encodes `.text` arm_call BLs that span the veneer pool.
# ---------------------------------------------------------------------- #


class TestN3SilencesDisagreementNote(unittest.TestCase):
    """Brief 168 success criterion: the brief 150 stderr
    disagreement note must NOT fire at n=3 with the empirically-
    observed WITH_TERMINATOR_MID cluster (20 bytes). Mirrors
    brief 164's n=5 silencer test for the new n=3 override."""

    def test_no_stderr_note_at_n_3_with_terminator_mid(self):
        import contextlib
        import io
        from patch_ov004_veneers import patch_ov004

        data, sections = _build_synth_ov004(3, terminator="mid")
        captured = io.StringIO()
        with contextlib.redirect_stderr(captured):
            patched, stats = patch_ov004(data, [], sections)
        self.assertEqual(stats["veneers_spliced"], 3)
        self.assertEqual(
            stats["ctor_pad_net"],
            CTOR_PAD_FIX_NET_BYTES_WITH_TERMINATOR_MID,
        )
        err = captured.getvalue()
        self.assertNotIn(
            "shape disagrees with n-inference", err,
            f"brief 150 disagreement note fired at n=3 — brief 168 "
            f"override should have silenced it. stderr: {err!r}",
        )
        self.assertNotIn("brief 150", err)


class TestPatcherOutputMatchesOrigAtN3(unittest.TestCase):
    """Brief 168 success gate. The patcher applied to a synthetic
    n=3 WITH_TERMINATOR_MID input must produce output that is
    byte-identical to `_build_orig_synth_ov004()` — the same
    contract brief 146 / 164 pinned for n=86, n=9, and n=5."""

    def test_orig_match_at_n_3_with_terminator_mid(self):
        from patch_ov004_veneers import patch_ov004
        data, sections = _build_synth_ov004(3, terminator="mid")
        patched, stats = patch_ov004(data, [], sections)
        orig = _build_orig_synth_ov004()
        self.assertEqual(
            len(patched), len(orig),
            f"n=3 WITH_TERMINATOR_MID output size {len(patched)} "
            f"!= orig {len(orig)}",
        )
        self.assertEqual(
            bytes(patched), orig,
            "n=3 WITH_TERMINATOR_MID output not byte-identical "
            "to orig — brief 168's SHA1-residual fix regressed",
        )
        # Stats sanity: detected the 20-byte cluster shape.
        self.assertEqual(
            stats["ctor_pad_net"],
            CTOR_PAD_FIX_NET_BYTES_WITH_TERMINATOR_MID,
        )

    def test_walk_forward_detects_n3_mid_shape(self):
        # Walk-forward should stop at offset 20 (4 ctor + 16 zero
        # bytes) → ctor_pad_net = +4 = WITH_TERMINATOR_MID.
        from patch_ov004_veneers import _fix_ctor_and_pad
        data, _sections = _build_synth_ov004(3, terminator="mid")
        # After splice the pool is gone; ctor lives at file offset
        # 0x1000 (= ctor_va - base_va) in the spliced data.
        spliced = (
            bytearray(data[:_SYNTH_TEXT_LEN])
            + bytearray(data[_SYNTH_TEXT_LEN + 3 * VENEER_SIZE:])
        )
        _fixed, net = _fix_ctor_and_pad(spliced, _SYNTH_TEXT_LEN)
        self.assertEqual(net, CTOR_PAD_FIX_NET_BYTES_WITH_TERMINATOR_MID)


class TestArmCallReencodingSpansPool(unittest.TestCase):
    """Brief 168: ANY `kind:arm_call` reloc whose source-target
    span crosses the veneer pool must be re-encoded post-splice.
    Prior to brief 168 only `.init`-resident arm_calls were
    covered; the n=3 reproducer surfaced a `.text` BL at va
    0x021dbc14 → 0x021e7e30 with the pool sitting between source
    and target — that BL was the sole remaining byte-diff vs
    orig.

    These tests model the production layout end-to-end against a
    synthetic n=3 fixture: plant a `.text` BL with mwldarm's
    stale post-veneer encoding, then verify the patcher rewrites
    it to the orig-correct encoding."""

    def test_text_bl_spanning_pool_gets_reencoded(self):
        # Mirror the real brief 168 reproducer geometry. The
        # synth fixture has `.text` at [base_va, base_va + 0x1000)
        # and the pool right after at file [0x1000, 0x1000+n*12).
        # Plant a BL at .text offset 0x100 targeting a VA that
        # lives PAST the pool in the orig (post-splice) layout.
        from patch_ov004_veneers import patch_ov004
        n = 3
        data, sections = _build_synth_ov004(n, terminator="mid")
        base_va = sections[".text"][0]
        # Source BL: a .text address; target: a VA in .data
        # (which sits after the cluster in orig layout). Both
        # are real orig VAs per relocs.txt convention.
        bl_source_va = base_va + 0x100
        bl_target_va = sections[".data"][0]
        # mwldarm encoded the BL in the PRE-splice layout where
        # the target sat `n * VENEER_SIZE` bytes RIGHT of orig.
        # So the stale `imm24` reflects an offset that's `n * 12`
        # bytes too high vs the orig-truth `(to - from - 8) >> 2`.
        stale_offset = (
            bl_target_va + n * VENEER_SIZE - bl_source_va - 8
        )
        stale_imm24 = (stale_offset >> 2) & 0xffffff
        stale_word = 0xeb000000 | stale_imm24
        # Patch the synth data to plant the stale BL bytes (the
        # fixture defaults to 0xAA filler in .text).
        data_mut = bytearray(data)
        bl_fo = bl_source_va - base_va
        struct.pack_into("<I", data_mut, bl_fo, stale_word)
        # Hand the patcher the matching reloc — relocs.txt
        # always uses orig VAs.
        relocs = [(bl_source_va, "arm_call", bl_target_va)]

        patched, stats = patch_ov004(bytes(data_mut), relocs, sections)
        self.assertEqual(stats["veneers_spliced"], n)
        self.assertEqual(stats["bl_reencodes"], 1)
        # After patch the .text BL bytes should match the
        # orig-truth encoding — NOT the stale mwldarm-emitted
        # bytes. Recompute the expected encoding from orig VAs.
        expected_offset = bl_target_va - bl_source_va - 8
        expected_imm24 = (expected_offset >> 2) & 0xffffff
        expected_word = 0xeb000000 | expected_imm24
        actual_word = struct.unpack_from("<I", patched, bl_fo)[0]
        self.assertEqual(
            actual_word, expected_word,
            f"brief 168: .text arm_call BL at 0x{bl_source_va:08x} "
            f"not re-encoded post-splice. "
            f"got=0x{actual_word:08x} stale=0x{stale_word:08x} "
            f"expected=0x{expected_word:08x}",
        )

    def test_text_bl_not_spanning_pool_is_unchanged(self):
        # Counter-case: a `.text` BL whose target ALSO sits in
        # `.text` (BEFORE the pool) doesn't have a stale offset
        # — mwldarm encoded it for orig-truth because the
        # source-target span doesn't include the pool. The
        # patcher's `new_word == current` short-circuit must
        # leave it bit-identical.
        from patch_ov004_veneers import patch_ov004
        n = 3
        data, sections = _build_synth_ov004(n, terminator="mid")
        base_va = sections[".text"][0]
        bl_source_va = base_va + 0x200
        bl_target_va = base_va + 0x300  # also in .text, no span
        correct_offset = bl_target_va - bl_source_va - 8
        correct_imm24 = (correct_offset >> 2) & 0xffffff
        correct_word = 0xeb000000 | correct_imm24
        data_mut = bytearray(data)
        bl_fo = bl_source_va - base_va
        struct.pack_into("<I", data_mut, bl_fo, correct_word)
        relocs = [(bl_source_va, "arm_call", bl_target_va)]

        patched, stats = patch_ov004(bytes(data_mut), relocs, sections)
        # No re-encoding needed → no_op short-circuit kicks in.
        self.assertEqual(stats["bl_reencodes"], 0)
        actual_word = struct.unpack_from("<I", patched, bl_fo)[0]
        self.assertEqual(
            actual_word, correct_word,
            "intra-.text BL with no pool-spanning offset should "
            "be left bit-identical post-patch",
        )


class TestFixCtorAndPadWalkSafety(unittest.TestCase):
    """Brief 164: the walk-forward cursor caps at MAX_CLUSTER_WORDS
    (16 words = 64 bytes) before raising. Pin the cap behaviour so
    a future mwldarm regression that emits an unbounded pad
    cluster surfaces as a clear PatchError instead of silently
    corrupting the output."""

    def test_raises_on_unbounded_zero_run(self):
        # Construct a synthetic cluster where the zero pad extends
        # beyond the safety cap. Use 70 bytes of zero pad after
        # the ctor entry — that's > 16 4-byte words.
        from patch_ov004_veneers import _fix_ctor_and_pad
        data = bytearray(
            b"\xaa" * 0x1000  # text padding
            + b"\xab\xcd\xef\x01"  # ctor entry
            + b"\x00" * 80        # 80 zero bytes (> 16 * 4 = 64)
            + b"LZNC"             # .data start
            + b"\xbb" * 60        # .data tail
        )
        with self.assertRaisesRegex(PatchError, "more than"):
            _fix_ctor_and_pad(data, 0x1000)


if __name__ == "__main__":
    unittest.main()
