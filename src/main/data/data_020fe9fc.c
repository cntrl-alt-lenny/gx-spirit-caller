/* data_020fe9fc (24 bytes, 4-aligned): string constant.
 * "ALLOC http->lowsendbuf" (22 chars + NUL, zero-padded to 24 bytes
 * (automatic from array size > literal length)).
 * Reader(s): func_02042068 (relocs.txt from:0x02042184 kind:load
 * to:0x020fe9fc).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020fe9fc-0x020fea14.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020fe9fc[24] = "ALLOC http->lowsendbuf";
