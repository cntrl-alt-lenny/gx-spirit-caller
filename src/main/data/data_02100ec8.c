/* data_02100ec8 (16 bytes, 4-aligned): GameSpy-style key/value protocol
 * token.
 * "\\uniquenick\\" (12 chars + NUL, zero-padded to 16 bytes (automatic from
 * array size > literal length)).
 * Reader(s): func_0205dba4 (relocs.txt from:0x0205eaac kind:load
 * to:0x02100ec8).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100ec8-0x02100ed8.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100ec8[16] = "\\uniquenick\\";
