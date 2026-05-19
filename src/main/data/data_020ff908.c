/* Brief 155 — cluster B size=4 value=0 candidate, drained via brief
 * 152's `unsigned int[N]` bundle recipe.
 *
 * Bundle covers [0x020ff908..0x020ff914) = 12 bytes.
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
 *   - 0x020ff908: from 0x02046084, 0x02046c5c, 0x02046e7c
 *   - 0x020ff90c: from 0x020461f0
 */

unsigned int data_020ff908[3] = {
    0x00000000,  /* "...." */
    0x4d435047,  /* "GPCM" */
    0x00000000,  /* "...." */
};
