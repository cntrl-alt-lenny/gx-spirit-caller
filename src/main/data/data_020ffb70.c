/* data_020ffb70 (12 bytes, 4-aligned): string constant.
 * "array->list" (11 chars + NUL).
 * Reader(s): func_020541b8 (relocs.txt from:0x02054288 kind:load
 * to:0x020ffb70); func_020542b8 (relocs.txt from:0x0205430c kind:load
 * to:0x020ffb70).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020ffb70-0x020ffb7c.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020ffb70[12] = "array->list";
