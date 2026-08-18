/* data_021014f4 (12 bytes, 4-aligned): string constant.
 * "connection" (10 chars + NUL, zero-padded to 12 bytes (automatic from
 * array size > literal length)).
 * Reader(s): func_02061798 (relocs.txt from:0x0206189c kind:load
 * to:0x021014f4); func_020618a8 (relocs.txt from:0x020619ac kind:load
 * to:0x021014f4); func_020619b8 (relocs.txt from:0x02061a84 kind:load
 * to:0x021014f4); +3 more reader(s), same relocs.txt to:0x021014f4.
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x021014f4-0x02101500.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_021014f4[12] = "connection";
