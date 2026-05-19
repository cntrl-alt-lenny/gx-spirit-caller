/* Brief 155 — cluster B size=4 value=0 candidate, drained via brief
 * 152's `unsigned int[N]` bundle recipe.
 *
 * Bundle covers [0x020ffd3c..0x020ffd50) = 20 bytes.
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
 *   - 0x020ffd3c: from 0x02055f80
 *   - 0x020ffd40: from 0x02055fe8
 */

unsigned int data_020ffd3c[5] = {
    0x00000000,  /* "...." */
    0x61766e49,  /* "Inva" */
    0x2064696c,  /* "lid " */
    0x636e7566,  /* "func" */
    0x0000002e,  /* "...." */
};
