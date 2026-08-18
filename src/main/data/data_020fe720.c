/* data_020fe720 (12 bytes, 4-aligned): string constant.
 * "User-Agent" (10 chars + NUL, zero-padded to 12 bytes (automatic from
 * array size > literal length)).
 * Reader(s): func_0204068c (relocs.txt from:0x020409d0 kind:load
 * to:0x020fe720).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020fe720-0x020fe72c.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020fe720[12] = "User-Agent";
