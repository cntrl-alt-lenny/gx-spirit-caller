/* data_02101280 (20 bytes, 4-aligned): string constant.
 * "Error connecting\n" (17 chars + NUL, zero-padded to 20 bytes (automatic
 * from array size > literal length)).
 * Reader(s): func_020601d0 (relocs.txt from:0x020602b4 kind:load
 * to:0x02101280).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02101280-0x02101294.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02101280[20] = "Error connecting\n";
