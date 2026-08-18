/* data_020fe89c (12 bytes, 4-aligned): string constant.
 * "https://" (8 chars + NUL, zero-padded to 12 bytes (automatic from array
 * size > literal length)).
 * Reader(s): func_02041248 (relocs.txt from:0x020413a0 kind:load
 * to:0x020fe89c).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020fe89c-0x020fe8a8.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020fe89c[12] = "https://";
