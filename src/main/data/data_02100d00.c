/* data_02100d00 (8 bytes, 4-aligned): GameSpy-style key/value protocol
 * token.
 * "\\pid\\" (5 chars + NUL, zero-padded to 8 bytes (automatic from array
 * size > literal length)).
 * Reader(s): func_0205cf10 (relocs.txt from:0x0205d140 kind:load
 * to:0x02100d00); func_0205d15c (relocs.txt from:0x0205d494 kind:load
 * to:0x02100d00).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100d00-0x02100d08.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100d00[8] = "\\pid\\";
