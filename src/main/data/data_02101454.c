/* data_02101454 (36 bytes, 4-aligned): string constant.
 * "shortenBy <= (buffer->len - start)" (34 chars + NUL, zero-padded to 36
 * bytes (automatic from array size > literal length)).
 * Reader(s): func_0206133c (relocs.txt from:0x020613d4 kind:load
 * to:0x02101454).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02101454-0x02101478.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02101454[36] = "shortenBy <= (buffer->len - start)";
