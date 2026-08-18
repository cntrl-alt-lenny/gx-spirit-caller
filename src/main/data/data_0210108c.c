/* data_0210108c (8 bytes, 4-aligned): string constant.
 * "odone" (5 chars + NUL, zero-padded to 8 bytes (automatic from array size
 * > literal length)).
 * Reader(s): func_0205dba4 (relocs.txt from:0x0205f820 kind:load
 * to:0x0210108c).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x0210108c-0x02101094.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_0210108c[8] = "odone";
