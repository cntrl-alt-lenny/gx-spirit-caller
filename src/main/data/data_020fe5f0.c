/* data_020fe5f0 (12 bytes, 4-aligned): string constant.
 * "returncd" (8 chars + NUL, zero-padded to 12 bytes (automatic from array
 * size > literal length)).
 * Reader(s): func_0203f968 (relocs.txt from:0x0203fc38 kind:load
 * to:0x020fe5f0).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020fe5f0-0x020fe5fc.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020fe5f0[12] = "returncd";
