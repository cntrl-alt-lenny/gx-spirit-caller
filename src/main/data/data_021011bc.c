/* data_021011bc (8 bytes, 4-aligned): GameSpy-style key/value protocol
 * token.
 * "\\xfer\\" (6 chars + NUL, zero-padded to 8 bytes (automatic from array
 * size > literal length)).
 * Reader(s): func_0205fd94 (relocs.txt from:0x0205fe10 kind:load
 * to:0x021011bc).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x021011bc-0x021011c4.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_021011bc[8] = "\\xfer\\";
