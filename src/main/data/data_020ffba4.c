/* data_020ffba4 (12 bytes, 4-aligned): string constant.
 * "elemSize" (8 chars + NUL, zero-padded to 12 bytes (automatic from array
 * size > literal length)).
 * Reader(s): func_02054700 (relocs.txt from:0x02054830 kind:load
 * to:0x020ffba4).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020ffba4-0x020ffbb0.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020ffba4[12] = "elemSize";
