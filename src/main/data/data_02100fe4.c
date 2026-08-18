/* data_02100fe4 (4 bytes, 4-aligned): string constant.
 * "bsr" (3 chars + NUL).
 * Reader(s): func_0205dba4 (relocs.txt from:0x0205eb1c kind:load
 * to:0x02100fe4).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100fe4-0x02100fe8.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100fe4[4] = "bsr";
