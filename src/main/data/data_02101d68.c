/* data_02101d68 (8 bytes, 4-aligned): string constant.
 * "server" (6 chars + NUL, zero-padded to 8 bytes (automatic from array
 * size > literal length)).
 * Reader(s): func_02068ab4 (relocs.txt from:0x02068b14 kind:load
 * to:0x02101d68).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02101d68-0x02101d70.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02101d68[8] = "server";
