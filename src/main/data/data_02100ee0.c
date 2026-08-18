/* data_02100ee0 (12 bytes, 4-aligned): GameSpy-style key/value protocol
 * token.
 * "\\firstname\\" (11 chars + NUL).
 * Reader(s): func_0205dba4 (relocs.txt from:0x0205eab4 kind:load
 * to:0x02100ee0).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100ee0-0x02100eec.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100ee0[12] = "\\firstname\\";
