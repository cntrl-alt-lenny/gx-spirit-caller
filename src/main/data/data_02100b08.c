/* data_02100b08 (16 bytes, 4-aligned): string constant.
 * "Out of memory." (14 chars + NUL, zero-padded to 16 bytes (automatic from
 * array size > literal length)).
 * Reader(s): func_0205be60 (relocs.txt from:0x0205bf14 kind:load
 * to:0x02100b08); func_0205bf18 (relocs.txt from:0x0205c24c kind:load
 * to:0x02100b08).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100b08-0x02100b18.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100b08[16] = "Out of memory.";
