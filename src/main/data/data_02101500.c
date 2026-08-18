/* data_02101500 (24 bytes, 4-aligned): string constant.
 * "socket && connection" (20 chars + NUL, zero-padded to 24 bytes
 * (automatic from array size > literal length)).
 * Reader(s): func_02061d5c (relocs.txt from:0x02061e80 kind:load
 * to:0x02101500).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02101500-0x02101518.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02101500[24] = "socket && connection";
