/* data_02101054 (8 bytes, 4-aligned): string constant.
 * "psrdone" (7 chars + NUL).
 * Reader(s): func_0205dba4 (relocs.txt from:0x0205f800 kind:load
 * to:0x02101054).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02101054-0x0210105c.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02101054[8] = "psrdone";
