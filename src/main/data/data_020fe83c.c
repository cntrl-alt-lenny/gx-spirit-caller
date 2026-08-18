/* data_020fe83c (32 bytes, 4-aligned): string constant.
 * "ALLOC result->entry[i].value" (28 chars + NUL, zero-padded to 32 bytes
 * (automatic from array size > literal length)).
 * Reader(s): func_020410ec (relocs.txt from:0x0204123c kind:load
 * to:0x020fe83c).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020fe83c-0x020fe85c.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020fe83c[32] = "ALLOC result->entry[i].value";
