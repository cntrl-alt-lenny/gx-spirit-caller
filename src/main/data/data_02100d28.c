/* data_02100d28 (8 bytes, 4-aligned): GameSpy-style key/value protocol
 * token.
 * "\\aack\\" (6 chars + NUL, zero-padded to 8 bytes (automatic from array
 * size > literal length)).
 * Reader(s): func_0205cf10 (relocs.txt from:0x0205d158 kind:load
 * to:0x02100d28); func_0205d15c (relocs.txt from:0x0205d4b0 kind:load
 * to:0x02100d28).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100d28-0x02100d30.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100d28[8] = "\\aack\\";
