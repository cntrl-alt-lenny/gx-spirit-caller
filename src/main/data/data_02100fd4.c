/* data_02100fd4 (8 bytes, 4-aligned): string constant.
 * "bsrdone" (7 chars + NUL).
 * Reader(s): func_0205dba4 (relocs.txt from:0x0205eb14 kind:load
 * to:0x02100fd4).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100fd4-0x02100fdc.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100fd4[8] = "bsrdone";
