/* data_02101e4c (24 bytes, main .data, cm-restock-carve-7): opaque 6-word array,
 * real ROM bytes verified via extract/eur/arm9/arm9.bin + cross-checked
 * against config/eur/arm9/relocs.txt for every relocated word (0/6
 * words are relocations to other main addresses, annotated per-word below).
 * Reader: func_0206eecc.legacy.c: func_0206c46c(&data_02101e4c) -- opaque pointer,
 * same consumer chain as data_02101e64/_02101e7c (both declined for rich
 * typing in cm-data-restock-check-2026-08-03.md Part 2; carveable here as
 * an opaque blob regardless). USA/JPN name-share a 4B cluster-B scalar at
 * their own region-derived boundary.
 */

unsigned int data_02101e4c[6] = {
    0x05c00101,
    0x00000001,
    0x00000000,
    0x08000000,
    0x200c0800,
    0x00000000,
};
