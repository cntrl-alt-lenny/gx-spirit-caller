/* data_02101234 (16 bytes, 4-aligned): string constant.
 * "buffer != NULL" (14 chars + NUL, zero-padded to 16 bytes (automatic from
 * array size > literal length)).
 * Reader(s): func_02060000 (relocs.txt from:0x020601ac kind:load
 * to:0x02101234).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02101234-0x02101244.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02101234[16] = "buffer != NULL";
