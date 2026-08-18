/* data_020ff9cc (4 bytes, 4-aligned): string constant.
 * "FME" (3 chars + NUL).
 * Reader(s): func_0204cf7c (relocs.txt from:0x0204d27c kind:load
 * to:0x020ff9cc).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020ff9cc-0x020ff9d0.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020ff9cc[4] = "FME";
