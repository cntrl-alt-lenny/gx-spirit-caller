/* data_020fe5c8 (8 bytes, 4-aligned): string constant.
 * "iswfc" (5 chars + NUL, zero-padded to 8 bytes (automatic from array size
 * > literal length)).
 * Reader(s): func_0203f7c0 (relocs.txt from:0x0203f960 kind:load
 * to:0x020fe5c8).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020fe5c8-0x020fe5d0.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020fe5c8[8] = "iswfc";
