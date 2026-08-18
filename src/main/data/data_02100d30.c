/* data_02100d30 (36 bytes, 4-aligned): string constant.
 * "Error getting buddy authorization." (34 chars + NUL, zero-padded to 36
 * bytes (automatic from array size > literal length)).
 * Reader(s): func_0205d15c (relocs.txt from:0x0205d4ac kind:load
 * to:0x02100d30).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100d30-0x02100d54.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100d30[36] = "Error getting buddy authorization.";
