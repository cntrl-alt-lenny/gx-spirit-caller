/* data_ov010_021b8908 (32 bytes, 4-aligned): retyped from opaque bytes to
 * an unsigned short[16] array as part of cm-data-inference-6.
 *
 * 12 of its 16 halfwords are individually fixed-offset ldrh-read by 2
 * walled .s consumers -- indices 4-7 (offsets +0x8/+0xa/+0xc/+0xe) by
 * func_ov010_021b72c0.s:158-166, indices 8-15 (offsets +0x10.. +0x1e) by
 * func_ov010_021b799c.s:219-229,194-203. Indices 0-3 are unevidenced but
 * typed for consistency with the rest of the array.
 *
 * The same func_ov010_021b799c.s consumer also reads offsets +0x2c
 * through +0x36 via this symbol's own base pointer (`_LIT7`) -- 4 bytes
 * past this array's own 32-byte end, directly into sibling
 * data_ov010_021b8928's tail (see that file). This is pure raw
 * pointer-arithmetic address overlap and requires no boundary change
 * here: kept as 2 SEPARATE files (not 1 merged TU) since the 32-byte
 * boundary is 4-byte-aligned, so the non-4-byte-TU-split-linker-gap
 * rule (docs/research/data-carve-tu-alignment.md) does not apply. A
 * same-TU merge was tried first and reverted: mwcc's `-O4,p` reordered
 * the two globals within the section (by size or alignment, not source
 * declaration order), swapping their addresses and breaking SHA1 --
 * confirmed via `dsd rom extract` + byte diff against the baserom.
 * Separate files avoid the ordering question entirely.
 */

const unsigned short data_ov010_021b8908[16] = {
    0x0000, 0x0001, 0x0008, 0x000e, 0x000c, 0x0024, 0x00dc, 0x00bb,
    0x0000, 0x0001, 0x001c, 0x0002, 0x0007, 0x0024, 0x00e0, 0x00bb,
};
