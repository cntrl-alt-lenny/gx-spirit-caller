/* data_0210087c (4 bytes, 4-aligned): string constant.
 * "1" (1 chars + NUL, zero-padded to 4 bytes (automatic from array size >
 * literal length)).
 * Reader(s): func_0205a18c (relocs.txt from:0x0205a920 kind:load
 * to:0x0210087c); func_0205a974 (relocs.txt from:0x0205adfc kind:load
 * to:0x0210087c).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x0210087c-0x02100880.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_0210087c[4] = "1";
