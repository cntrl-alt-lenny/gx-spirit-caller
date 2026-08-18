/* data_02100640 (40 bytes, 4-aligned): string constant.
 * "There was an error binding a socket." (36 chars + NUL, zero-padded to 40
 * bytes (automatic from array size > literal length)).
 * Reader(s): func_0205999c (relocs.txt from:0x02059cf8 kind:load
 * to:0x02100640).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100640-0x02100668.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100640[40] = "There was an error binding a socket.";
