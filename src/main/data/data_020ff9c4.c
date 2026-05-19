/* Brief 155 — cluster B size=4 value=0 candidate, drained via brief
 * 152's `unsigned int[N]` bundle recipe.
 *
 * Bundle covers [0x020ff9c4..0x020ff9cc) = 8 bytes.
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
 *   - 0x020ff9c4: from 0x0204c1dc, 0x0204ca68, 0x02050114, 0x02051380, 0x02051614
 *   - 0x020ff9c8: from 0x0204d278, 0x0204f8ec
 */

unsigned int data_020ff9c4[2] = {
    0x00000000,  /* "...." */
    0x00524556,  /* "VER." */
};
