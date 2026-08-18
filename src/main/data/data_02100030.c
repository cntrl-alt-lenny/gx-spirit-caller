/* data_02100030 (4 bytes, 4-aligned): GameSpy-style key/value protocol
 * token.
 * "\\f\\" (3 chars + NUL).
 * Reader(s): func_02056d1c (relocs.txt from:0x020576f8 kind:load
 * to:0x02100030).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100030-0x02100034.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100030[4] = "\\f\\";
