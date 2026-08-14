/* data_020f87d8 (24 bytes, main .data, cm-restock-carve-7): opaque 6-word array,
 * real ROM bytes verified via extract/eur/arm9/arm9.bin + cross-checked
 * against config/eur/arm9/relocs.txt for every relocated word (2/6
 * words are relocations to other main addresses, annotated per-word below).
 * Reader: func_ov008_021aeeac.c: func_020211c8(data_020f87d8) -- opaque resource-
 * loader pointer arg.
 */

unsigned int data_020f87d8[6] = {
    0xf1000000,
    0x020f87f0,  /* -> data_020f87f0 */
    0x00000003,
    0x020f89b0,  /* -> data_020f89b0 */
    0x00000003,
    0xf0000000,
};
