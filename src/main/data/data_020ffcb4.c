/* data_020ffcb4 (16 bytes, 4-aligned): GameSpy-style key/value protocol
 * token.
 * "\\statstring\\" (12 chars + NUL, zero-padded to 16 bytes (automatic from
 * array size > literal length)).
 * Reader(s): func_02055420 (relocs.txt from:0x02055648 kind:load
 * to:0x020ffcb4).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020ffcb4-0x020ffcc4.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020ffcb4[16] = "\\statstring\\";
