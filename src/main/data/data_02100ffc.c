/* data_02100ffc (12 bytes, 4-aligned): string constant.
 * "firstname" (9 chars + NUL, zero-padded to 12 bytes (automatic from array
 * size > literal length)).
 * Reader(s): func_0205dba4 (relocs.txt from:0x0205eb2c kind:load
 * to:0x02100ffc).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100ffc-0x02101008.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100ffc[12] = "firstname";
