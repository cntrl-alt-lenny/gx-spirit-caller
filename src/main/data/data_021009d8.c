/* data_021009d8 (8 bytes, 4-aligned): GameSpy-style key/value protocol
 * token.
 * "\\pi\\" (4 chars + NUL, zero-padded to 8 bytes (automatic from array
 * size > literal length)).
 * Reader(s): func_0205af90 (relocs.txt from:0x0205b71c kind:load
 * to:0x021009d8).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x021009d8-0x021009e0.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_021009d8[8] = "\\pi\\";
