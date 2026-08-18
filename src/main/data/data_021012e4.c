/* data_021012e4 (24 bytes, 4-aligned): string constant.
 * "Connection accepted\n" (20 chars + NUL, zero-padded to 24 bytes
 * (automatic from array size > literal length)).
 * Reader(s): func_020601d0 (relocs.txt from:0x020602c0 kind:load
 * to:0x021012e4).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x021012e4-0x021012fc.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_021012e4[24] = "Connection accepted\n";
