/* data_02101430 (24 bytes, 4-aligned): string constant.
 * "start <= buffer->len" (20 chars + NUL, zero-padded to 24 bytes
 * (automatic from array size > literal length)).
 * Reader(s): func_0206133c (relocs.txt from:0x020613cc kind:load
 * to:0x02101430).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02101430-0x02101448.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02101430[24] = "start <= buffer->len";
