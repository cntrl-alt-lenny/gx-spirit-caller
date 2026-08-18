/* data_020ffad0 (8 bytes, 4-aligned): OS_SPrintf-style format string.
 * "%012llu" (7 chars + NUL).
 * Reader(s): func_02053488 (relocs.txt from:0x020534b0 kind:load
 * to:0x020ffad0).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020ffad0-0x020ffad8.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020ffad0[8] = "%012llu";
