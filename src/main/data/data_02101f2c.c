/* data_02101f2c (4 bytes, 4-aligned): string constant.
 * "BB" (2 chars + NUL, zero-padded to 4 bytes (automatic from array size >
 * literal length)).
 * Reader(s): func_02076764 (relocs.txt from:0x020767c0 kind:load
 * to:0x02101f2c).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02101f2c-0x02101f30.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02101f2c[4] = "BB";
