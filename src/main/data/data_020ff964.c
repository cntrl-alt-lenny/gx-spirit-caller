/* data_020ff964 (4 bytes, 4-aligned): string constant.
 * "SCN" (3 chars + NUL).
 * Reader(s): func_020497a8 (relocs.txt from:0x020498c0 kind:load
 * to:0x020ff964).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020ff964-0x020ff968.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020ff964[4] = "SCN";
