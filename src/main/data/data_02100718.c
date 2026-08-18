/* data_02100718 (40 bytes, 4-aligned): string constant.
 * "There was an error connecting a socket." (39 chars + NUL).
 * Reader(s): func_0205999c (relocs.txt from:0x02059d18 kind:load
 * to:0x02100718).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100718-0x02100740.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100718[40] = "There was an error connecting a socket.";
