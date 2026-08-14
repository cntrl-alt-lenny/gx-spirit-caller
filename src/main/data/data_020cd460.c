/* data_020cd460 (40 bytes, main .data, cm-restock-carve-7): opaque 10-word array,
 * real ROM bytes verified via extract/eur/arm9/arm9.bin + cross-checked
 * against config/eur/arm9/relocs.txt for every relocated word (4/10
 * words are relocations to other main addresses, annotated per-word below).
 * Reader: func_ov002_022b9da4.s (ov002, opaque .word literal load)
 */

unsigned int data_020cd460[10] = {
    0xf1000000,
    0x020cd488,  /* -> data_020cd488 */
    0x00000003,
    0x020cd56c,  /* -> data_020cd56c */
    0x00000003,
    0x020cd704,  /* -> data_020cd704 */
    0x00000003,
    0x020cd958,  /* -> data_020cd958 */
    0x00000003,
    0xf0000000,
};
