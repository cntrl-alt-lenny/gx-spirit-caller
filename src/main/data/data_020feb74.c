/* data_020feb74 (12 bytes, 4-aligned): string constant.
 * "FREE wait" (9 chars + NUL, zero-padded to 12 bytes (automatic from array
 * size > literal length)).
 * Reader(s): func_020421d8 (relocs.txt from:0x02043164 kind:load
 * to:0x020feb74).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020feb74-0x020feb80.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020feb74[12] = "FREE wait";
