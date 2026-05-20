/* Brief 155 — cluster B size=4 value=0 candidate, drained via brief
 * 152's `unsigned int[N]` bundle recipe.
 *
 * data_020c6a9c (4 zero bytes, padding before next .data string) and
 * its non-placeholder neighbour data_020c6aa0 (the 20-byte string
 * "card/CARD_5bg26.bin\0") are bundled into a single 24-byte
 * `unsigned int[6]` TU. The non-zero string content forces mwcc to
 * emit the section into `.data` (not `.bss`).
 *
 * patch_module_literals.py resolves the absorbed-placeholder
 * `kind:load` reloc at addr 0x020c6aa0 post-link on arm9.bin (per
 * brief 152's worked-example mechanism).
 *
 * Subsumed placeholders + their kind:load reloc origins:
 *   - 0x020c6a9c: from 0x0202b808, 0x0202b82c, 0x0202b850, 0x0202b874
 *   - 0x020c6aa0: from 0x0202bef4
 */

unsigned int data_020c6a9c[6] = {
    0x00000000,
    0x64726163,  /* "card" */
    0x5241432f,  /* "/CAR" */
    0x62355f44,  /* "D_5b" */
    0x2e363267,  /* "g26." */
    0x006e6962,  /* "bin\0" */
};
