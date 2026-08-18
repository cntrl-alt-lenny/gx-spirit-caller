/* data_021013bc (4 bytes, 4-aligned): string constant.
 * "mod" (3 chars + NUL).
 * Reader(s): func_020608b4 (relocs.txt from:0x02060954 kind:load
 * to:0x021013bc); func_02060958 (relocs.txt from:0x02060a2c kind:load
 * to:0x021013bc).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x021013bc-0x021013c0.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_021013bc[4] = "mod";
