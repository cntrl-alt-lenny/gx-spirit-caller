/* data_02100558 (16 bytes, 4-aligned): GameSpy-style key/value protocol
 * token.
 * "\\namespaceid\\" (13 chars + NUL, zero-padded to 16 bytes (automatic
 * from array size > literal length)).
 * Reader(s): func_020590f0 (relocs.txt from:0x02059370 kind:load
 * to:0x02100558); func_0205938c (relocs.txt from:0x02059738 kind:load
 * to:0x02100558).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100558-0x02100568.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100558[16] = "\\namespaceid\\";
