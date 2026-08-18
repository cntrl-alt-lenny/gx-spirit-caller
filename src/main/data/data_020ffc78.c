/* data_020ffc78 (24 bytes, 4-aligned): string constant.
 * "Invalid statusString." (21 chars + NUL, zero-padded to 24 bytes
 * (automatic from array size > literal length)).
 * Reader(s): func_02055420 (relocs.txt from:0x02055638 kind:load
 * to:0x020ffc78).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020ffc78-0x020ffc90.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020ffc78[24] = "Invalid statusString.";
