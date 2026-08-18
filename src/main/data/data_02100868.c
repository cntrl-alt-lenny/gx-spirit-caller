/* data_02100868 (16 bytes, 4-aligned): GameSpy-style key/value protocol
 * token.
 * "\\countrycode\\" (13 chars + NUL, zero-padded to 16 bytes (automatic
 * from array size > literal length)).
 * Reader(s): func_0205a18c (relocs.txt from:0x0205a914 kind:load
 * to:0x02100868); func_0205af90 (relocs.txt from:0x0205b754 kind:load
 * to:0x02100868).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100868-0x02100878.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100868[16] = "\\countrycode\\";
