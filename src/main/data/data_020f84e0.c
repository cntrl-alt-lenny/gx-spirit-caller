/* data_020f84e0 (32 bytes, main .data, cm-restock-carve-7): opaque 8-word array,
 * real ROM bytes verified via extract/eur/arm9/arm9.bin + cross-checked
 * against config/eur/arm9/relocs.txt for every relocated word (3/8
 * words are relocations to other main addresses, annotated per-word below).
 * Reader: func_ov008_021b22e4.c: func_020211c8(data_020f84e0) -- opaque resource-
 * loader pointer arg.
 */

unsigned int data_020f84e0[8] = {
    0xf1000000,
    0x020f8500,  /* -> data_020f8500 */
    0x00000003,
    0x020f8544,  /* -> data_020f8544 */
    0x00000003,
    0x020f8584,  /* -> data_020f8584 */
    0x00000003,
    0xf0000000,
};
