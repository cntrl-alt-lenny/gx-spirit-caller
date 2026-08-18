/* data_02100988 (20 bytes, 4-aligned): GameSpy-style key/value protocol
 * token.
 * "\\connectionspeed\\" (17 chars + NUL, zero-padded to 20 bytes (automatic
 * from array size > literal length)).
 * Reader(s): func_0205a974 (relocs.txt from:0x0205ae24 kind:load
 * to:0x02100988).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100988-0x0210099c.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100988[20] = "\\connectionspeed\\";
