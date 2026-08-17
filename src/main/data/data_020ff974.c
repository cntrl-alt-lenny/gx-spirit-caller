/* data_020ff974 (12 bytes, 4-aligned): string constant.
 * "dwc_eval" (8 chars + NUL, zero-padded to 12 bytes (automatic from array
 * size > literal length)).
 * Reader(s): func_0204a174 (relocs.txt from:0x0204a2e8 kind:load
 * to:0x020ff974); func_0204a2ec (relocs.txt from:0x0204a4e8 kind:load
 * to:0x020ff974); func_0204f310 (relocs.txt from:0x0204f3bc kind:load
 * to:0x020ff974).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020ff974-0x020ff980.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020ff974[12] = "dwc_eval";
