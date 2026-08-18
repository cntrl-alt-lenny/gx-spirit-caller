/* data_021001f4 (40 bytes, 4-aligned): string constant.
 * "There was an error sending on a socket." (39 chars + NUL).
 * Reader(s): func_02057f3c (relocs.txt from:0x02058030 kind:load
 * to:0x021001f4).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x021001f4-0x0210021c.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_021001f4[40] = "There was an error sending on a socket.";
