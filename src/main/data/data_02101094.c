/* data_02101094 (4 bytes, 4-aligned): string constant.
 * "o" (1 chars + NUL, zero-padded to 4 bytes (automatic from array size >
 * literal length)).
 * Reader(s): func_0205dba4 (relocs.txt from:0x0205f824 kind:load
 * to:0x02101094).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02101094-0x02101098.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02101094[4] = "o";
