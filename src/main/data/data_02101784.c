/* data_02101784 (16 bytes, 4-aligned): string constant.
 * "255.255.255.255" (15 chars + NUL).
 * Reader(s): func_02067154 (relocs.txt from:0x02067204 kind:load
 * to:0x02101784).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02101784-0x02101794.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02101784[16] = "255.255.255.255";
