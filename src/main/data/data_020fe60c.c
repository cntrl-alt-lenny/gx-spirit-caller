/* data_020fe60c (12 bytes, 4-aligned): string constant.
 * "challenge" (9 chars + NUL, zero-padded to 12 bytes (automatic from array
 * size > literal length)).
 * Reader(s): func_0203f968 (relocs.txt from:0x0203fc58 kind:load
 * to:0x020fe60c).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020fe60c-0x020fe618.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020fe60c[12] = "challenge";
