/* data_020feb4c (8 bytes, 4-aligned): string constant.
 * "data" (4 chars + NUL, zero-padded to 8 bytes (automatic from array size
 * > literal length)).
 * Reader(s): func_020421d8 (relocs.txt from:0x0204313c kind:load
 * to:0x020feb4c).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020feb4c-0x020feb54.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020feb4c[8] = "data";
