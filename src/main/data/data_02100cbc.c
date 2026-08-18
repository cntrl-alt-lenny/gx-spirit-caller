/* data_02100cbc (16 bytes, 4-aligned): string constant.
 * "Out of memory." (14 chars + NUL, zero-padded to 16 bytes (automatic from
 * array size > literal length)).
 * Reader(s): func_0205cbb8 (relocs.txt from:0x0205ce38 kind:load
 * to:0x02100cbc).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100cbc-0x02100ccc.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100cbc[16] = "Out of memory.";
