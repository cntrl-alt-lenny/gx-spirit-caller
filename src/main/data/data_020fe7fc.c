/* data_020fe7fc (12 bytes, 4-aligned): string constant.
 * "httpresult" (10 chars + NUL, zero-padded to 12 bytes (automatic from
 * array size > literal length)).
 * Reader(s): func_02040e3c (relocs.txt from:0x020410d4 kind:load
 * to:0x020fe7fc).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020fe7fc-0x020fe808.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020fe7fc[12] = "httpresult";
