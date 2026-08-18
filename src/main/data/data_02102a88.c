/* data_02102a88 (8 bytes, 4-aligned): string constant.
 * "-nan" (4 chars + NUL, zero-padded to 8 bytes (automatic from array size
 * > literal length)).
 * Reader(s): func_020a7fec (relocs.txt from:0x020a84b8 kind:load
 * to:0x02102a88); func_020a85ec (relocs.txt from:0x020a8d40 kind:load
 * to:0x02102a88).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02102a88-0x02102a90.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02102a88[8] = "-nan";
