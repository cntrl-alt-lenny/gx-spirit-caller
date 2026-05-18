"""Unit tests for tools/patch_rom_header_crc.py (brief 140 part 2).

The patcher fills the secure-area CRC (0x6C, copied from orig)
and header CRC (0x15E, computed) in an NDS ROM, closing the
4-byte residue brief 137 attributed to the ROM header. Pinned
behaviour:

- NDS standard CRC16 algorithm (poly 0xA001 reversed, init
  0xFFFF, LSB-first). Golden value: `nds_crc16(logo bytes)
  == 0xCF56` across all licensed NDS ROMs.
- `patch_header_crcs` writes both fields and is idempotent.
- Header CRC computation INCLUDES the just-written secure-
  area CRC (so 0x6C must be written first).
- Missing / short input raises ValueError.
- CLI end-to-end on a synthetic header.
"""

from __future__ import annotations

import struct
import sys
import tempfile
import unittest
from pathlib import Path

_TOOLS = Path(__file__).resolve().parent.parent / "tools"
sys.path.insert(0, str(_TOOLS))

from patch_rom_header_crc import (  # noqa: E402
    EXPECTED_LOGO_CRC,
    HEADER_CRC_OFFSET,
    HEADER_RANGE_END,
    HEADER_RANGE_START,
    LOGO_CRC_OFFSET,
    LOGO_RANGE_END,
    LOGO_RANGE_START,
    MIN_ROM_SIZE,
    SECURE_AREA_CRC_OFFSET,
    main,
    nds_crc16,
    patch_header_crcs,
)


# Bundled extract of the Nintendo logo bytes (header[0xC0..0x15C])
# — fixed across every licensed NDS ROM. Derived from the orig
# EUR baserom at scoping time. Pinning this here as a known
# input lets the CRC golden test run without requiring the orig
# baserom file at test time.
NINTENDO_LOGO_BYTES = bytes.fromhex(
    "24ffae51699aa221"
    "3d84820a84e409ad"
    "11248b98c0817f21"
    "a352be199309ce20"
    "10464a4af82731ec"
    "58c7e83382e3cebf"
    "85f4df94ce4b09c1"
    "94568ac01372a7fc"
    "9f844d73a3ca9a61"
    "5897a327fc039876"
    "231dc7610304ae56"
    "bf38840040a70efd"
    "ff52fe036f9530f1"
    "97fbc08560d68025"
    "a963be03014e38e2"
    "f9a234ffbb3e0344"
    "780090cb88113a94"
    "65c07c6387f03caf"
    "d625e48b380aac72"
    "21d4f807"
)


class TestNdsCrc16(unittest.TestCase):
    """The CRC16 implementation is correct iff it produces the
    well-known logo CRC `0xCF56` for the standard Nintendo logo
    bytes. That's the algorithm's golden-value test."""

    def test_logo_golden_value(self) -> None:
        # Sanity-check the bundled bytes are the right length.
        self.assertEqual(
            len(NINTENDO_LOGO_BYTES),
            LOGO_RANGE_END - LOGO_RANGE_START,
            "bundled logo bytes must be 156 bytes (matching "
            "header[0xC0..0x15C])",
        )
        crc = nds_crc16(NINTENDO_LOGO_BYTES)
        self.assertEqual(
            crc, EXPECTED_LOGO_CRC,
            f"CRC16 of Nintendo logo must be 0x{EXPECTED_LOGO_CRC:04x} "
            f"(got 0x{crc:04x}). Algorithm regression.",
        )

    def test_empty_input(self) -> None:
        # Empty input → init value unchanged.
        self.assertEqual(nds_crc16(b""), 0xFFFF)

    def test_single_zero_byte(self) -> None:
        # Reference: CRC16-MODBUS of `\x00` = 0x40BF.
        self.assertEqual(nds_crc16(b"\x00"), 0x40BF)

    def test_returns_16_bit_value(self) -> None:
        # Whatever the input, output must fit in [0, 0xFFFF].
        for sz in (1, 7, 64, 256, 4096):
            crc = nds_crc16(b"\x55" * sz)
            self.assertGreaterEqual(crc, 0)
            self.assertLessEqual(crc, 0xFFFF)

    def test_deterministic(self) -> None:
        # Same input → same output.
        data = b"\x12\x34\x56\x78" * 100
        a = nds_crc16(data)
        b = nds_crc16(data)
        self.assertEqual(a, b)


# ---------------------------------------------------------------------- #
# Synthetic-ROM helpers
# ---------------------------------------------------------------------- #

def _build_synthetic_rom(
    *,
    secure_crc: int = 0x1234,
    header_crc: int = 0x5678,
    pad_byte: int = 0x00,
) -> bytearray:
    """Construct a 0x4000-byte synthetic NDS header with the
    given CRC field values planted in the right slots. All other
    header bytes are `pad_byte` (default zero)."""
    rom = bytearray([pad_byte] * MIN_ROM_SIZE)
    # Plant the logo bytes at 0xC0..0x15C so the header CRC
    # computation has realistic input.
    rom[LOGO_RANGE_START:LOGO_RANGE_END] = NINTENDO_LOGO_BYTES
    # dsd actually writes the logo CRC at 0x15C; mirror that.
    struct.pack_into("<H", rom, LOGO_CRC_OFFSET, EXPECTED_LOGO_CRC)
    struct.pack_into("<H", rom, SECURE_AREA_CRC_OFFSET, secure_crc)
    struct.pack_into("<H", rom, HEADER_CRC_OFFSET, header_crc)
    return rom


