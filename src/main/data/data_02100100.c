/* data_02100100 (24 bytes, 4-aligned): string constant.
 * "sock != INVALID_SOCKET" (22 chars + NUL, zero-padded to 24 bytes
 * (automatic from array size > literal length)).
 * Reader(s): func_02057b00 (relocs.txt from:0x02057cfc kind:load
 * to:0x02100100).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100100-0x02100118.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100100[24] = "sock != INVALID_SOCKET";
