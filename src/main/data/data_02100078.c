/* data_02100078 (4 bytes, 4-aligned): string constant.
 * "|l|" (3 chars + NUL).
 * Reader(s): func_02056d1c (relocs.txt from:0x02057728 kind:load
 * to:0x02100078).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100078-0x0210007c.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100078[4] = "|l|";
