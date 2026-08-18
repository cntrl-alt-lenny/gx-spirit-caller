/* data_02100ba4 (16 bytes, 4-aligned): string constant.
 * "message != NULL" (15 chars + NUL).
 * Reader(s): func_0205c3c0 (relocs.txt from:0x0205c538 kind:load
 * to:0x02100ba4).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100ba4-0x02100bb4.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100ba4[16] = "message != NULL";
