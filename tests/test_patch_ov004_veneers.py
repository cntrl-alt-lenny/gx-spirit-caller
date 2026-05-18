"""Unit tests for tools/patch_ov004_veneers.py (brief 134
Phase 3 — final mwldarm-overlay-swap-blindness mitigation).

The patcher splices spurious thumb→arm interwork veneers out of
ov004's flat binary and un-shifts the +0x400 cascade. A
regression here silently breaks the 27/27 baseline EUR achieves
(or the 26/27 in USA / JPN) because dsd check modules would
re-FAIL ov004.

Pinned behaviour:

- Veneer pool detection (auto-find by 12-byte pattern)
- Splice removes exactly 1032 bytes
- ctor/pad fix replaces 16 bytes with 24 bytes (-4 ctor +20 pad)
- `kind:load` reloc rewrites
- `kind:arm_call` BL re-encode in .init range
- Section-map parsing from delinks.txt
- overlays.yaml `code_size + ctor_start + ctor_end` rewrite
- Idempotence (re-run on patched binary is a no-op)
- Cross-region (EUR / USA / JPN) base-VA portability
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
    EXPECTED_OUTPUT_DELTA,
    EXPECTED_VENEER_COUNT,
    EXPECTED_VENEER_POOL_SIZE,
    PatchError,
    VENEER_PREFIX,
    VENEER_SIZE,
    _apply_load_rewrites,
    _fix_ctor_and_pad,
    _reencode_init_bls,
    _scan_veneer_pool,
    _splice_veneer_pool,
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
    """The pool scanner finds the contiguous 86-veneer pool
    anywhere in the binary, regardless of region-specific
    offsets (EUR's pool is at 0x3fcfc; USA / JPN at 0x3fb7c)."""

    def test_finds_pool_at_arbitrary_offset(self) -> None:
        # Pad before the pool, then 86 veneers, then more padding.
        targets = [0x02000000 + i * 4 for i in range(EXPECTED_VENEER_COUNT)]
        pool = _veneer_pool(targets)
        prefix = b"\xff" * 0x1000
        suffix = b"\xee" * 0x100
        data = prefix + pool + suffix
        pool_start, veneers = _scan_veneer_pool(data)
        self.assertEqual(pool_start, len(prefix))
        self.assertEqual(len(veneers), EXPECTED_VENEER_COUNT)
        for i, (off, tgt) in enumerate(veneers):
            self.assertEqual(off, len(prefix) + i * VENEER_SIZE)
            self.assertEqual(tgt, targets[i])

    def test_wrong_count_raises(self) -> None:
        # Only 85 veneers — should fail loudly.
        targets = [0x02000000] * 85
        data = _veneer_pool(targets)
        with self.assertRaisesRegex(PatchError, "expected 86 veneers"):
            _scan_veneer_pool(data)

    def test_non_contiguous_raises(self) -> None:
        # 86 veneers, but a gap in the middle breaks contiguity.
        targets = [0x02000000] * EXPECTED_VENEER_COUNT
        pool = _veneer_pool(targets)
        # Split at veneer 40 and inject 4 bytes between.
        split = 40 * VENEER_SIZE
        data = pool[:split] + b"\xff\xff\xff\xff" + pool[split:]
        with self.assertRaisesRegex(PatchError, "not contiguous"):
            _scan_veneer_pool(data)


class TestSpliceVeneerPool(unittest.TestCase):

    def test_splice_removes_pool(self) -> None:
        before = b"BEFORE..."
        targets = [0x10 * i for i in range(EXPECTED_VENEER_COUNT)]
        pool = _veneer_pool(targets)
        after = b"AFTER!!!"
        data = bytearray(before + pool + after)
        spliced = _splice_veneer_pool(data, len(before))
        self.assertEqual(bytes(spliced), before + after)
        self.assertEqual(
            len(data) - len(spliced), EXPECTED_VENEER_POOL_SIZE,
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
        self.assertEqual(len(fixed) - len(data), 8)


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


class TestExpectedOutputSizeFor(unittest.TestCase):
    """Regression test for the brief 140 part 1 off-by-1024 bug.

    Before fix: `expected_output_size = len(data) - DELTA` was
    computed UNCONDITIONALLY in main(), so on the YAML-only
    second invocation (where `data` is already post-splice
    268192 EUR) it derived 267168 — 1024 too small. The 267168
    hit `arm9_overlays.yaml`'s `code_size`, then `dsd rom build`
    aligned it to 0x413a0 and wrote that 512-bytes-short value
    into the ROM overlay table at file offset 0x8b30a.

    After fix: the computation branches on `already_patched`
    via `expected_output_size_for()`."""

    def test_pre_patched_input_subtracts_delta(self) -> None:
        # Pre-patch ov004 (EUR): 269216 bytes → post-patch 268192.
        pre_patch_size = 269216
        data = bytearray(pre_patch_size)
        got = expected_output_size_for(data, already_patched=False)
        self.assertEqual(got, pre_patch_size - EXPECTED_OUTPUT_DELTA)
        self.assertEqual(got, 268192)

    def test_already_patched_input_uses_len_directly(self) -> None:
        # Already-patched ov004 (EUR): 268192 bytes. With the bug,
        # this would derive 267168. The fix returns 268192.
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


if __name__ == "__main__":
    unittest.main()
