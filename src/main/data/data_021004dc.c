/* data_021004dc (8 bytes, 4-aligned): GameSpy-style key/value protocol
 * token.
 * "\\proof\\" (7 chars + NUL).
 * Reader(s): func_02058a08 (relocs.txt from:0x020590e4 kind:load
 * to:0x021004dc).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x021004dc-0x021004e4.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_021004dc[8] = "\\proof\\";
