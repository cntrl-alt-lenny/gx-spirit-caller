/* data_020c6d80 (24 bytes, array shape, zero internal outgoing relocations):
 * opaque byte content -- reader is a DATA pointer table, invisible to the
 * pre-cm-restock-carve-10 function-only reader count. No shape-specific
 * structure imposed; matches this wave's canonical unsigned-char[] recipe for
 * array-shaped candidates with zero embedded pointers (cm-restock-carve-13,
 * following data_020b46b8.c's precedent).
 * No outgoing relocs in this span -- relocs.txt cross-checked over
 * 0x020c6d80-0x020c6d98.
 * Not const: ground truth section is .data (delinks.txt).
 */
unsigned char data_020c6d80[24] = {
    0xc0, 0xfe, 0xa0, 0x03, 0x00, 0x00, 0xc0, 0xfe, 0x00, 0x00, 0x00, 0x00,
    0x40, 0x01, 0x00, 0x00, 0x00, 0x00, 0x40, 0x01, 0xa0, 0x03, 0x00, 0x00,
};
