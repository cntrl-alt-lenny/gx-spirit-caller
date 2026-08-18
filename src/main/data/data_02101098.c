/* data_02101098 (8 bytes, 4-aligned): string constant.
 * "first" (5 chars + NUL, zero-padded to 8 bytes (automatic from array size
 * > literal length)).
 * Reader(s): func_0205dba4 (relocs.txt from:0x0205f828 kind:load
 * to:0x02101098).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02101098-0x021010a0.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02101098[8] = "first";
