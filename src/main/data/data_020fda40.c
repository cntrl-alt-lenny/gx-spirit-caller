/* data_020fda40 (32 bytes, main .data, cm-restock-carve-7): opaque 8-word array,
 * real ROM bytes verified via extract/eur/arm9/arm9.bin + cross-checked
 * against config/eur/arm9/relocs.txt for every relocated word (3/8
 * words are relocations to other main addresses, annotated per-word below).
 * Reader: func_ov006_021c6d8c.c: func_020211c8(data_020fda40) -- opaque resource-
 * loader pointer arg.
 */

unsigned int data_020fda40[8] = {
    0xf1000000,
    0x020fda60,  /* -> data_020fda60 */
    0x00000003,
    0x020fdacc,  /* -> data_020fdacc */
    0x00000003,
    0x020fdb48,  /* -> data_020fdb48 */
    0x00000003,
    0xf0000000,
};
