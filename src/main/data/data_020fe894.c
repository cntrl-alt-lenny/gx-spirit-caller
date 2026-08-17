/* data_020fe894 (8 bytes, 4-aligned): string constant.
 * "http://" (7 chars + NUL).
 * Reader(s): func_02041248 (relocs.txt from:0x02041398 kind:load
 * to:0x020fe894).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020fe894-0x020fe89c.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020fe894[8] = "http://";
