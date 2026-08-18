/* data_020ff914 (4 bytes, 4-aligned): string constant.
 * "MAT" (3 chars + NUL).
 * Reader(s): func_02046094 (relocs.txt from:0x020461f4 kind:load
 * to:0x020ff914).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020ff914-0x020ff918.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020ff914[4] = "MAT";
