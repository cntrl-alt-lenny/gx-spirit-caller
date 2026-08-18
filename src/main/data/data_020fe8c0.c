/* data_020fe8c0 (20 bytes, 4-aligned): string constant.
 * "FREE buf->buffer" (16 chars + NUL, zero-padded to 20 bytes (automatic
 * from array size > literal length)).
 * Reader(s): func_020413b0 (relocs.txt from:0x0204146c kind:load
 * to:0x020fe8c0); func_02041470 (relocs.txt from:0x020414ac kind:load
 * to:0x020fe8c0).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020fe8c0-0x020fe8d4.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020fe8c0[20] = "FREE buf->buffer";
