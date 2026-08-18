/* data_021008c0 (12 bytes, 4-aligned): GameSpy-style key/value protocol
 * token.
 * "\\osstring\\" (10 chars + NUL, zero-padded to 12 bytes (automatic from
 * array size > literal length)).
 * Reader(s): func_0205a18c (relocs.txt from:0x0205a94c kind:load
 * to:0x021008c0).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x021008c0-0x021008cc.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_021008c0[12] = "\\osstring\\";
