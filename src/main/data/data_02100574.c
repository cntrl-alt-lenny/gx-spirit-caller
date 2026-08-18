/* data_02100574 (8 bytes, 4-aligned): GameSpy-style key/value protocol
 * token.
 * "\\id\\1" (5 chars + NUL, zero-padded to 8 bytes (automatic from array
 * size > literal length)).
 * Reader(s): func_020590f0 (relocs.txt from:0x02059384 kind:load
 * to:0x02100574); func_0205938c (relocs.txt from:0x0205973c kind:load
 * to:0x02100574).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100574-0x0210057c.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100574[8] = "\\id\\1";
