/* data_020fffec (8 bytes, 4-aligned): GameSpy-style key/value protocol
 * token.
 * "\\bm\\" (4 chars + NUL, zero-padded to 8 bytes (automatic from array
 * size > literal length)).
 * Reader(s): func_02056c34 (relocs.txt from:0x02056d08 kind:load
 * to:0x020fffec); func_02056d1c (relocs.txt from:0x020576f0 kind:load
 * to:0x020fffec).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020fffec-0x020ffff4.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020fffec[8] = "\\bm\\";
