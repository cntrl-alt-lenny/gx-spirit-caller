/* data_020ff9ac (12 bytes, 4-aligned): string constant.
 * "dwc_mresv" (9 chars + NUL, zero-padded to 12 bytes (automatic from array
 * size > literal length)).
 * Reader(s): func_0204b1a4 (relocs.txt from:0x0204b274 kind:load
 * to:0x020ff9ac); func_0204f040 (relocs.txt from:0x0204f09c kind:load
 * to:0x020ff9ac); func_0204f310 (relocs.txt from:0x0204f3b4 kind:load
 * to:0x020ff9ac).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020ff9ac-0x020ff9b8.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020ff9ac[12] = "dwc_mresv";
