/* data_021000a4 (8 bytes, 4-aligned): GameSpy-style key/value protocol
 * token.
 * "\\msg\\" (5 chars + NUL, zero-padded to 8 bytes (automatic from array
 * size > literal length)).
 * Reader(s): func_02057844 (relocs.txt from:0x02057974 kind:load
 * to:0x021000a4).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x021000a4-0x021000ac.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_021000a4[8] = "\\msg\\";
