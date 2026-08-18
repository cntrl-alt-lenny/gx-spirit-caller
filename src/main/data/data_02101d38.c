/* data_02101d38 (12 bytes, 4-aligned): GameSpy-style key/value protocol
 * token.
 * "\\status\\" (8 chars + NUL, zero-padded to 12 bytes (automatic from
 * array size > literal length)).
 * Reader(s): func_02068194 (relocs.txt from:0x02068364 kind:load
 * to:0x02101d38).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02101d38-0x02101d44.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02101d38[12] = "\\status\\";
