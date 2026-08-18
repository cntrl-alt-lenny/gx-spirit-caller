/* data_020feb48 (4 bytes, 4-aligned): string constant.
 * "url" (3 chars + NUL).
 * Reader(s): func_020421d8 (relocs.txt from:0x02043138 kind:load
 * to:0x020feb48).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020feb48-0x020feb4c.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020feb48[4] = "url";
