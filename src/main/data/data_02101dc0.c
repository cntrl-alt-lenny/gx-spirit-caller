/* data_02101dc0 (12 bytes, 4-aligned): string constant.
 * "inlen >= 0" (10 chars + NUL, zero-padded to 12 bytes (automatic from
 * array size > literal length)).
 * Reader(s): func_02069ec4 (relocs.txt from:0x0206a308 kind:load
 * to:0x02101dc0).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02101dc0-0x02101dcc.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02101dc0[12] = "inlen >= 0";
