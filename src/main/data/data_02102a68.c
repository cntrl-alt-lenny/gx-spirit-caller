/* data_02102a68 (8 bytes, 4-aligned): string constant.
 * "-INF" (4 chars + NUL, zero-padded to 8 bytes (automatic from array size
 * > literal length)).
 * Reader(s): func_020a7fec (relocs.txt from:0x020a84a4 kind:load
 * to:0x02102a68); func_020a85ec (relocs.txt from:0x020a8d2c kind:load
 * to:0x02102a68).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02102a68-0x02102a70.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02102a68[8] = "-INF";
