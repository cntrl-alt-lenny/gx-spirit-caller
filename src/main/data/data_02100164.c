/* data_02100164 (44 bytes, 4-aligned): string constant.
 * "There was an error reading from a socket." (41 chars + NUL, zero-padded
 * to 44 bytes (automatic from array size > literal length)).
 * Reader(s): func_02057b00 (relocs.txt from:0x02057d20 kind:load
 * to:0x02100164).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100164-0x02100190.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100164[44] = "There was an error reading from a socket.";
