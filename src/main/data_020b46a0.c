/* data_020b46a0 -- 12-entry u16 lookup table (24 bytes), evidenced
 * prefix split from the original 64-byte opaque tail carved out of
 * data_020b4680 (cm-data-020b4680-carve).
 *
 * Sole consumer func_0200a250.s (USA/JPN ports; EUR's homolog reads a
 * different, address-shifted table due to localization-driven data
 * growth, so this file itself has no EUR-side consumer, but the raw
 * bytes are region-shared) -- a hard 6-iteration copy loop (24 bytes)
 * structurally proves exactly 12 elements, and a computed-stride
 * `base+idx*2` (ldrh) access, with 9 independent call sites across both
 * ports exercising every index 0-11, confirms both stride and full
 * coverage. Remaining 40 bytes carved off as their own opaque symbol,
 * data_020b46b8 -- no consumer evidence covers them (this wave's own
 * method: never force a type onto insufficient evidence). See
 * docs/queue/claude-scaffolder.md (cm-data-inference-5).
 */

const unsigned short data_020b46a0[12] = {
    0x0000, 0x0000, 0x0000, 0x0100, 0x0000, 0x0001, 0x0000, 0x0101, 0x0100, 0x0000, 0x0100, 0x0100,
};
