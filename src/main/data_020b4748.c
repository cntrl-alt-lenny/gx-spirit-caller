/* Brief 119 cluster C worked example — 16-element const u16 array (32 bytes).
 *
 * Address 0x020b4748, size exactly 32 bytes (16 × u16). Size is naturally
 * 4-byte aligned, so mwldarm's .rodata-section-size rounding doesn't add
 * any padding. This worked-example shape (.rodata symbol whose size IS
 * a multiple of 4) is the SAFE PATH for cluster C carving.
 *
 * Bytes (little-endian u16):
 *   0x0000, 0x0010, 0x0010, 0x0200, 0x4200, 0x4000, 0x4010, 0x4210,
 *   0x0000, 0x699f, 0x03ff, 0x03e0, 0x7fe0, 0x7c00, 0x7c1f, 0x7fff
 */

const unsigned short data_020b4748[16] = {
    0x0000, 0x0010, 0x0010, 0x0200, 0x4200, 0x4000, 0x4010, 0x4210,
    0x0000, 0x699f, 0x03ff, 0x03e0, 0x7fe0, 0x7c00, 0x7c1f, 0x7fff,
};
