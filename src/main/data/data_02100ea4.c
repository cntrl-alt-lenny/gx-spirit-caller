/* data_02100ea4 (12 bytes, 4-aligned): GameSpy-style key/value protocol
 * token.
 * "\\profileid\\" (11 chars + NUL).
 * Reader(s): func_0205dba4 (relocs.txt from:0x0205eaa0 kind:load
 * to:0x02100ea4).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100ea4-0x02100eb0.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100ea4[12] = "\\profileid\\";
