/* data_021000ac (4 bytes, 4-aligned): GameSpy-style key/value protocol
 * token.
 * "\\m\\" (3 chars + NUL).
 * Reader(s): func_02057844 (relocs.txt from:0x02057978 kind:load
 * to:0x021000ac).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x021000ac-0x021000b0.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_021000ac[4] = "\\m\\";
