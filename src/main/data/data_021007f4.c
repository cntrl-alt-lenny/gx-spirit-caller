/* data_021007f4 (8 bytes, 4-aligned): GameSpy-style key/value protocol
 * token.
 * "\\nick\\" (6 chars + NUL, zero-padded to 8 bytes (automatic from array
 * size > literal length)).
 * Reader(s): func_0205a18c (relocs.txt from:0x0205a8e8 kind:load
 * to:0x021007f4); func_0205af90 (relocs.txt from:0x0205b734 kind:load
 * to:0x021007f4).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x021007f4-0x021007fc.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_021007f4[8] = "\\nick\\";
