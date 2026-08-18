/* data_021007fc (16 bytes, 4-aligned): GameSpy-style key/value protocol
 * token.
 * "\\uniquenick\\" (12 chars + NUL, zero-padded to 16 bytes (automatic from
 * array size > literal length)).
 * Reader(s): func_0205a18c (relocs.txt from:0x0205a8f0 kind:load
 * to:0x021007fc); func_0205af90 (relocs.txt from:0x0205b738 kind:load
 * to:0x021007fc).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x021007fc-0x0210080c.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_021007fc[16] = "\\uniquenick\\";
