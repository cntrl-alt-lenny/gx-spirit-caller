/* data_02100590 (8 bytes, 4-aligned): GameSpy-style key/value protocol
 * token.
 * "\\user\\" (6 chars + NUL, zero-padded to 8 bytes (automatic from array
 * size > literal length)).
 * Reader(s): func_0205938c (relocs.txt from:0x02059710 kind:load
 * to:0x02100590).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100590-0x02100598.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100590[8] = "\\user\\";
