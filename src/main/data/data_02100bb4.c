/* data_02100bb4 (4 bytes, 4-aligned): GameSpy-style key/value protocol
 * token.
 * "\\m\\" (3 chars + NUL).
 * Reader(s): func_0205c3c0 (relocs.txt from:0x0205c540 kind:load
 * to:0x02100bb4).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100bb4-0x02100bb8.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100bb4[4] = "\\m\\";
