/* data_0210005c (8 bytes, 4-aligned): string constant.
 * "|ss|" (4 chars + NUL, zero-padded to 8 bytes (automatic from array size
 * > literal length)).
 * Reader(s): func_02056d1c (relocs.txt from:0x02057718 kind:load
 * to:0x0210005c).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x0210005c-0x02100064.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_0210005c[8] = "|ss|";
