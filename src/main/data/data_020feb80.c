/* data_020feb80 (16 bytes, 4-aligned): string constant.
 * "FREE DWChttp" (12 chars + NUL, zero-padded to 16 bytes (automatic from
 * array size > literal length)).
 * Reader(s): func_020432d0 (relocs.txt from:0x020433c0 kind:load
 * to:0x020feb80).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020feb80-0x020feb90.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020feb80[16] = "FREE DWChttp";
