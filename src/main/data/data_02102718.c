/* data_02102718 (76 bytes, main .data, cm-restock-carve-7): opaque 19-word array,
 * real ROM bytes verified via extract/eur/arm9/arm9.bin + cross-checked
 * against config/eur/arm9/relocs.txt for every relocated word (5/19
 * words are relocations to other main addresses, annotated per-word below).
 * Reader: func_020a6ce0.s (opaque .word literal load)
 */

unsigned int data_02102718[19] = {
    0x00000000,
    0x00000124,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x021aa360,  /* -> 0x021aa360 (uncarved/unnamed) */
    0x00000100,
    0x021aa360,  /* -> 0x021aa360 (uncarved/unnamed) */
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x020b41f8,  /* -> func_020b41f8 */
    0x020b4248,  /* -> func_020b4248 */
    0x020b427c,  /* -> func_020b427c */
    0x00000000,
};
