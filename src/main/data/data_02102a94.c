/* Brief 181 — wave-2 single-int TU rewrite to absorb the two value=0
 * deferred candidates `data_02102a98` and `data_02102a9c` (cluster B
 * W6-rejected residue deferred from brief 155 PR #584).
 *
 * Bundle covers [0x02102a94..0x02102aa0) = 12 bytes. Originally a
 * 4-byte single-int TU (brief 143 wave 1) holding `0x6e616e` ("nan");
 * extended to absorb two adjacent 4-byte value=0 placeholders so they
 * land in .data instead of mwcc-routing to .bss.
 *
 * patch_module_literals.py resolves the absorbed-placeholder
 * kind:load relocs post-link on arm9.bin (per brief 152's worked-
 * example mechanism).
 *
 * Subsumed placeholders + their kind:load reloc origins:
 *   - 0x02102a98: from 0x020a956c
 *   - 0x02102a9c: from 0x020a9570
 */

unsigned int data_02102a94[3] = {
    0x006e616e,
    0x00000000,
    0x00000000,
};
