/* data_02100790 (24 bytes, 4-aligned): GameSpy-style key/value protocol
 * token.
 * "\\getprofile\\\\sesskey\\" (21 chars + NUL, zero-padded to 24 bytes
 * (automatic from array size > literal length)).
 * Reader(s): func_0205a0ec (relocs.txt from:0x0205a17c kind:load
 * to:0x02100790).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100790-0x021007a8.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100790[24] = "\\getprofile\\\\sesskey\\";
