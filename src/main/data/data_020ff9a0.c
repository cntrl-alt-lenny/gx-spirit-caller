/* data_020ff9a0 (12 bytes, 4-aligned): string constant.
 * "dwc_mtype" (9 chars + NUL, zero-padded to 12 bytes (automatic from array
 * size > literal length)).
 * Reader(s): func_0204b1a4 (relocs.txt from:0x0204b270 kind:load
 * to:0x020ff9a0); func_0204f040 (relocs.txt from:0x0204f098 kind:load
 * to:0x020ff9a0); func_0204f310 (relocs.txt from:0x0204f3b0 kind:load
 * to:0x020ff9a0).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020ff9a0-0x020ff9ac.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020ff9a0[12] = "dwc_mtype";
