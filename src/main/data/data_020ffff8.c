/* data_020ffff8 (8 bytes, 4-aligned): GameSpy-style key/value protocol
 * token.
 * "\\msg\\" (5 chars + NUL, zero-padded to 8 bytes (automatic from array
 * size > literal length)).
 * Reader(s): func_02056c34 (relocs.txt from:0x02056d14 kind:load
 * to:0x020ffff8); func_02056d1c (relocs.txt from:0x02057704 kind:load
 * to:0x020ffff8).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020ffff8-0x02100000.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020ffff8[8] = "\\msg\\";
