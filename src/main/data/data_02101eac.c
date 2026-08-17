/* data_02101eac (12 bytes, 4-aligned): string constant.
 * "NintendoDS" (10 chars + NUL, zero-padded to 12 bytes (automatic from
 * array size > literal length)).
 * Reader(s): func_0206fc6c (relocs.txt from:0x0206fe04 kind:load
 * to:0x02101eac).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02101eac-0x02101eb8.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02101eac[12] = "NintendoDS";
