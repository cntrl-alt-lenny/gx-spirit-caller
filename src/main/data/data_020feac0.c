/* data_020feac0 (12 bytes, 4-aligned): string constant.
 * "httpresult" (10 chars + NUL, zero-padded to 12 bytes (automatic from
 * array size > literal length)).
 * Reader(s): func_020421d8 (relocs.txt from:0x020430ec kind:load
 * to:0x020feac0).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020feac0-0x020feacc.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020feac0[12] = "httpresult";
