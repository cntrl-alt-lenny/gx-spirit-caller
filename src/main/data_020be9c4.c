/* data_020be9c4 (36 bytes, main .rodata, cm-restock-carve-7): opaque 9-word array,
 * real ROM bytes verified via extract/eur/arm9/arm9.bin + cross-checked
 * against config/eur/arm9/relocs.txt for every relocated word (9/9
 * words are relocations to other main addresses, annotated per-word below).
 * Reader: func_0202d3c4.c: OS_SPrintf(..., data_020be9c4[a0-1]) -- extern int
 * data_020be9c4[]; indexed array, sole reader treats elements as int-sized
 * (all 9 words are relocations, see per-word comments).
 */

const int data_020be9c4[9] = {
    0x020c6bf4,  /* -> data_020c6bf4 */
    0x020c6bcc,  /* -> data_020c6bcc */
    0x020c6bfc,  /* -> data_020c6bfc */
    0x020c6bd4,  /* -> data_020c6bd4 */
    0x020c6c24,  /* -> data_020c6c24 */
    0x020c6bb4,  /* -> data_020c6bb4 */
    0x020c6b90,  /* -> data_020c6b90 */
    0x020c6be4,  /* -> data_020c6be4 */
    0x020c6b94,  /* -> data_020c6b94 */
};
