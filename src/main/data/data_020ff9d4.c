/* data_020ff9d4 (8 bytes, 4-aligned): OS_SPrintf-style format string.
 * "%s%dv%s" (7 chars + NUL).
 * Reader(s): func_0204e914 (relocs.txt from:0x0204e9b0 kind:load
 * to:0x020ff9d4).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020ff9d4-0x020ff9dc.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020ff9d4[8] = "%s%dv%s";