class TestPatchHeaderCrcs(unittest.TestCase):

    def test_copies_secure_crc_from_orig(self) -> None:
        # Built has wrong secure CRC (0x0000), orig has 0x6FF7.
        built = _build_synthetic_rom(secure_crc=0x0000)
        orig = _build_synthetic_rom(secure_crc=0x6FF7)
        secure_changed, _ = patch_header_crcs(built, bytes(orig))
        self.assertTrue(secure_changed)
        self.assertEqual(
            struct.unpack_from("<H", built, SECURE_AREA_CRC_OFFSET)[0],
            0x6FF7,
        )

    def test_computes_header_crc_post_secure_patch(self) -> None:
        # The header CRC must be computed over header[0..0x15E]
        # AFTER the secure-area CRC at 0x6C has been written, so
        # the computed value reflects the canonical input.
        built = _build_synthetic_rom(
            secure_crc=0x0000, header_crc=0xDEAD,
        )
        orig = _build_synthetic_rom(secure_crc=0x6FF7)
        _, header_changed = patch_header_crcs(built, bytes(orig))
        self.assertTrue(header_changed)

        # Independently re-compute and check.
        struct.pack_into(
            "<H", built, SECURE_AREA_CRC_OFFSET, 0x0000,
        )  # reset so we can re-verify without using patcher
        struct.pack_into(
            "<H", built, SECURE_AREA_CRC_OFFSET, 0x6FF7,
        )
        expected = nds_crc16(bytes(built[0:HEADER_RANGE_END]))
        self.assertEqual(
            struct.unpack_from("<H", built, HEADER_CRC_OFFSET)[0],
            expected,
        )

    def test_idempotent(self) -> None:
        # First pass: both fields change.
        built = _build_synthetic_rom(
            secure_crc=0x0000, header_crc=0xDEAD,
        )
        orig = _build_synthetic_rom(secure_crc=0x6FF7)
        sec1, hdr1 = patch_header_crcs(built, bytes(orig))
        self.assertTrue(sec1)
        self.assertTrue(hdr1)

        # Second pass on the now-correct buffer: no changes.
        sec2, hdr2 = patch_header_crcs(built, bytes(orig))
        self.assertFalse(sec2)
        self.assertFalse(hdr2)

    def test_raises_on_short_rom(self) -> None:
        short = bytearray(0x100)
        orig = _build_synthetic_rom()
        with self.assertRaisesRegex(ValueError, "ROM too short"):
            patch_header_crcs(short, bytes(orig))

    def test_raises_on_short_orig(self) -> None:
        built = _build_synthetic_rom()
        with self.assertRaisesRegex(ValueError, "orig too short"):
            patch_header_crcs(built, bytes(bytearray(0x100)))


class TestMainCLI(unittest.TestCase):

    def test_end_to_end(self) -> None:
        with tempfile.TemporaryDirectory() as d:
            rom_path = Path(d) / "built.nds"
            orig_path = Path(d) / "orig.nds"
            built = _build_synthetic_rom(
                secure_crc=0x0000, header_crc=0xDEAD,
            )
            orig = _build_synthetic_rom(secure_crc=0x6FF7)
            rom_path.write_bytes(bytes(built))
            orig_path.write_bytes(bytes(orig))

            rc = main([
                "--rom", str(rom_path),
                "--orig", str(orig_path),
            ])
            self.assertEqual(rc, 0)

            patched = rom_path.read_bytes()
            self.assertEqual(
                struct.unpack_from("<H", patched, SECURE_AREA_CRC_OFFSET)[0],
                0x6FF7,
            )
            # header CRC should be the canonical one
            expected_hdr = nds_crc16(
                bytes(patched[0:HEADER_RANGE_END])
            )
            self.assertEqual(
                struct.unpack_from("<H", patched, HEADER_CRC_OFFSET)[0],
                expected_hdr,
            )

    def test_idempotent_via_cli(self) -> None:
        with tempfile.TemporaryDirectory() as d:
            rom_path = Path(d) / "built.nds"
            orig_path = Path(d) / "orig.nds"
            built = _build_synthetic_rom(
                secure_crc=0x0000, header_crc=0xDEAD,
            )
            orig = _build_synthetic_rom(secure_crc=0x6FF7)
            rom_path.write_bytes(bytes(built))
            orig_path.write_bytes(bytes(orig))

            # First call: writes both fields.
            main(["--rom", str(rom_path), "--orig", str(orig_path)])
            mtime1 = rom_path.stat().st_mtime

            import time
            time.sleep(0.01)

            # Second call: already correct → no rewrite → mtime
            # preserved (so ninja's restat keeps caches warm).
            main(["--rom", str(rom_path), "--orig", str(orig_path)])
            mtime2 = rom_path.stat().st_mtime
            self.assertEqual(
                mtime1, mtime2,
                "idempotent re-run must NOT touch the ROM file",
            )


if __name__ == "__main__":
    unittest.main()
