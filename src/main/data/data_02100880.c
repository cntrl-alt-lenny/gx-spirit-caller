/* data_02100880 (4 bytes, 4-aligned): string constant.
 * "2" (1 chars + NUL, zero-padded to 4 bytes (automatic from array size >
 * literal length)).
 * Reader(s): func_0205a18c (relocs.txt from:0x0205a924 kind:load
 * to:0x02100880); func_0205a974 (relocs.txt from:0x0205ae00 kind:load
 * to:0x02100880).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100880-0x02100884.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100880[4] = "2";
