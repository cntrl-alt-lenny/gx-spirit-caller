/* data_020fdcd0 (40 bytes, array shape, zero internal outgoing relocations):
 * opaque byte content -- reader is a DATA pointer table, invisible to the
 * pre-cm-restock-carve-10 function-only reader count. No shape-specific
 * structure imposed; matches this wave's canonical unsigned-char[] recipe for
 * array-shaped candidates with zero embedded pointers (cm-restock-carve-13,
 * following data_020b46b8.c's precedent).
 * No outgoing relocs in this span -- relocs.txt cross-checked over
 * 0x020fdcd0-0x020fdcf8.
 * Not const: ground truth section is .data (delinks.txt).
 */
unsigned char data_020fdcd0[40] = {
    0x00, 0x00, 0x00, 0x46, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x49, 0x80, 0x00, 0x80, 0x00, 0x80, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x53, 0x00, 0x00, 0x00, 0x5f, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x2d, 0xf5,
};
