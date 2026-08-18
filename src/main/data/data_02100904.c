/* data_02100904 (8 bytes, 4-aligned): GameSpy-style key/value protocol
 * token.
 * "\\i1\\" (4 chars + NUL, zero-padded to 8 bytes (automatic from array
 * size > literal length)).
 * Reader(s): func_0205a18c (relocs.txt from:0x0205a96c kind:load
 * to:0x02100904); func_0205a974 (relocs.txt from:0x0205ae44 kind:load
 * to:0x02100904); func_0205af90 (relocs.txt from:0x0205b794 kind:load
 * to:0x02100904).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100904-0x0210090c.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100904[8] = "\\i1\\";
