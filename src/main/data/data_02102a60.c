/* data_02102a60 (8 bytes, 4-aligned): string constant.
 * "0x0p0" (5 chars + NUL, zero-padded to 8 bytes (automatic from array size
 * > literal length)).
 * Reader(s): func_020a7fec (relocs.txt from:0x020a84a0 kind:load
 * to:0x02102a60).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02102a60-0x02102a68.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02102a60[8] = "0x0p0";
