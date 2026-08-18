/* data_020fe85c (28 bytes, 4-aligned): string constant.
 * "FREE result->entry[i].label" (27 chars + NUL).
 * Reader(s): func_020410ec (relocs.txt from:0x02041240 kind:load
 * to:0x020fe85c).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020fe85c-0x020fe878.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020fe85c[28] = "FREE result->entry[i].label";
