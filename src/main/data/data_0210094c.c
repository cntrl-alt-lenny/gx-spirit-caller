/* data_0210094c (12 bytes, 4-aligned): GameSpy-style key/value protocol
 * token.
 * "\\memory\\" (8 chars + NUL, zero-padded to 12 bytes (automatic from
 * array size > literal length)).
 * Reader(s): func_0205a974 (relocs.txt from:0x0205ae14 kind:load
 * to:0x0210094c).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x0210094c-0x02100958.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_0210094c[12] = "\\memory\\";
