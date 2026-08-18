/* data_0210099c (16 bytes, 4-aligned): GameSpy-style key/value protocol
 * token.
 * "\\hasnetwork\\" (12 chars + NUL, zero-padded to 16 bytes (automatic from
 * array size > literal length)).
 * Reader(s): func_0205a974 (relocs.txt from:0x0205ae28 kind:load
 * to:0x0210099c).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x0210099c-0x021009ac.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_0210099c[16] = "\\hasnetwork\\";
