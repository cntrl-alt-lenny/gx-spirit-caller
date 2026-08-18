/* data_02101534 (8 bytes, 4-aligned): string constant.
 * "time" (4 chars + NUL, zero-padded to 8 bytes (automatic from array size
 * > literal length)).
 * Reader(s): func_02063664 (relocs.txt from:0x0206370c kind:load
 * to:0x02101534).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02101534-0x0210153c.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02101534[8] = "time";
