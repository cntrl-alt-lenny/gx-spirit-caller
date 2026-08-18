/* data_020fe9a8 (20 bytes, 4-aligned): string constant.
 * "Content-Length: " (16 chars + NUL, zero-padded to 20 bytes (automatic
 * from array size > literal length)).
 * Reader(s): func_02041ca8 (relocs.txt from:0x02041da0 kind:load
 * to:0x020fe9a8).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020fe9a8-0x020fe9bc.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020fe9a8[20] = "Content-Length: ";
