/* data_021007b4 (8 bytes, 4-aligned): GameSpy-style key/value protocol
 * token.
 * "\\id\\" (4 chars + NUL, zero-padded to 8 bytes (automatic from array
 * size > literal length)).
 * Reader(s): func_0205a0ec (relocs.txt from:0x0205a184 kind:load
 * to:0x021007b4).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x021007b4-0x021007bc.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_021007b4[8] = "\\id\\";
