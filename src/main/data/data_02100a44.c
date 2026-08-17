/* data_02100a44 (8 bytes, 4-aligned): GameSpy-style key/value protocol
 * token.
 * "\\pmask\\" (7 chars + NUL).
 * Reader(s): func_0205af90 (relocs.txt from:0x0205b774 kind:load
 * to:0x02100a44).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100a44-0x02100a4c.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100a44[8] = "\\pmask\\";
