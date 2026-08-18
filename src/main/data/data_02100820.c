/* data_02100820 (12 bytes, 4-aligned): GameSpy-style key/value protocol
 * token.
 * "\\firstname\\" (11 chars + NUL).
 * Reader(s): func_0205a18c (relocs.txt from:0x0205a900 kind:load
 * to:0x02100820); func_0205af90 (relocs.txt from:0x0205b740 kind:load
 * to:0x02100820).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100820-0x0210082c.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100820[12] = "\\firstname\\";
