/* Brief 155 — cluster B size=4 value=0 candidate, drained via brief
 * 152's `unsigned int[N]` bundle recipe.
 *
 * Bundle covers [0x021013d8..0x021013e4) = 12 bytes.
 * The leading 4 zero bytes (value=0 W6-rejected candidate) and the
 * non-zero neighbour content are claimed together so the .data
 * section contains non-zero bytes — forcing mwcc to emit into
 * .data instead of the default .bss for all-zero TUs.
 *
 * patch_module_literals.py resolves the absorbed-placeholder
 * kind:load relocs post-link on arm9.bin (per brief 152's
 * worked-example mechanism).
 *
 * Subsumed placeholders + their kind:load reloc origins:
 *   - 0x021013d8: from 0x02060a38, 0x02060cb8
 *   - 0x021013dc: from 0x02060ac8
 */

unsigned int data_021013d8[3] = {
    0x00000000,  /* "...." */
    0x70746567,  /* "getp" */
    0x00726469,  /* "idr." */
};
