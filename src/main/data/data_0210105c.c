/* data_0210105c (4 bytes, 4-aligned): string constant.
 * "psr" (3 chars + NUL).
 * Reader(s): func_0205dba4 (relocs.txt from:0x0205f804 kind:load
 * to:0x0210105c).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x0210105c-0x02101060.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_0210105c[4] = "psr";
