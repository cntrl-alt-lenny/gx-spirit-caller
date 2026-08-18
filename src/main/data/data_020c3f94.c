/* data_020c3f94 (12 bytes, 4-aligned): string constant.
 * "YuGiOhSS" (8 chars + NUL, zero-padded to 12 bytes (automatic from array
 * size > literal length)).
 * Reader(s): func_02008024 (relocs.txt from:0x0200853c kind:load
 * to:0x020c3f94).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020c3f94-0x020c3fa0.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020c3f94[12] = "YuGiOhSS";
