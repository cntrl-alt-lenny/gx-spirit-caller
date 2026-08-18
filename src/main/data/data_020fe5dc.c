/* data_020fe5dc (8 bytes, 4-aligned): string constant.
 * "Date" (4 chars + NUL, zero-padded to 8 bytes (automatic from array size
 * > literal length)).
 * Reader(s): func_0203f968 (relocs.txt from:0x0203fc20 kind:load
 * to:0x020fe5dc).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020fe5dc-0x020fe5e4.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020fe5dc[8] = "Date";
