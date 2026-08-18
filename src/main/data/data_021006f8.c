/* data_021006f8 (32 bytes, 4-aligned): string constant.
 * "address.sin_addr.s_addr != 0" (28 chars + NUL, zero-padded to 32 bytes
 * (automatic from array size > literal length)).
 * Reader(s): func_0205999c (relocs.txt from:0x02059d0c kind:load
 * to:0x021006f8).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x021006f8-0x02100718.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_021006f8[32] = "address.sin_addr.s_addr != 0";
