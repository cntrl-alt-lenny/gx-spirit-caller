/* data_0210130c (8 bytes, 4-aligned): string constant.
 * "len > 0" (7 chars + NUL).
 * Reader(s): func_020602c4 (relocs.txt from:0x020603c8 kind:load
 * to:0x0210130c).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x0210130c-0x02101314.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_0210130c[8] = "len > 0";
