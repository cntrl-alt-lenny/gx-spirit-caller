/* data_021008f4 (8 bytes, 4-aligned): GameSpy-style key/value protocol
 * token.
 * "\\mar\\" (5 chars + NUL, zero-padded to 8 bytes (automatic from array
 * size > literal length)).
 * Reader(s): func_0205a18c (relocs.txt from:0x0205a964 kind:load
 * to:0x021008f4); func_0205a974 (relocs.txt from:0x0205ae3c kind:load
 * to:0x021008f4); func_0205af90 (relocs.txt from:0x0205b78c kind:load
 * to:0x021008f4).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x021008f4-0x021008fc.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_021008f4[8] = "\\mar\\";
