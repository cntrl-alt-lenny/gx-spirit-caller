/* data_020c58b0 (20 bytes, main .data, cm-restock-carve-7): opaque 5-word array,
 * real ROM bytes verified via extract/eur/arm9/arm9.bin + cross-checked
 * against config/eur/arm9/relocs.txt for every relocated word (0/5
 * words are relocations to other main addresses, annotated per-word below).
 * Reader: func_02012cc8.s (opaque .word literal load; real bytes decode as a Shift-
 * JIS bracketed format string, shipped as raw words not a string literal
 * to avoid encoding ambiguity). USA/JPN name-share a 4B cluster-B scalar
 * at their own region-derived boundary.
 */

unsigned int data_020c58b0[5] = {
    0x253a6425,
    0x3a643230,
    0x75817325,
    0x76817325,
    0x00000000,
};
