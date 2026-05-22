/* Brief 181 — wave-2 single-int TU rewrite to absorb the two value=0
 * deferred candidates `data_021029b8` and `data_021029bc` (cluster B
 * W6-rejected residue, JPN region; parallel of brief 155's main
 * residue handled for EUR).
 *
 * Bundle covers [0x021029b4..0x021029c0) = 12 bytes. Originally a
 * 4-byte single-int TU (brief 170 cross-region) holding `0x6e616e`
 * ("nan"); extended to absorb two adjacent 4-byte value=0
 * placeholders so they land in .data instead of mwcc-routing to
 * .bss.
 *
 * patch_module_literals.py resolves the absorbed-placeholder
 * kind:load relocs post-link on arm9.bin (per brief 152's worked-
 * example mechanism).
 *
 * Subsumed placeholders + their kind:load reloc origins:
 *   - 0x021029b8: from 0x020a9478
 *   - 0x021029bc: from 0x020a947c
 */

unsigned int data_021029b4[3] = {
    0x006e616e,
    0x00000000,
    0x00000000,
};
