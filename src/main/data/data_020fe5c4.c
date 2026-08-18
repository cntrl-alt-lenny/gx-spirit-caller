/* data_020fe5c4 (4 bytes, 4-aligned): string constant.
 * "Y" (1 chars + NUL, zero-padded to 4 bytes (automatic from array size >
 * literal length)).
 * Reader(s): func_0203f7c0 (relocs.txt from:0x0203f95c kind:load
 * to:0x020fe5c4).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020fe5c4-0x020fe5c8.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020fe5c4[4] = "Y";
