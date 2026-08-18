/* data_02100a10 (16 bytes, 4-aligned): string constant.
 * "profileid > 0" (13 chars + NUL, zero-padded to 16 bytes (automatic from
 * array size > literal length)).
 * Reader(s): func_0205af90 (relocs.txt from:0x0205b728 kind:load
 * to:0x02100a10).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100a10-0x02100a20.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100a10[16] = "profileid > 0";
