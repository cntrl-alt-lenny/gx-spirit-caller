/* data_020ffc4c (8 bytes, 4-aligned): GameSpy-style key/value protocol
 * token.
 * "\\final\\" (7 chars + NUL).
 * Reader(s): func_02055420 (relocs.txt from:0x02055650 kind:load
 * to:0x020ffc4c); func_02055a84 (relocs.txt from:0x02055c00 kind:load
 * to:0x020ffc4c).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020ffc4c-0x020ffc54.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020ffc4c[8] = "\\final\\";
