/* data_020ff96c (8 bytes, 4-aligned): string constant.
 * "SBCM" (4 chars + NUL, zero-padded to 8 bytes (automatic from array size
 * > literal length)).
 * Reader(s): func_02049d70 (relocs.txt from:0x02049e80 kind:load
 * to:0x020ff96c); func_0204e9b8 (relocs.txt from:0x0204eacc kind:load
 * to:0x020ff96c).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020ff96c-0x020ff974.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020ff96c[8] = "SBCM";
