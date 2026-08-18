/* data_02101078 (8 bytes, 4-aligned): GameSpy-style key/value protocol
 * token.
 * "\\pid\\" (5 chars + NUL, zero-padded to 8 bytes (automatic from array
 * size > literal length)).
 * Reader(s): func_0205dba4 (relocs.txt from:0x0205f814 kind:load
 * to:0x02101078).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02101078-0x02101080.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02101078[8] = "\\pid\\";
