/* Brief 155 — cluster B size=4 value=0 candidate, drained via brief
 * 152's `unsigned int[N]` bundle recipe.
 *
 * Bundle covers [0x021021ec..0x02102200) = 20 bytes.
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
 *   - 0x021021ec: from 0x02082f54
 *   - 0x021021f0: from 0x020843dc
 */

unsigned int data_021021ec[5] = {
    0x00000000,  /* "...." */
    0x020843e0,  /* ".C.." */
    0x00000000,  /* "...." */
    0x00000000,  /* "...." */
    0x00000000,  /* "...." */
};
