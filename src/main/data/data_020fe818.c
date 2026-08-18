/* data_020fe818 (4 bytes, 4-aligned): string constant.
 * "&" (1 chars + NUL, zero-padded to 4 bytes (automatic from array size >
 * literal length)).
 * Reader(s): func_02040e3c (relocs.txt from:0x020410e8 kind:load
 * to:0x020fe818).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020fe818-0x020fe81c.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020fe818[4] = "&";
