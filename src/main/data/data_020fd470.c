/* data_020fd470 (72 bytes, main .data, cm-restock-carve-7): opaque 18-word array,
 * real ROM bytes verified via extract/eur/arm9/arm9.bin + cross-checked
 * against config/eur/arm9/relocs.txt for every relocated word (8/18
 * words are relocations to other main addresses, annotated per-word below).
 * Reader: func_ov006_021c1680.c: func_020211c8(data_020fd470) -- opaque resource-
 * loader pointer arg, no field access.
 */

unsigned int data_020fd470[18] = {
    0xf1000000,
    0x020fd4b8,  /* -> data_020fd4b8 */
    0x00000001,
    0x020fd504,  /* -> data_020fd504 */
    0x00000002,
    0x020fd56c,  /* -> data_020fd56c */
    0x00000006,
    0x020fd59c,  /* -> data_020fd59c */
    0x00000006,
    0x020fd5b8,  /* -> data_020fd5b8 */
    0x00000006,
    0x020fd5f8,  /* -> data_020fd5f8 */
    0x00000006,
    0x020fd680,  /* -> data_020fd680 */
    0x00000003,
    0x020fd920,  /* -> data_020fd920 */
    0x00000003,
    0xf0000000,
};
