/* Brief 155 — cluster B size=4 value=0 candidate, drained via brief
 * 152's `unsigned int[N]` bundle recipe.
 *
 * Bundle covers [0x02101554..0x02101578) = 36 bytes.
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
 *   - 0x02101554: from 0x02064df8
 *   - 0x02101558: from 0x02064f74
 */

unsigned int data_02101554[9] = {
    0x00000000,  /* "...." */
    0x206e656c,  /* "len " */
    0x5447203c,  /* "< GT" */
    0x535f3249,  /* "I2_S" */
    0x4b434154,  /* "TACK" */
    0x534f485f,  /* "_HOS" */
    0x4e454c54,  /* "TLEN" */
    0x58414d5f,  /* "_MAX" */
    0x00000000,  /* "...." */
};
