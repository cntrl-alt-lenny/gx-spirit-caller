/* data_02100290 (20 bytes, 4-aligned): string constant.
 * "data->arg != NULL" (17 chars + NUL, zero-padded to 20 bytes (automatic
 * from array size > literal length)).
 * Reader(s): func_02058334 (relocs.txt from:0x02058524 kind:load
 * to:0x02100290).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100290-0x021002a4.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100290[20] = "data->arg != NULL";
