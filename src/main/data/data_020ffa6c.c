/* data_020ffa6c (12 bytes, 4-aligned): string constant.
 * "Server full" (11 chars + NUL).
 * Reader(s): func_02050450 (relocs.txt from:0x0205069c kind:load
 * to:0x020ffa6c).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020ffa6c-0x020ffa78.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020ffa6c[12] = "Server full";
