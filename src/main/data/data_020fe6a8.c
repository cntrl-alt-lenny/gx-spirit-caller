/* data_020fe6a8 (8 bytes, 4-aligned): string constant.
 * "passwd" (6 chars + NUL, zero-padded to 8 bytes (automatic from array
 * size > literal length)).
 * Reader(s): func_0204068c (relocs.txt from:0x0204099c kind:load
 * to:0x020fe6a8).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020fe6a8-0x020fe6b0.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020fe6a8[8] = "passwd";
