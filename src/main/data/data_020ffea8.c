/* data_020ffea8 (8 bytes, 4-aligned): GameSpy-style key/value protocol
 * token.
 * "\\id\\" (4 chars + NUL, zero-padded to 8 bytes (automatic from array
 * size > literal length)).
 * Reader(s): func_02056264 (relocs.txt from:0x0205657c kind:load
 * to:0x020ffea8).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020ffea8-0x020ffeb0.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020ffea8[8] = "\\id\\";
