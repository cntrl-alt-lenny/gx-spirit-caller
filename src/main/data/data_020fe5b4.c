/* data_020fe5b4 (8 bytes, 4-aligned): string constant.
 * "login" (5 chars + NUL, zero-padded to 8 bytes (automatic from array size
 * > literal length)).
 * Reader(s): func_0203f7c0 (relocs.txt from:0x0203f94c kind:load
 * to:0x020fe5b4).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020fe5b4-0x020fe5bc.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020fe5b4[8] = "login";
