/* data_020ffb30 (12 bytes, 4-aligned): string constant.
 * "comparator" (10 chars + NUL, zero-padded to 12 bytes (automatic from
 * array size > literal length)).
 * Reader(s): func_02053f48 (relocs.txt from:0x02053fbc kind:load
 * to:0x020ffb30).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020ffb30-0x020ffb3c.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020ffb30[12] = "comparator";
