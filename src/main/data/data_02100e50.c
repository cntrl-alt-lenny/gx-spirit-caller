/* data_02100e50 (12 bytes, 4-aligned): string constant.
 * "gpiSearch.c" (11 chars + NUL).
 * Reader(s): func_0205da48 (relocs.txt from:0x0205db9c kind:load
 * to:0x02100e50); func_0205dba4 (relocs.txt from:0x0205eaf8 kind:load
 * to:0x02100e50); func_0205fb88 (relocs.txt from:0x0205fd88 kind:load
 * to:0x02100e50).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100e50-0x02100e5c.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100e50[12] = "gpiSearch.c";
