/* data_02100940 (12 bytes, 4-aligned): GameSpy-style key/value protocol
 * token.
 * "\\cpuspeed\\" (10 chars + NUL, zero-padded to 12 bytes (automatic from
 * array size > literal length)).
 * Reader(s): func_0205a974 (relocs.txt from:0x0205ae10 kind:load
 * to:0x02100940).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100940-0x0210094c.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100940[12] = "\\cpuspeed\\";
