/* data_020c5c38 (20 bytes, array shape, zero internal outgoing relocations):
 * opaque byte content -- reader is a DATA pointer table, invisible to the
 * pre-cm-restock-carve-10 function-only reader count. No shape-specific
 * structure imposed; matches this wave's canonical unsigned-char[] recipe for
 * array-shaped candidates with zero embedded pointers (cm-restock-carve-13,
 * following data_020b46b8.c's precedent).
 * No outgoing relocs in this span -- relocs.txt cross-checked over
 * 0x020c5c38-0x020c5c4c.
 * Not const: ground truth section is .data (delinks.txt).
 */
unsigned char data_020c5c38[20] = {
    0x82, 0xa8, 0x83, 0x57, 0x83, 0x83, 0x83, 0x7d, 0x81, 0x45, 0x83, 0x43,
    0x83, 0x47, 0x83, 0x8d, 0x81, 0x5b, 0x00, 0x00,
};
