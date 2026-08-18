/* data_020fe67c (16 bytes, 4-aligned): string constant.
 * "ALLOC DWCauth" (13 chars + NUL, zero-padded to 16 bytes (automatic from
 * array size > literal length)).
 * Reader(s): func_0204052c (relocs.txt from:0x02040660 kind:load
 * to:0x020fe67c).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020fe67c-0x020fe68c.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020fe67c[16] = "ALLOC DWCauth";
