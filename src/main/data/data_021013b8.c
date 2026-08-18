/* data_021013b8 (4 bytes, 4-aligned): string constant.
 * "lid" (3 chars + NUL).
 * Reader(s): func_020608b4 (relocs.txt from:0x02060950 kind:load
 * to:0x021013b8); func_02060958 (relocs.txt from:0x02060a24 kind:load
 * to:0x021013b8); func_02060a3c (relocs.txt from:0x02060acc kind:load
 * to:0x021013b8); +1 more reader(s), same relocs.txt to:0x021013b8.
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x021013b8-0x021013bc.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_021013b8[4] = "lid";
