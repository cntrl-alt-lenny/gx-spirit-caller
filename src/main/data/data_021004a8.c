/* data_021004a8 (52 bytes, 4-aligned): string constant.
 * "                                                " (48 chars + NUL,
 * zero-padded to 52 bytes (automatic from array size > literal length)).
 * Reader(s): func_02058a08 (relocs.txt from:0x020590e0 kind:load
 * to:0x021004a8); func_0205938c (relocs.txt from:0x020596fc kind:load
 * to:0x021004a8).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x021004a8-0x021004dc.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_021004a8[52] = "                                                ";
