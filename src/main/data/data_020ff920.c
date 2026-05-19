/* Brief 155 — cluster B size=4 value=0 candidate, drained via brief
 * 152's `unsigned int[N]` bundle recipe.
 *
 * Bundle covers [0x020ff920..0x020ff960) = 64 bytes.
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
 *   - 0x020ff920: from 0x02047fac
 *   - 0x020ff924: from 0x020489f4
 *   - 0x020ff928: from 0x020492c8
 */

unsigned int data_020ff920[16] = {
    0x00000000,  /* "...." */
    0x00000000,  /* "...." */
    0x61682049,  /* "I ha" */
    0x61206576,  /* "ve a" */
    0x6f687475,  /* "utho" */
    0x657a6972,  /* "rize" */
    0x6f792064,  /* "d yo" */
    0x72207275,  /* "ur r" */
    0x65757165,  /* "eque" */
    0x74207473,  /* "st t" */
    0x6461206f,  /* "o ad" */
    0x656d2064,  /* "d me" */
    0x206f7420,  /* " to " */
    0x72756f79,  /* "your" */
    0x73696c20,  /* " lis" */
    0x00000074,  /* "t..." */
};
