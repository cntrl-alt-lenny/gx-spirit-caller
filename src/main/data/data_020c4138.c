/* data_020c4138 (16 bytes, array shape, zero internal outgoing relocations):
 * opaque byte content -- reader is a DATA pointer table, invisible to the
 * pre-cm-restock-carve-10 function-only reader count. No shape-specific
 * structure imposed; matches this wave's canonical unsigned-char[] recipe for
 * array-shaped candidates with zero embedded pointers (cm-restock-carve-13,
 * following data_020b46b8.c's precedent).
 * No outgoing relocs in this span -- relocs.txt cross-checked over
 * 0x020c4138-0x020c4148.
 * Not const: ground truth section is .data (delinks.txt).
 */
unsigned char data_020c4138[16] = {
    0x83, 0x60, 0x83, 0x85, 0x81, 0x5b, 0x83, 0x67, 0x83, 0x8a, 0x83, 0x41,
    0x83, 0x8b, 0x00, 0x00,
};
