/* data_020ffa98 (4 bytes, 4-aligned): string constant.
 * "DT" (2 chars + NUL, zero-padded to 4 bytes (automatic from array size >
 * literal length)).
 * Reader(s): func_0205272c (relocs.txt from:0x02052764 kind:load
 * to:0x020ffa98); func_02052768 (relocs.txt from:0x02052794 kind:load
 * to:0x020ffa98).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020ffa98-0x020ffa9c.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020ffa98[4] = "DT";
