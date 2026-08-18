/* data_021000e8 (12 bytes, 4-aligned): string constant.
 * "pos >= 0" (8 chars + NUL, zero-padded to 12 bytes (automatic from array
 * size > literal length)).
 * Reader(s): func_02057980 (relocs.txt from:0x02057af4 kind:load
 * to:0x021000e8).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x021000e8-0x021000f4.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_021000e8[12] = "pos >= 0";
