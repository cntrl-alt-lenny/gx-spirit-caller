/* data_020ff9dc (8 bytes, 4-aligned): string constant.
 * "GPCM" (4 chars + NUL, zero-padded to 8 bytes (automatic from array size
 * > literal length)).
 * Reader(s): func_0204e914 (relocs.txt from:0x0204e9b4 kind:load
 * to:0x020ff9dc).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020ff9dc-0x020ff9e4.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020ff9dc[8] = "GPCM";
