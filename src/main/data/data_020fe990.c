/* data_020fe990 (24 bytes, 4-aligned): string constant.
 * "FREE http->lowsendbuf" (21 chars + NUL, zero-padded to 24 bytes
 * (automatic from array size > literal length)).
 * Reader(s): func_020418ac (relocs.txt from:0x02041970 kind:load
 * to:0x020fe990).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020fe990-0x020fe9a8.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020fe990[24] = "FREE http->lowsendbuf";
