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
    HISTORICAL_MAX_VENEER_COUNT,
    PatchError,
    VENEER_PREFIX,
    VENEER_SIZE,
    _apply_load_rewrites,
    _fix_ctor_and_pad,
    _reencode_init_bls,
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

    def test_replaces_16_bytes_with_24(self) -> None:
        # Fake: 100 bytes of prefix, 16 bytes of [ctor8 + pad8],
        # 100 bytes of suffix. After fix the 16 bytes become
        # [ctor4_kept + 20_zero_pad].
        prefix = b"P" * 100
        ctor_8 = b"\xab\xcd\xef\x01\xde\xad\xbe\xef"
        pad_8 = b"\x00" * 8
        suffix = b"S" * 100
        data = bytearray(prefix + ctor_8 + pad_8 + suffix)
        fixed = _fix_ctor_and_pad(data, len(prefix))
        # Layout: prefix + ctor[0:4] + 20 zero + suffix
        expected = prefix + ctor_8[:4] + b"\x00" * 20 + suffix
        self.assertEqual(bytes(fixed), expected)
        # Brief 142: the +8 net invariant is pinned in
        # CTOR_PAD_FIX_NET_BYTES.
        self.assertEqual(
            len(fixed) - len(data), CTOR_PAD_FIX_NET_BYTES,
        )


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


class TestReencodeInitBls(unittest.TestCase):
    """Verifies ARM BL re-encoding produces the correct 24-bit
    signed offset for the post-splice source VA."""

    def test_reencodes_bl_in_init(self) -> None:
        # Construct: .init at file 0x100 (base 0x021c9c60).
        # BL at .init+8 (source VA 0x021c9d68). Target 0x021d8640.
        # Expected offset: (0x021d8640 - 0x021c9d68 - 8) / 4
        #                = 0xe934 / 4 = 0x3a4d
        # Built has DIFFERENT (stale) encoding initially.
        base_va = 0x021c9c60
        init_start_va = 0x021c9d60
        init_end_va = 0x021c9d90
        from_va = 0x021c9d68
        to_va = 0x021d8640

        data = bytearray(0x200)
        fo = from_va - base_va  # 0x108
        # Plant a STALE BL word — top byte (cond+L) preserved,
        # bottom 24 wrong:
        struct.pack_into("<I", data, fo, 0xeb000000 | 0x123456)
        relocs = [(from_va, "arm_call", to_va)]

        n = _reencode_init_bls(
            data, relocs, base_va, init_start_va, init_end_va,
        )
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

    def test_skips_bls_outside_init(self) -> None:
        base_va = 0x021c9c60
        init_start_va = 0x021c9d60
        init_end_va = 0x021c9d90
        # BL OUTSIDE .init (in .text) — should not be re-encoded.
        from_va = 0x021c9c80  # before .init
        to_va = 0x02000000

        data = bytearray(0x200)
        fo = from_va - base_va
        original_word = 0xeb000000 | 0x123456
        struct.pack_into("<I", data, fo, original_word)
        relocs = [(from_va, "arm_call", to_va)]

        n = _reencode_init_bls(
            data, relocs, base_va, init_start_va, init_end_va,
        )
        self.assertEqual(n, 0)
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
    """Brief 142: the cascade math derives the output-size delta
    from the observed veneer count. Pin the formula at three
    anchor points + the n=0 / n=1 edges."""

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
        # n=1: splice 12 bytes, recover 8 → delta = 4.
        self.assertEqual(
            expected_output_delta_for(1),
            VENEER_SIZE - CTOR_PAD_FIX_NET_BYTES,
        )
        self.assertEqual(expected_output_delta_for(1), 4)

    def test_brief_141_nine_veneer_delta(self) -> None:
        # n=9: the empirical brief 141 state with 2 .rodata claims.
        # delta = 9 * 12 - 8 = 100.
        self.assertEqual(expected_output_delta_for(9), 100)

    def test_intermediate_count(self) -> None:
        # n=43 (synthetic mid-state): 43 * 12 - 8 = 508.
        self.assertEqual(expected_output_delta_for(43), 508)

    def test_historical_max_delta_matches_brief134_constant(
        self,
    ) -> None:
        # n=86 historical max: 86 * 12 - 8 = 1024.  This was the
        # brief 134 hard-coded EXPECTED_OUTPUT_DELTA value;
        # preserving it ensures the existing SHA1-PASSING baseline
        # is untouched for the no-rodata-claim source state.
        self.assertEqual(
            expected_output_delta_for(HISTORICAL_MAX_VENEER_COUNT),
            1024,
        )


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
        # Brief 142: passing `veneer_count` overrides the default.
        # Synthetic: a 200-byte input with n=9 veneers → delta=100
        # → expected output 100.
        data = bytearray(200)
        got = expected_output_size_for(
            data, already_patched=False, veneer_count=9,
        )
        self.assertEqual(got, 100)

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
_SYNTH_CTOR_PAYLOAD = (
    b"\xab\xcd\xef\x01"  # ctor entry 1 (4 bytes kept)
    b"\xde\xad\xbe\xef"  # WRITEW(0)-ish placeholder (truncated)
)
_SYNTH_PAD_8 = b"\x00" * 8


