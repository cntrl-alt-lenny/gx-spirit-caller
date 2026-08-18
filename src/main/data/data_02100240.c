/* data_02100240 (16 bytes, 4-aligned): string constant.
 * "string != NULL" (14 chars + NUL, zero-padded to 16 bytes (automatic from
 * array size > literal length)).
 * Reader(s): func_020580a0 (relocs.txt from:0x02058194 kind:load
 * to:0x02100240).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100240-0x02100250.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100240[16] = "string != NULL";
