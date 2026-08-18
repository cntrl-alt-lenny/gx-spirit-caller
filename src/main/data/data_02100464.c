/* data_02100464 (8 bytes, 4-aligned): GameSpy-style key/value protocol
 * token.
 * "\\lc\\2" (5 chars + NUL, zero-padded to 8 bytes (automatic from array
 * size > literal length)).
 * Reader(s): func_02058a08 (relocs.txt from:0x020590c0 kind:load
 * to:0x02100464).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100464-0x0210046c.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100464[8] = "\\lc\\2";
