/* data_02101084 (8 bytes, 4-aligned): string constant.
 * "others" (6 chars + NUL, zero-padded to 8 bytes (automatic from array
 * size > literal length)).
 * Reader(s): func_0205dba4 (relocs.txt from:0x0205f81c kind:load
 * to:0x02101084).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02101084-0x0210108c.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02101084[8] = "others";
