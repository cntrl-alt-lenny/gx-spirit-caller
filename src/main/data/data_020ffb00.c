/* data_020ffb00 (4 bytes, 4-aligned): string constant.
 * "fn" (2 chars + NUL, zero-padded to 4 bytes (automatic from array size >
 * literal length)).
 * Reader(s): func_02053c34 (relocs.txt from:0x02053c9c kind:load
 * to:0x020ffb00); func_02053ca8 (relocs.txt from:0x02053d08 kind:load
 * to:0x020ffb00).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020ffb00-0x020ffb04.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020ffb00[4] = "fn";
