/* data_020c5820 (24 bytes, array shape, zero internal outgoing relocations):
 * opaque byte content -- reader is a DATA pointer table, invisible to the
 * pre-cm-restock-carve-10 function-only reader count. No shape-specific
 * structure imposed; matches this wave's canonical unsigned-char[] recipe for
 * array-shaped candidates with zero embedded pointers (cm-restock-carve-13,
 * following data_020b46b8.c's precedent).
 * No outgoing relocs in this span -- relocs.txt cross-checked over
 * 0x020c5820-0x020c5838.
 * Not const: ground truth section is .data (delinks.txt).
 */
unsigned char data_020c5820[24] = {
    0x83, 0x41, 0x83, 0x4a, 0x83, 0x66, 0x83, 0x7e, 0x83, 0x41, 0x8c, 0xf6,
    0x8e, 0xae, 0x81, 0x45, 0x8c, 0xdf, 0x91, 0x4f, 0x00, 0x00, 0x00, 0x00,
};
