/* data_021014c0 (28 bytes, 4-aligned): string constant.
 * "buffer->len < buffer->size" (26 chars + NUL, zero-padded to 28 bytes
 * (automatic from array size > literal length)).
 * Reader(s): func_020614d8 (relocs.txt from:0x02061528 kind:load
 * to:0x021014c0).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x021014c0-0x021014dc.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_021014c0[28] = "buffer->len < buffer->size";
