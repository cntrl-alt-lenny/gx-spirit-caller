/* data_020b4680 — 16-entry nibble-spread lookup table (32 bytes).
 *
 * Split from the original 96-byte opaque blob (cm-data-020b4680-carve):
 * both consumers (func_02002c3c.s, func_02002ffc.s) mask their index to
 * `& 0xf` before an `lsl #1` u16-stride load -- a hardware-enforced
 * [0,15] bound, not an inference -- so only the first 32 bytes are ever
 * reachable. table[n] spreads the 4 bits of n into 4 nibble lanes
 * (e.g. table[5] = table[0b0101] = 0x0101, table[11] = table[0b1011] =
 * 0x1101). The remaining 64 bytes have zero consumer evidence and are
 * carved separately as data_020b46a0 (still opaque). See
 * docs/research/data/cm-data-inference-3-2026-07-25.md and
 * docs/research/cm-data-020b4680-carve-2026-07-25.md.
 */

const unsigned short data_020b4680[16] = {
    0x0000, 0x1000, 0x0100, 0x1100, 0x0010, 0x1010, 0x0110, 0x1110,
    0x0001, 0x1001, 0x0101, 0x1101, 0x0011, 0x1011, 0x0111, 0x1111,
};
