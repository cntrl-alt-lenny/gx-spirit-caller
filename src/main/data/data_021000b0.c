/* data_021000b0 (8 bytes, 4-aligned): GameSpy-style key/value protocol
 * token.
 * "\\len\\" (5 chars + NUL, zero-padded to 8 bytes (automatic from array
 * size > literal length)).
 * Reader(s): func_02057844 (relocs.txt from:0x0205797c kind:load
 * to:0x021000b0).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x021000b0-0x021000b8.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_021000b0[8] = "\\len\\";
