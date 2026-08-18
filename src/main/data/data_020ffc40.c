/* data_020ffc40 (12 bytes, 4-aligned): GameSpy-style key/value protocol
 * token.
 * "\\sesskey\\" (9 chars + NUL, zero-padded to 12 bytes (automatic from
 * array size > literal length)).
 * Reader(s): func_02055420 (relocs.txt from:0x02055644 kind:load
 * to:0x020ffc40); func_02055a84 (relocs.txt from:0x02055bf4 kind:load
 * to:0x020ffc40).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020ffc40-0x020ffc4c.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020ffc40[12] = "\\sesskey\\";
