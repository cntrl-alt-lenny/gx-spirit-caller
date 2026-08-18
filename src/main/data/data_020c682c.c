/* data_020c682c (20 bytes, 4-aligned): string constant.
 * "WM not Initialized\n" (19 chars + NUL).
 * Reader(s): func_02020b24 (relocs.txt from:0x02020b74 kind:load
 * to:0x020c682c).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020c682c-0x020c6840.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020c682c[20] = "WM not Initialized\n";
