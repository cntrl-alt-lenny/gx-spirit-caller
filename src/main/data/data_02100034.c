/* data_02100034 (8 bytes, 4-aligned): GameSpy-style key/value protocol
 * token.
 * "\\date\\" (6 chars + NUL, zero-padded to 8 bytes (automatic from array
 * size > literal length)).
 * Reader(s): func_02056d1c (relocs.txt from:0x020576fc kind:load
 * to:0x02100034).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100034-0x0210003c.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100034[8] = "\\date\\";
