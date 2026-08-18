/* data_020c5ce4 (16 bytes, 4-aligned): string constant.
 * "SYSMSG_GOHOME" (13 chars + NUL, zero-padded to 16 bytes (automatic from
 * array size > literal length)).
 * Reader(s): func_0201bba4 (relocs.txt from:0x0201bbc4 kind:load
 * to:0x020c5ce4).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020c5ce4-0x020c5cf4.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020c5ce4[16] = "SYSMSG_GOHOME";
