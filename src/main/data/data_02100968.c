/* data_02100968 (16 bytes, 4-aligned): GameSpy-style key/value protocol
 * token.
 * "\\videocard2ram\\" (15 chars + NUL).
 * Reader(s): func_0205a974 (relocs.txt from:0x0205ae1c kind:load
 * to:0x02100968).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100968-0x02100978.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100968[16] = "\\videocard2ram\\";
