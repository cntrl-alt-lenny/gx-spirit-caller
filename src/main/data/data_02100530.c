/* data_02100530 (16 bytes, 4-aligned): GameSpy-style key/value protocol
 * token.
 * "\\passwordenc\\" (13 chars + NUL, zero-padded to 16 bytes (automatic
 * from array size > literal length)).
 * Reader(s): func_020590f0 (relocs.txt from:0x02059360 kind:load
 * to:0x02100530).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100530-0x02100540.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100530[16] = "\\passwordenc\\";
