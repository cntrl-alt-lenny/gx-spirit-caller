/* data_02100d8c (8 bytes, 4-aligned): GameSpy-style key/value protocol
 * token.
 * "\\npr\\" (5 chars + NUL, zero-padded to 8 bytes (automatic from array
 * size > literal length)).
 * Reader(s): func_0205d7e4 (relocs.txt from:0x0205d934 kind:load
 * to:0x02100d8c).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100d8c-0x02100d94.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100d8c[8] = "\\npr\\";
