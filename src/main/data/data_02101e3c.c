/* data_02101e3c (12 bytes, 4-aligned): string constant.
 * "val != NULL" (11 chars + NUL).
 * Reader(s): func_0206b47c (relocs.txt from:0x0206b4f4 kind:load
 * to:0x02101e3c).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02101e3c-0x02101e48.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02101e3c[12] = "val != NULL";
