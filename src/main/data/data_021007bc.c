/* data_021007bc (8 bytes, 4-aligned): GameSpy-style key/value protocol
 * token.
 * "\\final\\" (7 chars + NUL).
 * Reader(s): func_0205a0ec (relocs.txt from:0x0205a188 kind:load
 * to:0x021007bc); func_0205aecc (relocs.txt from:0x0205af88 kind:load
 * to:0x021007bc).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x021007bc-0x021007c4.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_021007bc[8] = "\\final\\";
