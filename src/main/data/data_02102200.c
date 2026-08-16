/* data_02102200 (16 bytes, main .data, cm-restock-carve-7): opaque 4-word array,
 * real ROM bytes verified via extract/eur/arm9/arm9.bin + cross-checked
 * against config/eur/arm9/relocs.txt for every relocated word (1/4
 * words are relocations to other main addresses, annotated per-word below).
 * Reader: (reader not directly located by name-grep this wave; census reader-count=1)
 */

unsigned int data_02102200[4] = {
    0x0208428c,  /* -> func_0208428c */
    0x00000000,
    0x00000000,
    0x00000000,
};
