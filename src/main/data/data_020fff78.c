/* data_020fff78 (12 bytes, 4-aligned): GameSpy-style key/value protocol
 * token.
 * "\\delbuddy\\" (10 chars + NUL, zero-padded to 12 bytes (automatic from
 * array size > literal length)).
 * Reader(s): func_02056884 (relocs.txt from:0x02056a10 kind:load
 * to:0x020fff78).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020fff78-0x020fff84.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020fff78[12] = "\\delbuddy\\";
