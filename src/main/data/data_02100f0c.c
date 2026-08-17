/* data_02100f0c (8 bytes, 4-aligned): GameSpy-style key/value protocol
 * token.
 * "\\valid\\" (7 chars + NUL).
 * Reader(s): func_0205dba4 (relocs.txt from:0x0205eac4 kind:load
 * to:0x02100f0c).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100f0c-0x02100f14.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100f0c[8] = "\\valid\\";
