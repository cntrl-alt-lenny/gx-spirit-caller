/* data_02102a90 (4 bytes, 4-aligned): string constant.
 * "NAN" (3 chars + NUL).
 * Reader(s): func_020a7fec (relocs.txt from:0x020a84bc kind:load
 * to:0x02102a90); func_020a85ec (relocs.txt from:0x020a8d44 kind:load
 * to:0x02102a90).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02102a90-0x02102a94.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02102a90[4] = "NAN";
