/* data_02101e18 (16 bytes, 4-aligned): string constant.
 * "slist != NULL" (13 chars + NUL, zero-padded to 16 bytes (automatic from
 * array size > literal length)).
 * Reader(s): func_0206b31c (relocs.txt from:0x0206b434 kind:load
 * to:0x02101e18).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02101e18-0x02101e28.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02101e18[16] = "slist != NULL";
