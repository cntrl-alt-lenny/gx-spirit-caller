/* data_020f8a40 (32 bytes, main .data, cm-restock-carve-7): opaque 8-word array,
 * real ROM bytes verified via extract/eur/arm9/arm9.bin + cross-checked
 * against config/eur/arm9/relocs.txt for every relocated word (3/8
 * words are relocations to other main addresses, annotated per-word below).
 * Reader: func_ov009_021ab7b4.c: func_020211c8(data_020f8a40) -- opaque resource-
 * loader pointer arg.
 */

unsigned int data_020f8a40[8] = {
    0xf1000000,
    0x020f8a60,  /* -> data_020f8a60 */
    0x00000003,
    0x020f8aa4,  /* -> data_020f8aa4 */
    0x00000003,
    0x020f8ae4,  /* -> data_020f8ae4 */
    0x00000003,
    0xf0000000,
};
