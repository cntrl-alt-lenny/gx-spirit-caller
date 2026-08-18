/* data_02102b78 (40 bytes, 4-aligned): string constant.
 * "11102230246251565404236316680908203125" (38 chars + NUL, zero-padded to
 * 40 bytes (automatic from array size > literal length)).
 * Reader(s): func_020b0778 (relocs.txt from:0x020b0aac kind:load
 * to:0x02102b78).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02102b78-0x02102ba0.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02102b78[40] = "11102230246251565404236316680908203125";
