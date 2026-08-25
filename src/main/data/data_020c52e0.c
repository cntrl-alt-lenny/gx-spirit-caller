/* data_020c52e0 (20 bytes, array shape, zero internal outgoing relocations):
 * opaque byte content -- reader is a DATA pointer table, invisible to the
 * pre-cm-restock-carve-10 function-only reader count. No shape-specific
 * structure imposed; matches this wave's canonical unsigned-char[] recipe for
 * array-shaped candidates with zero embedded pointers (cm-restock-carve-13,
 * following data_020b46b8.c's precedent).
 * No outgoing relocs in this span -- relocs.txt cross-checked over
 * 0x020c52e0-0x020c52f4.
 * Not const: ground truth section is .data (delinks.txt).
 */
unsigned char data_020c52e0[20] = {
    0x83, 0x52, 0x83, 0x8d, 0x83, 0x56, 0x83, 0x41, 0x83, 0x80, 0x81, 0x45,
    0x8c, 0xdf, 0x91, 0x4f, 0x00, 0x00, 0x00, 0x00,
};
