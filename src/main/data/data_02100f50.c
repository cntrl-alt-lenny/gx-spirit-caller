/* data_02100f50 (12 bytes, 4-aligned): GameSpy-style key/value protocol
 * token.
 * "\\productID\\" (11 chars + NUL).
 * Reader(s): func_0205dba4 (relocs.txt from:0x0205eae0 kind:load
 * to:0x02100f50).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100f50-0x02100f5c.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100f50[12] = "\\productID\\";
