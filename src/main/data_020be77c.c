/* data_020be77c (24 bytes, main .rodata, cm-restock-carve-7): opaque 6-word array,
 * real ROM bytes verified via extract/eur/arm9/arm9.bin + cross-checked
 * against config/eur/arm9/relocs.txt for every relocated word (6/6
 * words are relocations to other main addresses, annotated per-word below).
 * Reader: func_0202b12c.s / func_0202c334.s / func_0202c270.s -- all 3 readers are
 * permanent reg-alloc-walled .s (brief 294 endgame), no C field evidence.
 * All 6 words are relocations, see per-word comments.
 */

const unsigned int data_020be77c[6] = {
    0x020c6968,  /* -> data_020c6968 */
    0x020c696c,  /* -> data_020c696c */
    0x020c6964,  /* -> data_020c6964 */
    0x020c6978,  /* -> data_020c6978 */
    0x020c6974,  /* -> data_020c6974 */
    0x020c6970,  /* -> data_020c6970 */
};
