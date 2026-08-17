/* data_02101d80 (4 bytes, 4-aligned): OS_SPrintf-style format string.
 * "\\%s" (3 chars + NUL).
 * Reader(s): func_02068e24 (relocs.txt from:0x02068f50 kind:load
 * to:0x02101d80).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02101d80-0x02101d84.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02101d80[4] = "\\%s";
