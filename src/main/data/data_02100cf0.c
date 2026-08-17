/* data_02100cf0 (8 bytes, 4-aligned): GameSpy-style key/value protocol
 * token.
 * "\\final\\" (7 chars + NUL).
 * Reader(s): func_0205cf10 (relocs.txt from:0x0205d138 kind:load
 * to:0x02100cf0); func_0205d15c (relocs.txt from:0x0205d4a0 kind:load
 * to:0x02100cf0).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100cf0-0x02100cf8.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100cf0[8] = "\\final\\";
