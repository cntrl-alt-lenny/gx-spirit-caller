/* data_021003c0 (8 bytes, 4-aligned): GameSpy-style key/value protocol
 * token.
 * "\\pid\\" (5 chars + NUL, zero-padded to 8 bytes (automatic from array
 * size > literal length)).
 * Reader(s): func_02058a08 (relocs.txt from:0x0205909c kind:load
 * to:0x021003c0).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x021003c0-0x021003c8.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_021003c0[8] = "\\pid\\";
