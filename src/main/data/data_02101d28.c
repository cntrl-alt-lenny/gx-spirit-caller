/* data_02101d28 (16 bytes, 4-aligned): GameSpy-style key/value protocol
 * token.
 * "\\basic\\\\info\\" (13 chars + NUL, zero-padded to 16 bytes (automatic
 * from array size > literal length)).
 * Reader(s): func_02068194 (relocs.txt from:0x02068360 kind:load
 * to:0x02101d28).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02101d28-0x02101d38.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02101d28[16] = "\\basic\\\\info\\";
