/* data_020c6d64 (8 bytes, 4-aligned): OS_SPrintf-style format string.
 * "DEF/%4d" (7 chars + NUL).
 * Reader(s): func_0202d558 (relocs.txt from:0x0202d990 kind:load
 * to:0x020c6d64).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020c6d64-0x020c6d6c.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020c6d64[8] = "DEF/%4d";
