/* data_020fff90 (16 bytes, 4-aligned): GameSpy-style key/value protocol
 * token.
 * "\\delprofileid\\" (14 chars + NUL, zero-padded to 16 bytes (automatic
 * from array size > literal length)).
 * Reader(s): func_02056884 (relocs.txt from:0x02056a18 kind:load
 * to:0x020fff90).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020fff90-0x020fffa0.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020fff90[16] = "\\delprofileid\\";
