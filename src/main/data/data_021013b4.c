/* data_021013b4 (4 bytes, 4-aligned): string constant.
 * "pid" (3 chars + NUL).
 * Reader(s): func_020608b4 (relocs.txt from:0x0206094c kind:load
 * to:0x021013b4); func_02060958 (relocs.txt from:0x02060a28 kind:load
 * to:0x021013b4).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x021013b4-0x021013b8.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_021013b4[4] = "pid";
