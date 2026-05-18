#!/usr/bin/env python3

"""
patch_rom_header_crc.py — write the secure-area CRC + header
CRC16 fields in an NDS ROM header (brief 140 part 2).

Context (brief 137 / brief 140)
-------------------------------

Brief 137's SHA1-gap scoping found that `dsd rom build` leaves
two CRC16 fields in the ROM header unset (zero / stale),
producing **4 bytes of diff** vs orig in every region. Brief
140 part 2 ships the patcher that fills both fields and closes
the final ROM-header residue → `ninja sha1` PASSES.

The two fields
--------------

| Offset  | Field                  | Size | Source         |
|---------|------------------------|-----:|----------------|
| `0x6C`  | Secure Area CRC16      | 2    | copy from orig |
| `0x15E` | Header CRC16           | 2    | computed       |

(GBATEK reference: NDS Cartridge Header. The brief originally
named 0x6C "Nintendo Logo CRC16" but per GBATEK 0x6C is the
**Secure Area CRC16**; the logo CRC lives at 0x15C and dsd
already writes it correctly — empirically `0xCF56` matches
orig across all 3 regions before this patcher runs.)

Why secure-area CRC is COPIED, not computed
-------------------------------------------

GBATEK: "The CRC is calculated on the **post-decrypted**
Secure Area." Our baseroms ship the secure area in encrypted
form (starts with `ff de ff e7…`, not the decrypted
`encryObj…` marker), and computing the orig CRC from scratch
would require implementing the Nintendo Blowfish-NDS cipher.

But: our built ROM has byte-identical secure-area bytes to
orig (verified — 0 diffs across `[0x4000..0x8000)`), so the
post-decryption CRC must be identical too. Copying the
2-byte value from the orig baserom is therefore equivalent
to computing it — and saves us 500+ lines of Blowfish code.
The orig baserom is already a build dependency
(`configure.py` SHA-1 verifies it).

NDS CRC16 algorithm (standard, per GBATEK + ndstool)
----------------------------------------------------

- Polynomial `x^16 + x^15 + x^2 + 1` (= `0xA001` reverse-bit)
- Init `0xFFFF`
- Byte-at-a-time, LSB-first:

      crc = 0xFFFF
      for b in data:
          crc ^= b
          for _ in range(8):
              if crc & 1:
                  crc = (crc >> 1) ^ 0xA001
              else:
                  crc >>= 1

Golden-value test: the Nintendo logo bytes
(`header[0xC0..0x15C]`, 156 bytes) are fixed across every
licensed NDS ROM and their CRC under this algorithm is
**`0xCF56`** — pinned in `tests/test_patch_rom_header_crc.py`.

Wiring
------

Modeled on brief 138's `cleanup_macos_junk` integration:
standalone `rom_header_crc` ninja rule that runs as a
post-`rom_build` step. Output is the (in-place patched) ROM
itself; `restat=True` means `ninja sha1`'s SHA-1 check only
re-runs when the patched bytes actually changed.

Usage
-----

    python tools/patch_rom_header_crc.py \\
        --rom gx-spirit-caller_eur.nds \\
        --orig orig/baserom_eur.nds

Idempotent — already-correct ROMs are left untouched (no mtime
change) so ninja's downstream cache stays warm.
"""

from __future__ import annotations

import argparse
import struct
import sys
from pathlib import Path


# NDS header CRC field offsets (within the 0x4000-byte header).
# Per GBATEK "DS Cartridge Header":
SECURE_AREA_CRC_OFFSET = 0x6C      # 2 bytes; CRC over decrypted
                                    # secure area
LOGO_CRC_OFFSET = 0x15C            # 2 bytes; CRC over the
                                    # Nintendo logo (0xC0..0x15C)
HEADER_CRC_OFFSET = 0x15E          # 2 bytes; CRC over
                                    # header[0..0x15E]

# Range of bytes the logo CRC is computed over (not patched
# here; dsd already writes it correctly. Kept as a constant
# for the golden-value test.)
LOGO_RANGE_START = 0xC0
LOGO_RANGE_END = 0x15C             # exclusive; 156 bytes

# Range of bytes the header CRC is computed over (this
# INCLUDES the secure-area CRC field at 0x6C, so we MUST
# write 0x6C first, then compute the header CRC).
HEADER_RANGE_START = 0x00
HEADER_RANGE_END = 0x15E           # exclusive; 350 bytes

MIN_ROM_SIZE = 0x4000              # NDS header

# Known-good Nintendo logo CRC. Fixed across every licensed
# NDS ROM because the logo image is immutable. Used as
# golden-value test in tests/test_patch_rom_header_crc.py.
EXPECTED_LOGO_CRC = 0xCF56


