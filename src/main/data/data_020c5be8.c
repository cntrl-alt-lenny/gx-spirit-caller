/* data_020c5be8 (20 bytes, array shape, zero internal outgoing relocations):
 * opaque byte content -- reader is a DATA pointer table, invisible to the
 * pre-cm-restock-carve-10 function-only reader count. No shape-specific
 * structure imposed; matches this wave's canonical unsigned-char[] recipe for
 * array-shaped candidates with zero embedded pointers (cm-restock-carve-13,
 * following data_020b46b8.c's precedent).
 * No outgoing relocs in this span -- relocs.txt cross-checked over
 * 0x020c5be8-0x020c5bfc.
 * Not const: ground truth section is .data (delinks.txt).
 */
unsigned char data_020c5be8[20] = {
    0x83, 0x58, 0x83, 0x50, 0x83, 0x8b, 0x83, 0x47, 0x83, 0x93, 0x83, 0x57,
    0x83, 0x46, 0x83, 0x8b, 0x00, 0x00, 0x00, 0x00,
};
