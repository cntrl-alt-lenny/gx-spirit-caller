/* data_02100740 (64 bytes, 4-aligned): string constant.
 * "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789" (62
 * chars + NUL, zero-padded to 64 bytes (automatic from array size > literal
 * length)).
 * Reader(s): func_02059d1c (relocs.txt from:0x02059d84 kind:load
 * to:0x02100740).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100740-0x02100780.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100740[64] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
