/* data_0210007c (4 bytes, 4-aligned): string constant.
 * "1" (1 chars + NUL, zero-padded to 4 bytes (automatic from array size >
 * literal length)).
 * Reader(s): func_02056d1c (relocs.txt from:0x0205772c kind:load
 * to:0x0210007c).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x0210007c-0x02100080.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_0210007c[4] = "1";
