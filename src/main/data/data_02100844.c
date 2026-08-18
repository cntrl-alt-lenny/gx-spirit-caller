/* data_02100844 (12 bytes, 4-aligned): GameSpy-style key/value protocol
 * token.
 * "\\zipcode\\" (9 chars + NUL, zero-padded to 12 bytes (automatic from
 * array size > literal length)).
 * Reader(s): func_0205a18c (relocs.txt from:0x0205a90c kind:load
 * to:0x02100844); func_0205a974 (relocs.txt from:0x0205ade8 kind:load
 * to:0x02100844); func_0205af90 (relocs.txt from:0x0205b750 kind:load
 * to:0x02100844).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100844-0x02100850.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100844[12] = "\\zipcode\\";
