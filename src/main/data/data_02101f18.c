/* data_02101f18 (8 bytes, 4-aligned): string constant.
 * "SRVR" (4 chars + NUL, zero-padded to 8 bytes (automatic from array size
 * > literal length)).
 * Reader(s): func_0207634c (relocs.txt from:0x0207642c kind:load
 * to:0x02101f18); func_02076434 (relocs.txt from:0x02076514 kind:load
 * to:0x02101f18).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02101f18-0x02101f20.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02101f18[8] = "SRVR";
