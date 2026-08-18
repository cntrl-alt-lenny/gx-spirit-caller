/* data_02100a7c (16 bytes, 4-aligned): string constant.
 * "Invalid date." (13 chars + NUL, zero-padded to 16 bytes (automatic from
 * array size > literal length)).
 * Reader(s): func_0205b9ac (relocs.txt from:0x0205ba58 kind:load
 * to:0x02100a7c).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100a7c-0x02100a8c.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100a7c[16] = "Invalid date.";
