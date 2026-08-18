/* data_021005e4 (40 bytes, 4-aligned): string constant.
 * "There was an error creating a socket." (37 chars + NUL, zero-padded to
 * 40 bytes (automatic from array size > literal length)).
 * Reader(s): func_0205999c (relocs.txt from:0x02059cf0 kind:load
 * to:0x021005e4).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x021005e4-0x0210060c.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_021005e4[40] = "There was an error creating a socket.";
