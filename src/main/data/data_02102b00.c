/* Brief 155 — cluster B size=4 value=0 candidate, drained via brief
 * 152's `unsigned int[N]` bundle recipe.
 *
 * Bundle covers [0x02102b00..0x02102b48) = 72 bytes.
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
 *   - 0x02102b00: from 0x020aed5c
 *   - 0x02102b04: from 0x020aed60
 *   - 0x02102b08: from 0x020b17a0
 */

unsigned int data_02102b00[18] = {
    0x00000000,  /* "...." */
    0x00000000,  /* "...." */
    0x00000000,  /* "...." */
    0x40240000,  /* "..$@" */
    0x00000000,  /* "...." */
    0x40590000,  /* "..Y@" */
    0x00000000,  /* "...." */
    0x408f4000,  /* ".@.@" */
    0x00000000,  /* "...." */
    0x40c38800,  /* "...@" */
    0x00000000,  /* "...." */
    0x40f86a00,  /* ".j.@" */
    0x00000000,  /* "...." */
    0x412e8480,  /* "...A" */
    0x00000000,  /* "...." */
    0x416312d0,  /* "..cA" */
    0x00000000,  /* "...." */
    0x4197d784,  /* "...A" */
};
