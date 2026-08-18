/* data_020feb90 (20 bytes, 4-aligned): string constant.
 * "FREE DWCnetcheck" (16 chars + NUL, zero-padded to 20 bytes (automatic
 * from array size > literal length)).
 * Reader(s): func_020432d0 (relocs.txt from:0x020433cc kind:load
 * to:0x020feb90).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020feb90-0x020feba4.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020feb90[20] = "FREE DWCnetcheck";
