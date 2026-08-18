/* data_02100668 (44 bytes, 4-aligned): string constant.
 * "There was an error listening on a socket." (41 chars + NUL, zero-padded
 * to 44 bytes (automatic from array size > literal length)).
 * Reader(s): func_0205999c (relocs.txt from:0x02059cfc kind:load
 * to:0x02100668).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100668-0x02100694.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100668[44] = "There was an error listening on a socket.";
