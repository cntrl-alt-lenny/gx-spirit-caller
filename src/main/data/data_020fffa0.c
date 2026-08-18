/* data_020fffa0 (8 bytes, 4-aligned): GameSpy-style key/value protocol
 * token.
 * "\\final\\" (7 chars + NUL).
 * Reader(s): func_02056884 (relocs.txt from:0x02056a1c kind:load
 * to:0x020fffa0); func_02056c34 (relocs.txt from:0x02056d18 kind:load
 * to:0x020fffa0); func_02057730 (relocs.txt from:0x020577d4 kind:load
 * to:0x020fffa0).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020fffa0-0x020fffa8.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020fffa0[8] = "\\final\\";
