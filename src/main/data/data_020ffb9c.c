/* data_020ffb9c (8 bytes, 4-aligned): string constant.
 * "compFn" (6 chars + NUL, zero-padded to 8 bytes (automatic from array
 * size > literal length)).
 * Reader(s): func_02054700 (relocs.txt from:0x0205482c kind:load
 * to:0x020ffb9c).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020ffb9c-0x020ffba4.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020ffb9c[8] = "compFn";
