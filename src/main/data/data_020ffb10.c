/* data_020ffb10 (32 bytes, 4-aligned): string constant.
 * "(n >= 0) && (n < array->count)" (30 chars + NUL, zero-padded to 32 bytes
 * (automatic from array size > literal length)).
 * Reader(s): func_02053dfc (relocs.txt from:0x02053e50 kind:load
 * to:0x020ffb10); func_02053e58 (relocs.txt from:0x02053eac kind:load
 * to:0x020ffb10); func_02053eb4 (relocs.txt from:0x02053f40 kind:load
 * to:0x020ffb10); +1 more reader(s), same relocs.txt to:0x020ffb10.
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020ffb10-0x020ffb30.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020ffb10[32] = "(n >= 0) && (n < array->count)";
