/* data_021013f4 (4 bytes, 4-aligned): string constant.
 * "\\" (1 chars + NUL, zero-padded to 4 bytes (automatic from array size >
 * literal length)).
 * Reader(s): func_02060cbc (relocs.txt from:0x02060d84 kind:load
 * to:0x021013f4).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x021013f4-0x021013f8.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_021013f4[4] = "\\";
