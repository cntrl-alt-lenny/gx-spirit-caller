/* data_02100414 (8 bytes, 4-aligned): GameSpy-style key/value protocol
 * token.
 * "\\nur\\" (5 chars + NUL, zero-padded to 8 bytes (automatic from array
 * size > literal length)).
 * Reader(s): func_02058a08 (relocs.txt from:0x020590b0 kind:load
 * to:0x02100414).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100414-0x0210041c.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100414[8] = "\\nur\\";
