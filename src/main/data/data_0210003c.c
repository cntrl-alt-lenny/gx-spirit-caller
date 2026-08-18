/* data_0210003c (16 bytes, 4-aligned): string constant.
 * "Out of memory." (14 chars + NUL, zero-padded to 16 bytes (automatic from
 * array size > literal length)).
 * Reader(s): func_02056d1c (relocs.txt from:0x02057700 kind:load
 * to:0x0210003c).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x0210003c-0x0210004c.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_0210003c[16] = "Out of memory.";
