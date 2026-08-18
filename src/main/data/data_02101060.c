/* data_02101060 (8 bytes, 4-aligned): string constant.
 * "status" (6 chars + NUL, zero-padded to 8 bytes (automatic from array
 * size > literal length)).
 * Reader(s): func_0205dba4 (relocs.txt from:0x0205f808 kind:load
 * to:0x02101060).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02101060-0x02101068.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02101060[8] = "status";
