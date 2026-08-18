/* data_021013ec (8 bytes, 4-aligned): string constant.
 * "errmsg" (6 chars + NUL, zero-padded to 8 bytes (automatic from array
 * size > literal length)).
 * Reader(s): func_02060ad4 (relocs.txt from:0x02060b7c kind:load
 * to:0x021013ec).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x021013ec-0x021013f4.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_021013ec[8] = "errmsg";
