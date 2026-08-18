/* data_02101700 (12 bytes, 4-aligned): string constant.
 * "localport" (9 chars + NUL, zero-padded to 12 bytes (automatic from array
 * size > literal length)).
 * Reader(s): func_02066010 (relocs.txt from:0x02066204 kind:load
 * to:0x02101700).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02101700-0x0210170c.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02101700[12] = "localport";
