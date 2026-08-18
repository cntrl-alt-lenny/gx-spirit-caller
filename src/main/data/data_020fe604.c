/* data_020fe604 (8 bytes, 4-aligned): string constant.
 * "locator" (7 chars + NUL).
 * Reader(s): func_0203f968 (relocs.txt from:0x0203fc50 kind:load
 * to:0x020fe604).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020fe604-0x020fe60c.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020fe604[8] = "locator";
