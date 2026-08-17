/* data_021011c4 (12 bytes, 4-aligned): OS_SPrintf-style format string.
 * "%d %u %u" (8 chars + NUL, zero-padded to 12 bytes (automatic from array
 * size > literal length)).
 * Reader(s): func_0205fd94 (relocs.txt from:0x0205fe14 kind:load
 * to:0x021011c4).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x021011c4-0x021011d0.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_021011c4[12] = "%d %u %u";
