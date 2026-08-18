/* data_02100458 (12 bytes, 4-aligned): GameSpy-style key/value protocol
 * token.
 * "\\profileid\\" (11 chars + NUL).
 * Reader(s): func_02058a08 (relocs.txt from:0x020590bc kind:load
 * to:0x02100458); func_0205938c (relocs.txt from:0x0205971c kind:load
 * to:0x02100458).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100458-0x02100464.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100458[12] = "\\profileid\\";
