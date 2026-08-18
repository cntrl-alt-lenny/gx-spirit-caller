/* data_02100898 (20 bytes, 4-aligned): GameSpy-style key/value protocol
 * token.
 * "\\videocard1string\\" (18 chars + NUL, zero-padded to 20 bytes
 * (automatic from array size > literal length)).
 * Reader(s): func_0205a18c (relocs.txt from:0x0205a938 kind:load
 * to:0x02100898).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100898-0x021008ac.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100898[20] = "\\videocard1string\\";
