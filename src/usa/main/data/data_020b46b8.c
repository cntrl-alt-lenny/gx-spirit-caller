/* data_020b46b8 (174 bytes, 4-aligned): USA/JPN-only region override, as
 * part of cm-data-inference-12. EUR's own `src/main/data_020b46b8.c`
 * (40-byte opaque flag array) is unrelated content at the same address --
 * a genuine cross-region divergence found and documented in wave 9
 * (docs/research/data/cm-data-inference-9-2026-07-27.md), deferred there
 * because it required new USA/JPN-only source rather than a byte-
 * preserving retype.
 *
 * STRONG: sole consumer func_0200a180.s (region-specific, unmatched .s)
 * unconditionally reads all 174 bytes via a `mov r2,#0x2b`-bounded
 * (43 x 4-byte + 1 tail halfword = 87 halfwords) loop into a stack
 * buffer, then indexes the copy with a runtime-computed value (an
 * ASCII-range classifier result, `lsl #0x1` halfword stride) via
 * `ldrh`. Element count (87) is loop-bound-proven, not size-guessed.
 * USA and JPN are byte-identical (verified directly against
 * extract/{usa,jpn}/arm9/arm9.bin at file offset 0xb46b8) and share this
 * same consumer file unmodified.
 */

const unsigned short data_020b46b8[87] = {
    0, 1, 2, 3, 4, 5, 6, 0,
    8, 9, 0, 0, 10, 11, 12, 13,
    0, 14, 0, 15, 0, 0, 0, 0,
    0, 25, 0, 26, 27, 0, 0, 0,
    0, 0, 0, 0, 0, 32, 33, 0,
    0, 34, 0, 0, 0, 35, 0, 0,
    0, 0, 0, 0, 0, 0, 44, 0,
    0, 0, 0, 49, 16, 17, 18, 19,
    20, 21, 22, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0,
};
