/* Brief 155 — cluster B size=4 value=0 candidate, drained via brief
 * 152's `unsigned int[N]` bundle recipe.
 *
 * Bundle covers [0x02100b70..0x02100b84) = 20 bytes.
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
 *   - 0x02100b70: from 0x0205c338
 *   - 0x02100b74: from 0x0205c33c
 */

unsigned int data_02100b70[5] = {
    0x00000000,  /* "...." */
    0x6e656c5c,  /* "\len" */
    0x5c64255c,  /* "\%d\" */
    0x5c67736d,  /* "msg\" */
    0x0000000a,  /* "...." */
};
