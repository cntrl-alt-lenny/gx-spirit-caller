/* data_021013d0 (8 bytes, 4-aligned): GameSpy-style key/value protocol
 * token.
 * "\\data\\" (6 chars + NUL, zero-padded to 8 bytes (automatic from array
 * size > literal length)).
 * Reader(s): func_02060958 (relocs.txt from:0x02060a34 kind:load
 * to:0x021013d0).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x021013d0-0x021013d8.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_021013d0[8] = "\\data\\";
