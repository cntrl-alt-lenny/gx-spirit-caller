/* data_02100154 (16 bytes, 4-aligned): string constant.
 * "Out of memory." (14 chars + NUL, zero-padded to 16 bytes (automatic from
 * array size > literal length)).
 * Reader(s): func_02057b00 (relocs.txt from:0x02057d1c kind:load
 * to:0x02100154); func_020580a0 (relocs.txt from:0x020581a4 kind:load
 * to:0x02100154); func_020581a8 (relocs.txt from:0x02058240 kind:load
 * to:0x02100154).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100154-0x02100164.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100154[16] = "Out of memory.";
