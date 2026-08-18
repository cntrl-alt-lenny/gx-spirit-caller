/* data_02100504 (16 bytes, 4-aligned): string constant.
 * "Out of memory." (14 chars + NUL, zero-padded to 16 bytes (automatic from
 * array size > literal length)).
 * Reader(s): func_02058a08 (relocs.txt from:0x020590ec kind:load
 * to:0x02100504); func_02059744 (relocs.txt from:0x02059990 kind:load
 * to:0x02100504).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100504-0x02100514.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100504[16] = "Out of memory.";
