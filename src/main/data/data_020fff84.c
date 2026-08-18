/* data_020fff84 (12 bytes, 4-aligned): GameSpy-style key/value protocol
 * token.
 * "\\sesskey\\" (9 chars + NUL, zero-padded to 12 bytes (automatic from
 * array size > literal length)).
 * Reader(s): func_02056884 (relocs.txt from:0x02056a14 kind:load
 * to:0x020fff84); func_02056c34 (relocs.txt from:0x02056d0c kind:load
 * to:0x020fff84); func_02057730 (relocs.txt from:0x020577c8 kind:load
 * to:0x020fff84).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020fff84-0x020fff90.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020fff84[12] = "\\sesskey\\";
