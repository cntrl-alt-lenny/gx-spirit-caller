/* data_02100d18 (8 bytes, 4-aligned): OS_SPrintf-style format string.
 * "%s%d%d" (6 chars + NUL, zero-padded to 8 bytes (automatic from array
 * size > literal length)).
 * Reader(s): func_0205cf10 (relocs.txt from:0x0205d150 kind:load
 * to:0x02100d18).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100d18-0x02100d20.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100d18[8] = "%s%d%d";
