/* data_020fffa8 (12 bytes, 4-aligned): string constant.
 * "index >= 0" (10 chars + NUL, zero-padded to 12 bytes (automatic from
 * array size > literal length)).
 * Reader(s): func_02056884 (relocs.txt from:0x02056a20 kind:load
 * to:0x020fffa8).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020fffa8-0x020fffb4.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020fffa8[12] = "index >= 0";
