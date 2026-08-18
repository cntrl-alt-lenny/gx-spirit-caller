/* data_02102bb8 (16 bytes, 4-aligned): string constant.
 * "152587890625" (12 chars + NUL, zero-padded to 16 bytes (automatic from
 * array size > literal length)).
 * Reader(s): func_020b0778 (relocs.txt from:0x020b0ab4 kind:load
 * to:0x02102bb8).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02102bb8-0x02102bc8.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02102bb8[16] = "152587890625";
