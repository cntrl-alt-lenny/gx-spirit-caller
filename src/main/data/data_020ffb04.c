/* data_020ffb04 (12 bytes, 4-aligned): string constant.
 * "darray.c" (8 chars + NUL, zero-padded to 12 bytes (automatic from array
 * size > literal length)).
 * Reader(s): func_02053c34 (relocs.txt from:0x02053ca0 kind:load
 * to:0x020ffb04); func_02053ca8 (relocs.txt from:0x02053d0c kind:load
 * to:0x020ffb04); func_02053dfc (relocs.txt from:0x02053e54 kind:load
 * to:0x020ffb04); +9 more reader(s), same relocs.txt to:0x020ffb04.
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020ffb04-0x020ffb10.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020ffb04[12] = "darray.c";
