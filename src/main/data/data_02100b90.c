/* data_02100b90 (20 bytes, 4-aligned): OS_SPrintf-style format string.
 * "\\m\\%d\\xfer\\%d %u %u" (19 chars + NUL).
 * Reader(s): func_0205c340 (relocs.txt from:0x0205c3bc kind:load
 * to:0x02100b90).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100b90-0x02100ba4.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100b90[20] = "\\m\\%d\\xfer\\%d %u %u";
