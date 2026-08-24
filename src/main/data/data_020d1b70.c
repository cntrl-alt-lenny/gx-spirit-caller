/* data_020d1b70 (40 bytes, array shape, zero internal outgoing relocations):
 * opaque byte content -- reader is a DATA pointer table, invisible to the
 * pre-cm-restock-carve-10 function-only reader count. No shape-specific
 * structure imposed; matches this wave's canonical unsigned-char[] recipe for
 * array-shaped candidates with zero embedded pointers (cm-restock-carve-13,
 * following data_020b46b8.c's precedent).
 * No outgoing relocs in this span -- relocs.txt cross-checked over
 * 0x020d1b70-0x020d1b98.
 * Not const: ground truth section is .data (delinks.txt).
 */
unsigned char data_020d1b70[40] = {
    0x31, 0x00, 0x30, 0xf6, 0x30, 0x02, 0x00, 0xf7, 0xff, 0xff, 0x00, 0x00,
    0x30, 0x00, 0x00, 0xf7, 0x58, 0x02, 0x00, 0x00, 0x18, 0x02, 0x01, 0xf7,
    0x30, 0x00, 0x00, 0x00, 0x18, 0x03, 0x00, 0xf7, 0x58, 0x02, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x11,
};
