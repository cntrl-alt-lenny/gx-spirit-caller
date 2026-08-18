/* data_02102be0 (8 bytes, 4-aligned): string constant.
 * "3125" (4 chars + NUL, zero-padded to 8 bytes (automatic from array size
 * > literal length)).
 * Reader(s): func_020b0778 (relocs.txt from:0x020b0ac4 kind:load
 * to:0x02102be0).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02102be0-0x02102be8.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02102be0[8] = "3125";
