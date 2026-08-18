/* data_020ffa50 (8 bytes, 4-aligned): OS_SPrintf-style format string.
 * "%s = %u" (7 chars + NUL).
 * Reader(s): func_0204f0a8 (relocs.txt from:0x0204f278 kind:load
 * to:0x020ffa50).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020ffa50-0x020ffa58.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020ffa50[8] = "%s = %u";
