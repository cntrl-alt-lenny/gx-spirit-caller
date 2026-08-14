/* data_020ce380 (16 bytes, main .data, cm-restock-carve-7): opaque 4-word array,
 * real ROM bytes verified via extract/eur/arm9/arm9.bin + cross-checked
 * against config/eur/arm9/relocs.txt for every relocated word (1/4
 * words are relocations to other main addresses, annotated per-word below).
 * Reader: func_ov002_022b5180.c: func_020211c8(data_020ce380) -- opaque resource-
 * loader pointer arg.
 */

unsigned int data_020ce380[4] = {
    0xf1000000,
    0x020ce390,  /* -> data_020ce390 */
    0x00000003,
    0xf0000000,
};
