/* data_021000f4 (12 bytes, 4-aligned): string constant.
 * "pos <= len" (10 chars + NUL, zero-padded to 12 bytes (automatic from
 * array size > literal length)).
 * Reader(s): func_02057980 (relocs.txt from:0x02057afc kind:load
 * to:0x021000f4).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x021000f4-0x02100100.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_021000f4[12] = "pos <= len";
