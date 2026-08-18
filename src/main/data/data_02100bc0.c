/* data_02100bc0 (8 bytes, 4-aligned): GameSpy-style key/value protocol
 * token.
 * "\\msg\\\n" (6 chars + NUL, zero-padded to 8 bytes (automatic from array
 * size > literal length)).
 * Reader(s): func_0205c3c0 (relocs.txt from:0x0205c548 kind:load
 * to:0x02100bc0).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100bc0-0x02100bc8.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100bc0[8] = "\\msg\\\n";
