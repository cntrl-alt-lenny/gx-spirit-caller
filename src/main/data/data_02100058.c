/* data_02100058 (4 bytes, 4-aligned): string constant.
 * "|s|" (3 chars + NUL).
 * Reader(s): func_02056d1c (relocs.txt from:0x02057714 kind:load
 * to:0x02100058).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100058-0x0210005c.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100058[4] = "|s|";
