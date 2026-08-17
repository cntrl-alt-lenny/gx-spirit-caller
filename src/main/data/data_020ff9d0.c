/* data_020ff9d0 (4 bytes, 4-aligned): string constant.
 * "MDF" (3 chars + NUL).
 * Reader(s): func_0204cf7c (relocs.txt from:0x0204d280 kind:load
 * to:0x020ff9d0).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020ff9d0-0x020ff9d4.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020ff9d0[4] = "MDF";
