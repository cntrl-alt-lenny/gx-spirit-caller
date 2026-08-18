/* data_02100b2c (20 bytes, 4-aligned): string constant.
 * "*connection != NULL" (19 chars + NUL).
 * Reader(s): func_0205bf18 (relocs.txt from:0x0205c244 kind:load
 * to:0x02100b2c).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100b2c-0x02100b40.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100b2c[20] = "*connection != NULL";
