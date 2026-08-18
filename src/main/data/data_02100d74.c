/* data_02100d74 (8 bytes, 4-aligned): string constant.
 * "id > 0" (6 chars + NUL, zero-padded to 8 bytes (automatic from array
 * size > literal length)).
 * Reader(s): func_0205d6f8 (relocs.txt from:0x0205d7d8 kind:load
 * to:0x02100d74).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100d74-0x02100d7c.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100d74[8] = "id > 0";
