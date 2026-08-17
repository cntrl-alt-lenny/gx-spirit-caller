/* data_020fe630 (16 bytes, 4-aligned): string constant.
 * "ALLOC bmwork" (12 chars + NUL, zero-padded to 16 bytes (automatic from
 * array size > literal length)).
 * Reader(s): func_0203fc70 (relocs.txt from:0x0203fe60 kind:load
 * to:0x020fe630).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020fe630-0x020fe640.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020fe630[16] = "ALLOC bmwork";
