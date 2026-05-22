/* Brief 181 — wave-2 single-int TU rewrite to absorb the value=0
 * deferred candidate `data_02102104` (cluster B W6-rejected residue,
 * JPN region; parallel of brief 155's main residue handled for EUR).
 *
 * Bundle covers [0x02102100..0x02102108) = 8 bytes. Originally a
 * 4-byte single-int TU (brief 170 cross-region) holding `0x2a`;
 * extended to absorb the adjacent 4-byte value=0 placeholder so it
 * lands in .data instead of mwcc-routing to .bss.
 *
 * patch_module_literals.py resolves the absorbed-placeholder
 * kind:load reloc post-link on arm9.bin (per brief 152's worked-
 * example mechanism).
 */

unsigned int data_02102100[2] = {
    0x0000002a,
    0x00000000,
};
