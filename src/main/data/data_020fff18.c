/* data_020fff18 (40 bytes, 4-aligned): string constant.
 * "The server has closed the connection." (37 chars + NUL, zero-padded to
 * 40 bytes (automatic from array size > literal length)).
 * Reader(s): func_02056264 (relocs.txt from:0x02056590 kind:load
 * to:0x020fff18).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020fff18-0x020fff40.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020fff18[40] = "The server has closed the connection.";
