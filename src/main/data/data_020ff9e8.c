/* data_020ff9e8 (4 bytes, 4-aligned): OS_SPrintf-style format string.
 * "/%u" (3 chars + NUL).
 * Reader(s): func_0204ead0 (relocs.txt from:0x0204ec8c kind:load
 * to:0x020ff9e8).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020ff9e8-0x020ff9ec.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020ff9e8[4] = "/%u";
