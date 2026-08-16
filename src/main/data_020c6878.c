/* data_020c6878 (28 bytes, main .data, cm-restock-carve-7): opaque 7-word array,
 * real ROM bytes verified via extract/eur/arm9/arm9.bin + cross-checked
 * against config/eur/arm9/relocs.txt for every relocated word (0/7
 * words are relocations to other main addresses, annotated per-word below).
 * Reader: func_02021064.c: p[i+6] = data_020c6878[i] for i in [0,7) -- extern int
 * data_020c6878[]; confirmed int array, 0 relocations.
 */

int data_020c6878[7] = {
    0x00000001,
    0x00000001,
    0x00000001,
    0x00000080,
    0x00000008,
    0x00000080,
    0x00000008,
};
