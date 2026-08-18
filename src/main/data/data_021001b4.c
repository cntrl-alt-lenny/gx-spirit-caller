/* data_021001b4 (20 bytes, 4-aligned): OS_SPrintf-style format string.
 * "RECVTOTL(%s): %d\n" (17 chars + NUL, zero-padded to 20 bytes (automatic
 * from array size > literal length)).
 * Reader(s): func_02057b00 (relocs.txt from:0x02057d28 kind:load
 * to:0x021001b4).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x021001b4-0x021001c8.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_021001b4[20] = "RECVTOTL(%s): %d\n";
