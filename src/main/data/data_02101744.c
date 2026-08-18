/* data_02101744 (12 bytes, 4-aligned): string constant.
 * "publicport" (10 chars + NUL, zero-padded to 12 bytes (automatic from
 * array size > literal length)).
 * Reader(s): func_02066010 (relocs.txt from:0x02066220 kind:load
 * to:0x02101744).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02101744-0x02101750.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02101744[12] = "publicport";
