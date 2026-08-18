/* data_02100520 (8 bytes, 4-aligned): GameSpy-style key/value protocol
 * token.
 * "\\email\\" (7 chars + NUL).
 * Reader(s): func_020590f0 (relocs.txt from:0x02059358 kind:load
 * to:0x02100520).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100520-0x02100528.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100520[8] = "\\email\\";
