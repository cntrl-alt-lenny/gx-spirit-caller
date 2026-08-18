/* data_020feb2c (8 bytes, 4-aligned): string constant.
 * "parse" (5 chars + NUL, zero-padded to 8 bytes (automatic from array size
 * > literal length)).
 * Reader(s): func_020421d8 (relocs.txt from:0x02043128 kind:load
 * to:0x020feb2c).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020feb2c-0x020feb34.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020feb2c[8] = "parse";
