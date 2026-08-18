/* data_02101e28 (20 bytes, 4-aligned): string constant.
 * "callback != NULL" (16 chars + NUL, zero-padded to 20 bytes (automatic
 * from array size > literal length)).
 * Reader(s): func_0206b31c (relocs.txt from:0x0206b440 kind:load
 * to:0x02101e28).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02101e28-0x02101e3c.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02101e28[20] = "callback != NULL";
