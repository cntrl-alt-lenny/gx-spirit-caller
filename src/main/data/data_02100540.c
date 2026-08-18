/* data_02100540 (12 bytes, 4-aligned): GameSpy-style key/value protocol
 * token.
 * "\\productid\\" (11 chars + NUL).
 * Reader(s): func_020590f0 (relocs.txt from:0x02059364 kind:load
 * to:0x02100540); func_0205938c (relocs.txt from:0x0205972c kind:load
 * to:0x02100540).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100540-0x0210054c.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100540[12] = "\\productid\\";
