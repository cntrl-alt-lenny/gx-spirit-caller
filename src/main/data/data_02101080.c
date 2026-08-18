/* data_02101080 (4 bytes, 4-aligned): string constant.
 * "nur" (3 chars + NUL).
 * Reader(s): func_0205dba4 (relocs.txt from:0x0205f818 kind:load
 * to:0x02101080).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02101080-0x02101084.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02101080[4] = "nur";
