/* data_020ffb8c (8 bytes, 4-aligned): string constant.
 * "table" (5 chars + NUL, zero-padded to 8 bytes (automatic from array size
 * > literal length)).
 * Reader(s): func_0205442c (relocs.txt from:0x020544c0 kind:load
 * to:0x020ffb8c); func_020544c8 (relocs.txt from:0x02054560 kind:load
 * to:0x020ffb8c); func_02054568 (relocs.txt from:0x0205460c kind:load
 * to:0x020ffb8c); +3 more reader(s), same relocs.txt to:0x020ffb8c.
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020ffb8c-0x020ffb94.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020ffb8c[8] = "table";
