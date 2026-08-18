/* data_020fe66c (16 bytes, 4-aligned): string constant.
 * "FREE DWCauth" (12 chars + NUL, zero-padded to 16 bytes (automatic from
 * array size > literal length)).
 * Reader(s): func_0204037c (relocs.txt from:0x020403d0 kind:load
 * to:0x020fe66c).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020fe66c-0x020fe67c.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020fe66c[16] = "FREE DWCauth";
