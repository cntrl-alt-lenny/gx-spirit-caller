/* data_020e621c (20 bytes, array shape, zero internal outgoing relocations):
 * opaque byte content -- reader is a DATA pointer table, invisible to the
 * pre-cm-restock-carve-10 function-only reader count. No shape-specific
 * structure imposed; matches this wave's canonical unsigned-char[] recipe for
 * array-shaped candidates with zero embedded pointers (cm-restock-carve-13,
 * following data_020b46b8.c's precedent).
 * No outgoing relocs in this span -- relocs.txt cross-checked over
 * 0x020e621c-0x020e6230.
 * Not const: ground truth section is .data (delinks.txt).
 */
unsigned char data_020e621c[20] = {
    0x01, 0x05, 0x00, 0xf7, 0xfe, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00, 0x44,
    0x03, 0x00, 0x00, 0xf2, 0x00, 0x00, 0x00, 0x11,
};
