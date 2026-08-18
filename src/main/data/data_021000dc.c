/* data_021000dc (12 bytes, 4-aligned): string constant.
 * "len >= 0" (8 chars + NUL, zero-padded to 12 bytes (automatic from array
 * size > literal length)).
 * Reader(s): func_02057980 (relocs.txt from:0x02057aec kind:load
 * to:0x021000dc).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x021000dc-0x021000e8.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_021000dc[12] = "len >= 0";
