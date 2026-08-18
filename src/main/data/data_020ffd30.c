/* data_020ffd30 (12 bytes, 4-aligned): GameSpy-style key/value protocol
 * token.
 * "\\reason\\" (8 chars + NUL, zero-padded to 12 bytes (automatic from
 * array size > literal length)).
 * Reader(s): func_02055a84 (relocs.txt from:0x02055bfc kind:load
 * to:0x020ffd30).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020ffd30-0x020ffd3c.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020ffd30[12] = "\\reason\\";
