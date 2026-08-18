/* data_020ffcc4 (12 bytes, 4-aligned): GameSpy-style key/value protocol
 * token.
 * "\\locstring\\" (11 chars + NUL).
 * Reader(s): func_02055420 (relocs.txt from:0x0205564c kind:load
 * to:0x020ffcc4).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020ffcc4-0x020ffcd0.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020ffcc4[12] = "\\locstring\\";
