/* data_020ffc90 (24 bytes, 4-aligned): string constant.
 * "Invalid locationString." (23 chars + NUL).
 * Reader(s): func_02055420 (relocs.txt from:0x0205563c kind:load
 * to:0x020ffc90).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020ffc90-0x020ffca8.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020ffc90[24] = "Invalid locationString.";
