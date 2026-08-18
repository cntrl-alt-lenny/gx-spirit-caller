/* data_020ffa44 (12 bytes, 4-aligned): OS_SPrintf-style format string.
 * "%s and (%s)" (11 chars + NUL).
 * Reader(s): func_0204f0a8 (relocs.txt from:0x0204f274 kind:load
 * to:0x020ffa44).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020ffa44-0x020ffa50.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020ffa44[12] = "%s and (%s)";
