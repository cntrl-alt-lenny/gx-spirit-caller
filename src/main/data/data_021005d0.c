/* data_021005d0 (20 bytes, 4-aligned): string constant.
 * "Invalid firewall." (17 chars + NUL, zero-padded to 20 bytes (automatic
 * from array size > literal length)).
 * Reader(s): func_02059744 (relocs.txt from:0x02059984 kind:load
 * to:0x021005d0).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x021005d0-0x021005e4.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_021005d0[20] = "Invalid firewall.";
