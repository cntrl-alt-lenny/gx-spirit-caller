/* data_020fe9c8 (8 bytes, 4-aligned): string constant.
 * "close" (5 chars + NUL, zero-padded to 8 bytes (automatic from array size
 * > literal length)).
 * Reader(s): func_02041fd0 (relocs.txt from:0x02042058 kind:load
 * to:0x020fe9c8).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020fe9c8-0x020fe9d0.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020fe9c8[8] = "close";
