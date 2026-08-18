/* data_020fe478 (8 bytes, 4-aligned): string constant.
 * "1A1iB2" (6 chars + NUL, zero-padded to 8 bytes (automatic from array
 * size > literal length)).
 * Reader(s): func_0203444c (relocs.txt from:0x0203453c kind:load
 * to:0x020fe478).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020fe478-0x020fe480.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020fe478[8] = "1A1iB2";
