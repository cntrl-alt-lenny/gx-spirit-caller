/* data_02101174 (32 bytes, 4-aligned): string constant.
 * "address.sin_addr.s_addr != 0" (28 chars + NUL, zero-padded to 32 bytes
 * (automatic from array size > literal length)).
 * Reader(s): func_0205fb88 (relocs.txt from:0x0205fd84 kind:load
 * to:0x02101174).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02101174-0x02101194.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02101174[32] = "address.sin_addr.s_addr != 0";
