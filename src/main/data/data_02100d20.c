/* data_02100d20 (8 bytes, 4-aligned): GameSpy-style key/value protocol
 * token.
 * "\\anack\\" (7 chars + NUL).
 * Reader(s): func_0205cf10 (relocs.txt from:0x0205d154 kind:load
 * to:0x02100d20); func_0205d15c (relocs.txt from:0x0205d4a8 kind:load
 * to:0x02100d20).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100d20-0x02100d28.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100d20[8] = "\\anack\\";
