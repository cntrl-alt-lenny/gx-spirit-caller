/* data_02100074 (4 bytes, 4-aligned): string constant.
 * "|p|" (3 chars + NUL).
 * Reader(s): func_02056d1c (relocs.txt from:0x02057724 kind:load
 * to:0x02100074).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100074-0x02100078.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100074[4] = "|p|";
