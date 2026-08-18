/* data_02100878 (4 bytes, 4-aligned): string constant.
 * "0" (1 chars + NUL, zero-padded to 4 bytes (automatic from array size >
 * literal length)).
 * Reader(s): func_0205a18c (relocs.txt from:0x0205a91c kind:load
 * to:0x02100878); func_0205a974 (relocs.txt from:0x0205adf8 kind:load
 * to:0x02100878).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100878-0x0210087c.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100878[4] = "0";
