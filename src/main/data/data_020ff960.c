/* data_020ff960 (4 bytes, 4-aligned): string constant.
 * "SCM" (3 chars + NUL).
 * Reader(s): func_020497a8 (relocs.txt from:0x020498bc kind:load
 * to:0x020ff960).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020ff960-0x020ff964.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020ff960[4] = "SCM";
