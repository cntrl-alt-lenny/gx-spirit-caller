/* data_021013e4 (8 bytes, 4-aligned): string constant.
 * "pauthr" (6 chars + NUL, zero-padded to 8 bytes (automatic from array
 * size > literal length)).
 * Reader(s): func_02060ad4 (relocs.txt from:0x02060b74 kind:load
 * to:0x021013e4).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x021013e4-0x021013ec.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_021013e4[8] = "pauthr";
