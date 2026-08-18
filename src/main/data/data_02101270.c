/* data_02101270 (16 bytes, 4-aligned): string constant.
 * "Parse Error." (12 chars + NUL, zero-padded to 16 bytes (automatic from
 * array size > literal length)).
 * Reader(s): func_02060000 (relocs.txt from:0x020601c8 kind:load
 * to:0x02101270).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02101270-0x02101280.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02101270[16] = "Parse Error.";
