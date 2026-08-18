/* data_02101518 (12 bytes, 4-aligned): string constant.
 * "connection" (10 chars + NUL, zero-padded to 12 bytes (automatic from
 * array size > literal length)).
 * Reader(s): func_02062498 (relocs.txt from:0x020624c0 kind:load
 * to:0x02101518); func_020624cc (relocs.txt from:0x02062500 kind:load
 * to:0x02101518).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02101518-0x02101524.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02101518[12] = "connection";
