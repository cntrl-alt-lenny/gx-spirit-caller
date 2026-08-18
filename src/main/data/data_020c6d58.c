/* data_020c6d58 (12 bytes, 4-aligned): string constant.
 * "DEF/   ?" (8 chars + NUL, zero-padded to 12 bytes (automatic from array
 * size > literal length)).
 * Reader(s): func_0202d558 (relocs.txt from:0x0202d98c kind:load
 * to:0x020c6d58).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020c6d58-0x020c6d64.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020c6d58[12] = "DEF/   ?";
