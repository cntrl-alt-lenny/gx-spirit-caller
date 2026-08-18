/* data_021012fc (16 bytes, 4-aligned): string constant.
 * "command != NULL" (15 chars + NUL).
 * Reader(s): func_020602c4 (relocs.txt from:0x020603ac kind:load
 * to:0x021012fc).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x021012fc-0x0210130c.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_021012fc[16] = "command != NULL";
