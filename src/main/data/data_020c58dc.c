/* data_020c58dc (20 bytes, 4-aligned): OS_SPrintf-style format string.
 * "%d:%02d:%s \"%s\" " (16 chars + NUL, zero-padded to 20 bytes (automatic
 * from array size > literal length)).
 * Reader(s): func_02012cc8 (relocs.txt from:0x02013860 kind:load
 * to:0x020c58dc).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020c58dc-0x020c58f0.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020c58dc[20] = "%d:%02d:%s \"%s\" ";
