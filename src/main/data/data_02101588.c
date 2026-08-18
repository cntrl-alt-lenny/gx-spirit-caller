/* data_02101588 (8 bytes, 4-aligned): OS_SPrintf-style format string.
 * "%s:%d" (5 chars + NUL, zero-padded to 8 bytes (automatic from array size
 * > literal length)).
 * Reader(s): func_02064f84 (relocs.txt from:0x02065040 kind:load
 * to:0x02101588).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02101588-0x02101590.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02101588[8] = "%s:%d";
