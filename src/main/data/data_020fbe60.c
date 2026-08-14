/* data_020fbe60 (88 bytes, main .data, cm-restock-carve-7): opaque 22-word array,
 * real ROM bytes verified via extract/eur/arm9/arm9.bin + cross-checked
 * against config/eur/arm9/relocs.txt for every relocated word (10/22
 * words are relocations to other main addresses, annotated per-word below).
 * Reader: func_ov006_021c1cc0.c: func_020211c8(data_020fbe60) -- opaque resource-
 * loader pointer arg, no field access.
 */

unsigned int data_020fbe60[22] = {
    0xf1000000,
    0x020fbeb8,  /* -> data_020fbeb8 */
    0x00000004,
    0x020fbed4,  /* -> data_020fbed4 */
    0x00000005,
    0x020fbed4,  /* -> data_020fbed4 */
    0x00000005,
    0x020fbed4,  /* -> data_020fbed4 */
    0x00000005,
    0x020fbed4,  /* -> data_020fbed4 */
    0x00000005,
    0x020fbed4,  /* -> data_020fbed4 */
    0x00000005,
    0x020fbed4,  /* -> data_020fbed4 */
    0x00000005,
    0x020fbed4,  /* -> data_020fbed4 */
    0x00000005,
    0x020fbed4,  /* -> data_020fbed4 */
    0x00000005,
    0x020fbf3c,  /* -> data_020fbf3c */
    0x00000005,
    0xf0000000,
};
