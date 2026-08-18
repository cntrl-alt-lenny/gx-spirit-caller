/* data_02100780 (16 bytes, 4-aligned): string constant.
 * "Out of memory." (14 chars + NUL, zero-padded to 16 bytes (automatic from
 * array size > literal length)).
 * Reader(s): func_02059f38 (relocs.txt from:0x0205a0e8 kind:load
 * to:0x02100780); func_0205af90 (relocs.txt from:0x0205b7a4 kind:load
 * to:0x02100780).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100780-0x02100790.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100780[16] = "Out of memory.";
