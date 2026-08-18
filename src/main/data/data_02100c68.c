/* data_02100c68 (4 bytes, 4-aligned): string constant.
 * "0" (1 chars + NUL, zero-padded to 4 bytes (automatic from array size >
 * literal length)).
 * Reader(s): func_0205c9a0 (relocs.txt from:0x0205caa8 kind:load
 * to:0x02100c68); func_0205d15c (relocs.txt from:0x0205d4b8 kind:load
 * to:0x02100c68).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100c68-0x02100c6c.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100c68[4] = "0";
