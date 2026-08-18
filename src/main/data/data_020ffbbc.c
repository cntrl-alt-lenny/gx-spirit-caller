/* data_020ffbbc (16 bytes, 4-aligned): string constant.
 * "table->buckets" (14 chars + NUL, zero-padded to 16 bytes (automatic from
 * array size > literal length)).
 * Reader(s): func_02054700 (relocs.txt from:0x0205483c kind:load
 * to:0x020ffbbc).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020ffbbc-0x020ffbcc.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020ffbbc[16] = "table->buckets";
