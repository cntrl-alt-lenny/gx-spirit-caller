/* data_020feaf4 (8 bytes, 4-aligned): string constant.
 * "message" (7 chars + NUL).
 * Reader(s): func_020421d8 (relocs.txt from:0x02043108 kind:load
 * to:0x020feaf4).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020feaf4-0x020feafc.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020feaf4[8] = "message";
