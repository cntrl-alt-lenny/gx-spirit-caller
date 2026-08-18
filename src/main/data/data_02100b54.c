/* data_02100b54 (16 bytes, 4-aligned): string constant.
 * "peer != NULL" (12 chars + NUL, zero-padded to 16 bytes (automatic from
 * array size > literal length)).
 * Reader(s): func_0205c258 (relocs.txt from:0x0205c32c kind:load
 * to:0x02100b54); func_0205c3c0 (relocs.txt from:0x0205c530 kind:load
 * to:0x02100b54); func_0205c9a0 (relocs.txt from:0x0205ca9c kind:load
 * to:0x02100b54).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100b54-0x02100b64.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100b54[16] = "peer != NULL";
