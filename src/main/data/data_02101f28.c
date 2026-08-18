/* data_02101f28 (4 bytes, 4-aligned): string constant.
 * "A" (1 chars + NUL, zero-padded to 4 bytes (automatic from array size >
 * literal length)).
 * Reader(s): func_02076764 (relocs.txt from:0x020767bc kind:load
 * to:0x02101f28).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02101f28-0x02101f2c.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02101f28[4] = "A";
