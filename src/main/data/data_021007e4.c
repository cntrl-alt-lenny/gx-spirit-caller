/* data_021007e4 (16 bytes, 4-aligned): string constant.
 * "Invalid value." (14 chars + NUL, zero-padded to 16 bytes (automatic from
 * array size > literal length)).
 * Reader(s): func_0205a18c (relocs.txt from:0x0205a8e4 kind:load
 * to:0x021007e4).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x021007e4-0x021007f4.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_021007e4[16] = "Invalid value.";
