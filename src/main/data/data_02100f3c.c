/* data_02100f3c (8 bytes, 4-aligned): GameSpy-style key/value protocol
 * token.
 * "\\check\\" (7 chars + NUL).
 * Reader(s): func_0205dba4 (relocs.txt from:0x0205ead8 kind:load
 * to:0x02100f3c).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100f3c-0x02100f44.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100f3c[8] = "\\check\\";
