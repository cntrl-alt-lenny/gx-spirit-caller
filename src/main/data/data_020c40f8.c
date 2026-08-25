/* data_020c40f8 (16 bytes, array shape, zero internal outgoing relocations):
 * opaque byte content -- reader is a DATA pointer table, invisible to the
 * pre-cm-restock-carve-10 function-only reader count. No shape-specific
 * structure imposed; matches this wave's canonical unsigned-char[] recipe for
 * array-shaped candidates with zero embedded pointers (cm-restock-carve-13,
 * following data_020b46b8.c's precedent).
 * No outgoing relocs in this span -- relocs.txt cross-checked over
 * 0x020c40f8-0x020c4108.
 * Not const: ground truth section is .data (delinks.txt).
 */
unsigned char data_020c40f8[16] = {
    0x83, 0x4a, 0x81, 0x5b, 0x83, 0x68, 0x83, 0x8a, 0x83, 0x58, 0x83, 0x67,
    0x00, 0x00, 0x00, 0x00,
};
