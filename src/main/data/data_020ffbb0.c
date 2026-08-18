/* data_020ffbb0 (12 bytes, 4-aligned): string constant.
 * "nBuckets" (8 chars + NUL, zero-padded to 12 bytes (automatic from array
 * size > literal length)).
 * Reader(s): func_02054700 (relocs.txt from:0x02054834 kind:load
 * to:0x020ffbb0).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020ffbb0-0x020ffbbc.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020ffbb0[12] = "nBuckets";
