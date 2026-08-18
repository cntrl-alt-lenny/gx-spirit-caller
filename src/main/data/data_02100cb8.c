/* data_02100cb8 (4 bytes, 4-aligned): string constant.
 * "PR" (2 chars + NUL, zero-padded to 4 bytes (automatic from array size >
 * literal length)).
 * Reader(s): func_0205cbb8 (relocs.txt from:0x0205ce34 kind:load
 * to:0x02100cb8); func_0205ce40 (relocs.txt from:0x0205cf0c kind:load
 * to:0x02100cb8); func_0205cf10 (relocs.txt from:0x0205d134 kind:load
 * to:0x02100cb8); +1 more reader(s), same relocs.txt to:0x02100cb8.
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100cb8-0x02100cbc.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100cb8[4] = "PR";
