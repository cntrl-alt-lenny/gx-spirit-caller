/* data_021016f4 (12 bytes, 4-aligned): OS_SPrintf-style format string.
 * "localip%d" (9 chars + NUL, zero-padded to 12 bytes (automatic from array
 * size > literal length)).
 * Reader(s): func_02066010 (relocs.txt from:0x020661fc kind:load
 * to:0x021016f4).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x021016f4-0x02101700.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_021016f4[12] = "localip%d";
