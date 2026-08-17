/* data_020ffa60 (12 bytes, 4-aligned): string constant.
 * "Init state" (10 chars + NUL, zero-padded to 12 bytes (automatic from
 * array size > literal length)).
 * Reader(s): func_02050450 (relocs.txt from:0x02050698 kind:load
 * to:0x020ffa60).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020ffa60-0x020ffa6c.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020ffa60[12] = "Init state";
