/* data_02101314 (8 bytes, 4-aligned): GameSpy-style key/value protocol
 * token.
 * "\\error\\" (7 chars + NUL).
 * Reader(s): func_020603cc (relocs.txt from:0x02060494 kind:load
 * to:0x02101314).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02101314-0x0210131c.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02101314[8] = "\\error\\";
