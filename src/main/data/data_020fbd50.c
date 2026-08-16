/* data_020fbd50 (24 bytes, main .data, cm-restock-carve-7): opaque 6-word array,
 * real ROM bytes verified via extract/eur/arm9/arm9.bin + cross-checked
 * against config/eur/arm9/relocs.txt for every relocated word (2/6
 * words are relocations to other main addresses, annotated per-word below).
 * Reader: func_ov006_021ca264.s (opaque .word literal load). USA/JPN name-share a 4B
 * cluster-B scalar at their own region-derived boundary; unrelated to this
 * EUR span.
 */

unsigned int data_020fbd50[6] = {
    0xf1000000,
    0x020fbd68,  /* -> data_020fbd68 */
    0x00000005,
    0x020fbd84,  /* -> data_020fbd84 */
    0x00000005,
    0xf0000000,
};
