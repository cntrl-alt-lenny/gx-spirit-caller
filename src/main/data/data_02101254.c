/* data_02101254 (12 bytes, 4-aligned): string constant.
 * "key != NULL" (11 chars + NUL).
 * Reader(s): func_02060000 (relocs.txt from:0x020601b8 kind:load
 * to:0x02101254); func_020602c4 (relocs.txt from:0x020603b8 kind:load
 * to:0x02101254).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02101254-0x02101260.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02101254[12] = "key != NULL";
