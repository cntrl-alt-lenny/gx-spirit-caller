/* data_02100a3c (8 bytes, 4-aligned): GameSpy-style key/value protocol
 * token.
 * "\\loc\\" (5 chars + NUL, zero-padded to 8 bytes (automatic from array
 * size > literal length)).
 * Reader(s): func_0205af90 (relocs.txt from:0x0205b760 kind:load
 * to:0x02100a3c).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100a3c-0x02100a44.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100a3c[8] = "\\loc\\";
