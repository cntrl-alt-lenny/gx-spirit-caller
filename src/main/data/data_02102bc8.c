/* data_02102bc8 (8 bytes, 4-aligned): string constant.
 * "390625" (6 chars + NUL, zero-padded to 8 bytes (automatic from array
 * size > literal length)).
 * Reader(s): func_020b0778 (relocs.txt from:0x020b0ab8 kind:load
 * to:0x02102bc8).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02102bc8-0x02102bd0.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02102bc8[8] = "390625";
