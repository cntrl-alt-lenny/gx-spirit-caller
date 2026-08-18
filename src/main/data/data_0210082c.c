/* data_0210082c (12 bytes, 4-aligned): GameSpy-style key/value protocol
 * token.
 * "\\lastname\\" (10 chars + NUL, zero-padded to 12 bytes (automatic from
 * array size > literal length)).
 * Reader(s): func_0205a18c (relocs.txt from:0x0205a904 kind:load
 * to:0x0210082c); func_0205af90 (relocs.txt from:0x0205b744 kind:load
 * to:0x0210082c).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x0210082c-0x02100838.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_0210082c[12] = "\\lastname\\";
