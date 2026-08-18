/* data_021009ac (24 bytes, 4-aligned): GameSpy-style key/value protocol
 * token.
 * "\\updatepro\\\\sesskey\\" (20 chars + NUL, zero-padded to 24 bytes
 * (automatic from array size > literal length)).
 * Reader(s): func_0205aecc (relocs.txt from:0x0205af84 kind:load
 * to:0x021009ac).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x021009ac-0x021009c4.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_021009ac[24] = "\\updatepro\\\\sesskey\\";
