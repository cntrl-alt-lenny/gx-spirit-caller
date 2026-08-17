/* data_020fe6f8 (8 bytes, 4-aligned): string constant.
 * "devname" (7 chars + NUL).
 * Reader(s): func_0204068c (relocs.txt from:0x020409c4 kind:load
 * to:0x020fe6f8).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020fe6f8-0x020fe700.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020fe6f8[8] = "devname";
