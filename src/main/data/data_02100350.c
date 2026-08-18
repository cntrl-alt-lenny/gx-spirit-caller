/* data_02100350 (20 bytes, 4-aligned): GameSpy-style key/value protocol
 * token.
 * "\\logout\\\\sesskey\\" (17 chars + NUL, zero-padded to 20 bytes
 * (automatic from array size > literal length)).
 * Reader(s): func_020586c8 (relocs.txt from:0x0205887c kind:load
 * to:0x02100350).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100350-0x02100364.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100350[20] = "\\logout\\\\sesskey\\";
