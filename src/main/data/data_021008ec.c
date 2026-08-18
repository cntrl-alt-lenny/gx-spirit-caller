/* data_021008ec (8 bytes, 4-aligned): GameSpy-style key/value protocol
 * token.
 * "\\inc\\" (5 chars + NUL, zero-padded to 8 bytes (automatic from array
 * size > literal length)).
 * Reader(s): func_0205a18c (relocs.txt from:0x0205a960 kind:load
 * to:0x021008ec); func_0205a974 (relocs.txt from:0x0205ae38 kind:load
 * to:0x021008ec); func_0205af90 (relocs.txt from:0x0205b788 kind:load
 * to:0x021008ec).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x021008ec-0x021008f4.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_021008ec[8] = "\\inc\\";
