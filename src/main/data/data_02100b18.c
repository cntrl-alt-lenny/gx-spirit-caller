/* data_02100b18 (20 bytes, 4-aligned): string constant.
 * "connection != NULL" (18 chars + NUL, zero-padded to 20 bytes (automatic
 * from array size > literal length)).
 * Reader(s): func_0205bf18 (relocs.txt from:0x0205c23c kind:load
 * to:0x02100b18).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100b18-0x02100b2c.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100b18[20] = "connection != NULL";
