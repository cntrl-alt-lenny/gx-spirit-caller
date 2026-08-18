/* data_0210057c (8 bytes, 4-aligned): GameSpy-style key/value protocol
 * token.
 * "\\login\\" (7 chars + NUL).
 * Reader(s): func_0205938c (relocs.txt from:0x02059700 kind:load
 * to:0x0210057c).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x0210057c-0x02100584.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_0210057c[8] = "\\login\\";
