/* data_020fea80 (16 bytes, 4-aligned): string constant.
 * "ALLOC data_len" (14 chars + NUL, zero-padded to 16 bytes (automatic from
 * array size > literal length)).
 * Reader(s): func_020421d8 (relocs.txt from:0x02043148 kind:load
 * to:0x020fea80).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020fea80-0x020fea90.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020fea80[16] = "ALLOC data_len";
