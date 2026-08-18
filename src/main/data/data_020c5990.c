/* data_020c5990 (4 bytes, 4-aligned): string constant.
 * "OFF" (3 chars + NUL).
 * Reader(s): func_02012cc8 (relocs.txt from:0x020138a4 kind:load
 * to:0x020c5990).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020c5990-0x020c5994.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020c5990[4] = "OFF";