def nds_crc16(data: bytes) -> int:
    """Compute the NDS-standard CRC16 over `data`.

    Polynomial `x^16 + x^15 + x^2 + 1` (reversed = 0xA001),
    init 0xFFFF, byte-at-a-time LSB-first. Returns a 16-bit
    integer in [0, 0xFFFF]."""
    crc = 0xFFFF
    for b in data:
        crc ^= b
        for _ in range(8):
            if crc & 1:
                crc = (crc >> 1) ^ 0xA001
            else:
                crc >>= 1
    return crc & 0xFFFF


def patch_header_crcs(
    data: bytearray,
    orig_data: bytes,
) -> tuple[bool, bool]:
    """Fill the secure-area CRC + header CRC fields in `data`.

    1. Copy `orig_data[0x6C:0x6E]` into `data[0x6C:0x6E]`
       (secure-area CRC; can't be computed without Blowfish
       decryption, and our built secure area is byte-identical
       to orig anyway).
    2. Compute the header CRC16 over `data[0:0x15E]` (which now
       has the canonical secure-area CRC at 0x6C) and write to
       `data[0x15E:0x160]`.

    Returns `(secure_changed, header_changed)` — True for each
    field whose value actually changed. Idempotent: re-running
    on already-correct bytes returns `(False, False)`.

    Raises `ValueError` if either buffer is shorter than
    `MIN_ROM_SIZE`."""
    if len(data) < MIN_ROM_SIZE:
        raise ValueError(
            f"ROM too short: {len(data)} bytes < required "
            f"{MIN_ROM_SIZE} (header)"
        )
    if len(orig_data) < MIN_ROM_SIZE:
        raise ValueError(
            f"orig too short: {len(orig_data)} bytes < required "
            f"{MIN_ROM_SIZE} (header)"
        )

    # 1. Secure-area CRC — copy from orig (the only reliable
    #    source without implementing the Blowfish cipher).
    orig_secure_crc = struct.unpack_from(
        "<H", orig_data, SECURE_AREA_CRC_OFFSET,
    )[0]
    current_secure_crc = struct.unpack_from(
        "<H", data, SECURE_AREA_CRC_OFFSET,
    )[0]
    secure_changed = current_secure_crc != orig_secure_crc
    if secure_changed:
        struct.pack_into(
            "<H", data, SECURE_AREA_CRC_OFFSET, orig_secure_crc,
        )

    # 2. Header CRC over header[0..0x15E] (now includes the
    #    just-written secure-area CRC).
    header_crc = nds_crc16(
        bytes(data[HEADER_RANGE_START:HEADER_RANGE_END])
    )
    current_header_crc = struct.unpack_from(
        "<H", data, HEADER_CRC_OFFSET,
    )[0]
    header_changed = current_header_crc != header_crc
    if header_changed:
        struct.pack_into(
            "<H", data, HEADER_CRC_OFFSET, header_crc,
        )

    return (secure_changed, header_changed)


def main(argv: list[str] | None = None) -> int:
    ap = argparse.ArgumentParser(
        description=(
            "Patch the two NDS ROM header CRC16 fields (secure-"
            "area CRC at 0x6C, header CRC at 0x15E) in-place. "
            "Idempotent — already-correct ROMs are left "
            "untouched (no mtime change). See brief 140 / "
            "brief 137."
        ),
    )
    ap.add_argument(
        "--rom", type=Path, required=True,
        help="Path to the built NDS ROM (e.g. "
             "gx-spirit-caller_eur.nds).",
    )
    ap.add_argument(
        "--orig", type=Path, required=True,
        help="Path to the orig baserom (e.g. "
             "orig/baserom_eur.nds). Used to source the "
             "post-decryption secure-area CRC, which can't be "
             "computed without the NDS Blowfish cipher.",
    )
    args = ap.parse_args(argv)

    try:
        data = bytearray(args.rom.read_bytes())
    except OSError as e:
        print(f"error: read {args.rom}: {e}", file=sys.stderr)
        return 1
    try:
        orig_data = args.orig.read_bytes()
    except OSError as e:
        print(f"error: read {args.orig}: {e}", file=sys.stderr)
        return 1

    try:
        secure_changed, header_changed = patch_header_crcs(
            data, orig_data,
        )
    except ValueError as e:
        print(f"error: {args.rom}: {e}", file=sys.stderr)
        return 1

    if not (secure_changed or header_changed):
        # Silent no-op — keeps ninja rebuilds quiet.
        return 0

    try:
        args.rom.write_bytes(bytes(data))
    except OSError as e:
        print(f"error: write {args.rom}: {e}", file=sys.stderr)
        return 1

    msg_bits = []
    if secure_changed:
        msg_bits.append(
            f"secure-area CRC at 0x{SECURE_AREA_CRC_OFFSET:x}"
        )
    if header_changed:
        msg_bits.append(
            f"header CRC at 0x{HEADER_CRC_OFFSET:x}"
        )
    print(
        f"patched {args.rom}: wrote {' + '.join(msg_bits)}",
        file=sys.stderr,
    )
    return 0


if __name__ == "__main__":
    sys.exit(main())
