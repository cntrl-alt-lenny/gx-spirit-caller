/* data_02101764 (8 bytes, 4-aligned): string constant.
 * "unknown" (7 chars + NUL).
 * Reader(s): func_020667e8 (relocs.txt from:0x020669b8 kind:load
 * to:0x02101764); func_02066ae8 (relocs.txt from:0x02066d38 kind:load
 * to:0x02101764).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02101764-0x0210176c.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02101764[8] = "unknown";
