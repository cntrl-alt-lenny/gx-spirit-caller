/* data_02100260 (32 bytes, 4-aligned): string constant.
 * "data->callback.callback != NULL" (31 chars + NUL).
 * Reader(s): func_02058334 (relocs.txt from:0x0205851c kind:load
 * to:0x02100260).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100260-0x02100280.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100260[32] = "data->callback.callback != NULL";
