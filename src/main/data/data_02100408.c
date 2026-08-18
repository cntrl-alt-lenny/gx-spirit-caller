/* data_02100408 (12 bytes, 4-aligned): GameSpy-style key/value protocol
 * token.
 * "\\challenge\\" (11 chars + NUL).
 * Reader(s): func_02058a08 (relocs.txt from:0x020590ac kind:load
 * to:0x02100408); func_0205938c (relocs.txt from:0x02059704 kind:load
 * to:0x02100408).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100408-0x02100414.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100408[12] = "\\challenge\\";
