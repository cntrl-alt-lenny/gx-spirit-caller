/* data_021007a8 (12 bytes, 4-aligned): GameSpy-style key/value protocol
 * token.
 * "\\profileid\\" (11 chars + NUL).
 * Reader(s): func_0205a0ec (relocs.txt from:0x0205a180 kind:load
 * to:0x021007a8); func_0205af90 (relocs.txt from:0x0205b724 kind:load
 * to:0x021007a8).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x021007a8-0x021007b4.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_021007a8[12] = "\\profileid\\";
