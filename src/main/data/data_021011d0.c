/* Brief 155 — cluster B size=4 value=0 candidate, drained via brief
 * 152's `unsigned int[N]` bundle recipe.
 *
 * Bundle covers [0x021011d0..0x021011ec) = 28 bytes.
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
 *   - 0x021011d0: from 0x0205feb4
 *   - 0x021011d4: from 0x0205feb8
 */

unsigned int data_021011d0[7] = {
    0x00000000,  /* "...." */
    0x7265765c,  /* "\ver" */
    0x6e6f6973,  /* "sion" */
    0x5c64255c,  /* "\%d\" */
    0x75736572,  /* "resu" */
    0x255c746c,  /* "lt\%" */
    0x00000064,  /* "d..." */
};
