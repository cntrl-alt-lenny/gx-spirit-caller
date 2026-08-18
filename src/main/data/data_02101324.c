/* data_02101324 (12 bytes, 4-aligned): GameSpy-style key/value protocol
 * token.
 * "\\errmsg\\" (8 chars + NUL, zero-padded to 12 bytes (automatic from
 * array size > literal length)).
 * Reader(s): func_020603cc (relocs.txt from:0x0206049c kind:load
 * to:0x02101324).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02101324-0x02101330.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02101324[12] = "\\errmsg\\";
