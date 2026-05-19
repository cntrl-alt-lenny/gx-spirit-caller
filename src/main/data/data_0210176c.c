/* Brief 155 — cluster B size=4 value=0 candidate, drained via brief
 * 152's `unsigned int[N]` bundle recipe.
 *
 * Bundle covers [0x0210176c..0x02101778) = 12 bytes.
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
 *   - 0x0210176c: from 0x020669bc, 0x02066d40
 *   - 0x02101770: from 0x020669c0
 */

unsigned int data_0210176c[3] = {
    0x00000000,  /* "...." */
    0x64257325,  /* "%s%d" */
    0x00000000,  /* "...." */
};
