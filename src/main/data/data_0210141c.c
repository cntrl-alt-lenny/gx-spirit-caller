/* data_0210141c (8 bytes, 4-aligned): string constant.
 * "buffer" (6 chars + NUL, zero-padded to 8 bytes (automatic from array
 * size > literal length)).
 * Reader(s): func_02061150 (relocs.txt from:0x02061280 kind:load
 * to:0x0210141c).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x0210141c-0x02101424.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_0210141c[8] = "buffer";
