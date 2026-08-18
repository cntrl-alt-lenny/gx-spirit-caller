/* data_0210170c (8 bytes, 4-aligned): string constant.
 * "natneg" (6 chars + NUL, zero-padded to 8 bytes (automatic from array
 * size > literal length)).
 * Reader(s): func_02066010 (relocs.txt from:0x02066208 kind:load
 * to:0x0210170c).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x0210170c-0x02101714.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_0210170c[8] = "natneg";
