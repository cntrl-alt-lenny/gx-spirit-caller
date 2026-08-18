/* data_020ffb80 (12 bytes, 4-aligned): string constant.
 * "hashtable.c" (11 chars + NUL).
 * Reader(s): func_02054338 (relocs.txt from:0x020543b4 kind:load
 * to:0x020ffb80); func_020543b8 (relocs.txt from:0x02054428 kind:load
 * to:0x020ffb80); func_0205442c (relocs.txt from:0x020544c4 kind:load
 * to:0x020ffb80); +5 more reader(s), same relocs.txt to:0x020ffb80.
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020ffb80-0x020ffb8c.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020ffb80[12] = "hashtable.c";
