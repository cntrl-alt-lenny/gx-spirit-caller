/* data_02100884 (8 bytes, 4-aligned): GameSpy-style key/value protocol
 * token.
 * "\\sex\\" (5 chars + NUL, zero-padded to 8 bytes (automatic from array
 * size > literal length)).
 * Reader(s): func_0205a18c (relocs.txt from:0x0205a928 kind:load
 * to:0x02100884); func_0205a974 (relocs.txt from:0x0205adf4 kind:load
 * to:0x02100884); func_0205af90 (relocs.txt from:0x0205b768 kind:load
 * to:0x02100884).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100884-0x0210088c.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100884[8] = "\\sex\\";
