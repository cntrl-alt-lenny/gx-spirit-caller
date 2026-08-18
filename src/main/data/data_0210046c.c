/* data_0210046c (12 bytes, 4-aligned): GameSpy-style key/value protocol
 * token.
 * "\\sesskey\\" (9 chars + NUL, zero-padded to 12 bytes (automatic from
 * array size > literal length)).
 * Reader(s): func_02058a08 (relocs.txt from:0x020590c4 kind:load
 * to:0x0210046c).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x0210046c-0x02100478.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_0210046c[12] = "\\sesskey\\";
