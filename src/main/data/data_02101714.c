/* data_02101714 (4 bytes, 4-aligned): string constant.
 * "1" (1 chars + NUL, zero-padded to 4 bytes (automatic from array size >
 * literal length)).
 * Reader(s): func_02066010 (relocs.txt from:0x0206620c kind:load
 * to:0x02101714).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02101714-0x02101718.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02101714[4] = "1";
