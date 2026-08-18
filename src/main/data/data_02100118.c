/* data_02100118 (20 bytes, 4-aligned): string constant.
 * "inputBuffer != NULL" (19 chars + NUL).
 * Reader(s): func_02057b00 (relocs.txt from:0x02057d04 kind:load
 * to:0x02100118).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100118-0x0210012c.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100118[20] = "inputBuffer != NULL";
