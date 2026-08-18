/* data_0210149c (36 bytes, 4-aligned): string constant.
 * "(buffer->len + 2) <= buffer->size" (33 chars + NUL, zero-padded to 36
 * bytes (automatic from array size > literal length)).
 * Reader(s): func_02061464 (relocs.txt from:0x020614d0 kind:load
 * to:0x0210149c).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x0210149c-0x021014c0.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_0210149c[36] = "(buffer->len + 2) <= buffer->size";
