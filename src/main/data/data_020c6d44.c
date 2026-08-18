/* data_020c6d44 (12 bytes, 4-aligned): string constant.
 * "ATK/   ?" (8 chars + NUL, zero-padded to 12 bytes (automatic from array
 * size > literal length)).
 * Reader(s): func_0202d558 (relocs.txt from:0x0202d984 kind:load
 * to:0x020c6d44).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020c6d44-0x020c6d50.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020c6d44[12] = "ATK/   ?";
