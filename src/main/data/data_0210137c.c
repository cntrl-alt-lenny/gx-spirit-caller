/* data_0210137c (12 bytes, 4-aligned): GameSpy-style key/value protocol
 * token.
 * "\\pauthr\\" (8 chars + NUL, zero-padded to 12 bytes (automatic from
 * array size > literal length)).
 * Reader(s): func_020607b0 (relocs.txt from:0x020608a4 kind:load
 * to:0x0210137c).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x0210137c-0x02101388.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_0210137c[12] = "\\pauthr\\";
