/* data_021012cc (24 bytes, 4-aligned): string constant.
 * "Connection rejected\n" (20 chars + NUL, zero-padded to 24 bytes
 * (automatic from array size > literal length)).
 * Reader(s): func_020601d0 (relocs.txt from:0x020602bc kind:load
 * to:0x021012cc).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x021012cc-0x021012e4.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_021012cc[24] = "Connection rejected\n";
