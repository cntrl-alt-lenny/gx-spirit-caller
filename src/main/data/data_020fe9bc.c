/* data_020fe9bc (12 bytes, 4-aligned): string constant.
 * "Connection" (10 chars + NUL, zero-padded to 12 bytes (automatic from
 * array size > literal length)).
 * Reader(s): func_02041fd0 (relocs.txt from:0x02042054 kind:load
 * to:0x020fe9bc).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020fe9bc-0x020fe9c8.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020fe9bc[12] = "Connection";
