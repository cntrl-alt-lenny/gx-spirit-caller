/* data_020fb840 (32 bytes, main .data, cm-restock-carve-7): opaque 8-word array,
 * real ROM bytes verified via extract/eur/arm9/arm9.bin + cross-checked
 * against config/eur/arm9/relocs.txt for every relocated word (3/8
 * words are relocations to other main addresses, annotated per-word below).
 * Reader: func_ov006_021c6a58.c: func_020211c8(data_020fb840) -- opaque resource-
 * loader pointer arg.
 */

unsigned int data_020fb840[8] = {
    0xf1000000,
    0x020fb860,  /* -> data_020fb860 */
    0x00000003,
    0x020fb8bc,  /* -> data_020fb8bc */
    0x00000003,
    0x020fb92c,  /* -> data_020fb92c */
    0x00000003,
    0xf0000000,
};
