/* data_02101478 (36 bytes, 4-aligned): string constant.
 * "(buffer->len + len) <= buffer->size" (35 chars + NUL).
 * Reader(s): func_020613d8 (relocs.txt from:0x0206145c kind:load
 * to:0x02101478).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02101478-0x0210149c.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02101478[36] = "(buffer->len + len) <= buffer->size";
