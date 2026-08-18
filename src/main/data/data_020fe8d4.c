/* data_020fe8d4 (20 bytes, 4-aligned): string constant.
 * "ALLOC buf->buffer" (17 chars + NUL, zero-padded to 20 bytes (automatic
 * from array size > literal length)).
 * Reader(s): func_020414b0 (relocs.txt from:0x0204151c kind:load
 * to:0x020fe8d4).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020fe8d4-0x020fe8e8.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020fe8d4[20] = "ALLOC buf->buffer";
