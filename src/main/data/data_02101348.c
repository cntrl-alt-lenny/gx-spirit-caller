/* data_02101348 (12 bytes, 4-aligned): string constant.
 * "src != NULL" (11 chars + NUL).
 * Reader(s): func_020604b0 (relocs.txt from:0x0206051c kind:load
 * to:0x02101348).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02101348-0x02101354.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02101348[12] = "src != NULL";