def _build_synth_ov004(n: int) -> tuple[bytes, dict[str, tuple[int, int]]]:
    """Build a synthetic ov004-shaped binary with `n` veneers + a
    realistic ctor/pad cluster + a small `.data` tail. Returns
    (data, sections-map).

    Built-file layout (what mwldarm emits):
        [0..0x1000)              .text payload (0xAA filler)
        [0x1000..0x1000+n*12)    veneer pool
        [pool_end..pool_end+16)  ctor8 + pad8
        [ctor_end..ctor_end+64)  .data tail (0xBB filler)

    Sections (ORIG VAs, what delinks.txt provides):
        .text   [BASE_VA, BASE_VA + 0x1000)
        .init   [BASE_VA + 0x1000, BASE_VA + 0x1000)  (empty)
        .ctor   [BASE_VA + 0x1000, BASE_VA + 0x1004)  (4-byte orig)
        .data   [BASE_VA + 0x1000 + 24, ...)  (after 20-byte pad)

    The orig VAs make `ctor_file_offset = ctor_va - base_va = 0x1000`,
    which is correct: after splice removes the pool, ctor lives at
    file offset 0x1000 in the spliced data.
    """
    text = b"\xaa" * _SYNTH_TEXT_LEN
    targets = [0x02000000 + i * 4 for i in range(n)]
    pool = _veneer_pool(targets) if n > 0 else b""
    ctor_pad = _SYNTH_CTOR_PAYLOAD + _SYNTH_PAD_8
    data_tail = b"\xbb" * _SYNTH_DATA_TAIL_LEN
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
        # n=9 (brief 141 empirical state with 2 `.rodata` claims):
        # splice removes 9*12 = 108 bytes; ctor/pad fix adds 8 back;
        # net delta = 100.
        data, patched, stats = self._patch(9)
        self.assertEqual(stats["already_patched"], 0)
        self.assertEqual(stats["veneers_spliced"], 9)
        self.assertEqual(stats["ctor_pad_fixed"], 1)
        self.assertEqual(
            len(data) - len(patched), expected_output_delta_for(9),
        )
        self.assertEqual(len(data) - len(patched), 100)

    def test_intermediate_count(self) -> None:
        # n=43 (synthetic mid-state): exercises a delta value the
        # brief 134 patcher couldn't handle.
        data, patched, stats = self._patch(43)
        self.assertEqual(stats["veneers_spliced"], 43)
        self.assertEqual(
            len(data) - len(patched), expected_output_delta_for(43),
        )
        self.assertEqual(len(data) - len(patched), 508)

    def test_historical_max_baseline(self) -> None:
        # n=86 (historical baseline): the brief 134 behaviour
        # MUST be preserved bit-for-bit, since brief 140's
        # SHA1-PASSING ROM relies on it.
        data, patched, stats = self._patch(
            HISTORICAL_MAX_VENEER_COUNT,
        )
        self.assertEqual(
            stats["veneers_spliced"], HISTORICAL_MAX_VENEER_COUNT,
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


if __name__ == "__main__":
    unittest.main()
