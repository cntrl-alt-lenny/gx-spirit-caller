/* data_02101330 (8 bytes, 4-aligned): GameSpy-style key/value protocol
 * token.
 * "\\fatal\\" (7 chars + NUL).
 * Reader(s): func_020603cc (relocs.txt from:0x020604a0 kind:load
 * to:0x02101330).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02101330-0x02101338.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02101330[8] = "\\fatal\\";
