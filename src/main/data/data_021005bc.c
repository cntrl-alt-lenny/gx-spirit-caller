/* data_021005bc (20 bytes, 4-aligned): string constant.
 * "Invalid connection." (19 chars + NUL).
 * Reader(s): func_02059744 (relocs.txt from:0x02059980 kind:load
 * to:0x021005bc).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x021005bc-0x021005d0.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_021005bc[20] = "Invalid connection.";
