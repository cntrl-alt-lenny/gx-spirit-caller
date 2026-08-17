/* data_02101718 (4 bytes, 4-aligned): string constant.
 * "0" (1 chars + NUL, zero-padded to 4 bytes (automatic from array size >
 * literal length)).
 * Reader(s): func_02066010 (relocs.txt from:0x02066210 kind:load
 * to:0x02101718).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02101718-0x0210171c.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02101718[4] = "0";
