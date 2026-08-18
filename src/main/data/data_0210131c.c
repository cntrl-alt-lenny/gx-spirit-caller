/* data_0210131c (8 bytes, 4-aligned): GameSpy-style key/value protocol
 * token.
 * "\\err\\" (5 chars + NUL, zero-padded to 8 bytes (automatic from array
 * size > literal length)).
 * Reader(s): func_020603cc (relocs.txt from:0x02060498 kind:load
 * to:0x0210131c).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x0210131c-0x02101324.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_0210131c[8] = "\\err\\";
