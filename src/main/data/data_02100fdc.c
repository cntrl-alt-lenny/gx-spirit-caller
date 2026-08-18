/* data_02100fdc (8 bytes, 4-aligned): string constant.
 * "more" (4 chars + NUL, zero-padded to 8 bytes (automatic from array size
 * > literal length)).
 * Reader(s): func_0205dba4 (relocs.txt from:0x0205eb18 kind:load
 * to:0x02100fdc).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100fdc-0x02100fe4.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100fdc[8] = "more";
