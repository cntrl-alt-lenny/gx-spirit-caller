/* Brief 155 — cluster B size=4 value=0 candidate, drained via brief
 * 152's `unsigned int[N]` bundle recipe.
 *
 * Bundle covers [0x02101df8..0x02101e18) = 32 bytes.
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
 *   - 0x02101df8: from 0x0206adf8, 0x0206b0c0, 0x0206b448, 0x0206b8f8, 0x0206b968
 *   - 0x02101dfc: from 0x0206b1f0
 */

unsigned int data_02101df8[8] = {
    0x00000000,  /* "...." */
    0x6d2e7325,  /* "%s.m" */
    0x2e642573,  /* "s%d." */
    0x6e2e7367,  /* "gs.n" */
    0x65746e69,  /* "inte" */
    0x776f646e,  /* "ndow" */
    0x2e696669,  /* "ifi." */
    0x0074656e,  /* "net." */
};
