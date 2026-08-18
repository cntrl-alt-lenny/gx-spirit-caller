/* data_02100514 (12 bytes, 4-aligned): GameSpy-style key/value protocol
 * token.
 * "\\newuser\\" (9 chars + NUL, zero-padded to 12 bytes (automatic from
 * array size > literal length)).
 * Reader(s): func_020590f0 (relocs.txt from:0x02059354 kind:load
 * to:0x02100514).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100514-0x02100520.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100514[12] = "\\newuser\\";
