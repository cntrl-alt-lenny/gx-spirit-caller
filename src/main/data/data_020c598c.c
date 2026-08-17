/* data_020c598c (4 bytes, 4-aligned): string constant.
 * "ON" (2 chars + NUL, zero-padded to 4 bytes (automatic from array size >
 * literal length)).
 * Reader(s): func_02012cc8 (relocs.txt from:0x020138a0 kind:load
 * to:0x020c598c).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020c598c-0x020c5990.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020c598c[4] = "ON";
