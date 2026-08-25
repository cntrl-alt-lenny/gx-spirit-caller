/* data_020e1654 (36 bytes, array shape, zero internal outgoing relocations):
 * opaque byte content -- reader is a DATA pointer table, invisible to the
 * pre-cm-restock-carve-10 function-only reader count. No shape-specific
 * structure imposed; matches this wave's canonical unsigned-char[] recipe for
 * array-shaped candidates with zero embedded pointers (cm-restock-carve-13,
 * following data_020b46b8.c's precedent).
 * No outgoing relocs in this span -- relocs.txt cross-checked over
 * 0x020e1654-0x020e1678.
 * Not const: ground truth section is .data (delinks.txt).
 */
unsigned char data_020e1654[36] = {
    0x00, 0x10, 0x00, 0xfa, 0x01, 0x00, 0x00, 0x00, 0x1e, 0x00, 0x01, 0x25,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1e, 0x00, 0x01, 0x23,
    0x00, 0x00, 0xe0, 0x00, 0x10, 0x01, 0x00, 0x00, 0x1e, 0x00, 0x00, 0xf2,
};
