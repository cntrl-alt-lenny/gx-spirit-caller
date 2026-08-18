/* data_020c67dc (28 bytes, 4-aligned): OS_SPrintf-style format string.
 * "channel %d bratio = 0x%x\n" (25 chars + NUL, zero-padded to 28 bytes
 * (automatic from array size > literal length)).
 * Reader(s): func_020205ec (relocs.txt from:0x020206b4 kind:load
 * to:0x020c67dc).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020c67dc-0x020c67f8.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020c67dc[28] = "channel %d bratio = 0x%x\n";
