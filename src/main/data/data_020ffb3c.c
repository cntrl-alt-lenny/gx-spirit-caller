/* data_020ffb3c (32 bytes, 4-aligned): string constant.
 * "(n >= 0) && (n <= array->count)" (31 chars + NUL).
 * Reader(s): func_02053fc4 (relocs.txt from:0x02054074 kind:load
 * to:0x020ffb3c).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020ffb3c-0x020ffb5c.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020ffb3c[32] = "(n >= 0) && (n <= array->count)";
