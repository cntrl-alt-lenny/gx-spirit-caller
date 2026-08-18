/* data_020fea90 (16 bytes, 4-aligned): string constant.
 * "ALLOC wait_len" (14 chars + NUL, zero-padded to 16 bytes (automatic from
 * array size > literal length)).
 * Reader(s): func_020421d8 (relocs.txt from:0x0204314c kind:load
 * to:0x020fea90).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020fea90-0x020feaa0.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020fea90[16] = "ALLOC wait_len";
