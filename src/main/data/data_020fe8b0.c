/* data_020fe8b0 (16 bytes, 4-aligned): string constant.
 * "ALLOC newptr" (12 chars + NUL, zero-padded to 16 bytes (automatic from
 * array size > literal length)).
 * Reader(s): func_020413b0 (relocs.txt from:0x02041468 kind:load
 * to:0x020fe8b0).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020fe8b0-0x020fe8c0.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020fe8b0[16] = "ALLOC newptr";
