/* data_020ffff4 (4 bytes, 4-aligned): GameSpy-style key/value protocol
 * token.
 * "\\t\\" (3 chars + NUL).
 * Reader(s): func_02056c34 (relocs.txt from:0x02056d10 kind:load
 * to:0x020ffff4).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020ffff4-0x020ffff8.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020ffff4[4] = "\\t\\";
