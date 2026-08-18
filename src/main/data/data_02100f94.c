/* data_02100f94 (12 bytes, 4-aligned): GameSpy-style key/value protocol
 * token.
 * "\\gamename\\" (10 chars + NUL, zero-padded to 12 bytes (automatic from
 * array size > literal length)).
 * Reader(s): func_0205dba4 (relocs.txt from:0x0205eb00 kind:load
 * to:0x02100f94).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100f94-0x02100fa0.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100f94[12] = "\\gamename\\";
