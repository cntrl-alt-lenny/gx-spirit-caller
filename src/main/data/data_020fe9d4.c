/* data_020fe9d4 (16 bytes, 4-aligned): string constant.
 * "Content-Length" (14 chars + NUL, zero-padded to 16 bytes (automatic from
 * array size > literal length)).
 * Reader(s): func_02041fd0 (relocs.txt from:0x02042064 kind:load
 * to:0x020fe9d4).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020fe9d4-0x020fe9e4.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020fe9d4[16] = "Content-Length";
