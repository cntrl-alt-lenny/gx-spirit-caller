/* data_02100584 (12 bytes, 4-aligned): GameSpy-style key/value protocol
 * token.
 * "\\authtoken\\" (11 chars + NUL).
 * Reader(s): func_0205938c (relocs.txt from:0x02059708 kind:load
 * to:0x02100584).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100584-0x02100590.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100584[12] = "\\authtoken\\";
