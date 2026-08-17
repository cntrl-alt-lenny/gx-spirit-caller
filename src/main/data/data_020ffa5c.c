/* data_020ffa5c (4 bytes, 4-aligned): string constant.
 * "SCN" (3 chars + NUL).
 * Reader(s): func_0204f820 (relocs.txt from:0x0204f8e8 kind:load
 * to:0x020ffa5c).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020ffa5c-0x020ffa60.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020ffa5c[4] = "SCN";
