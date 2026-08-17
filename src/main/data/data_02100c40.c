/* data_02100c40 (40 bytes, 4-aligned): string constant.
 * "There was an error connecting a socket." (39 chars + NUL).
 * Reader(s): func_0205c54c (relocs.txt from:0x0205c6e0 kind:load
 * to:0x02100c40).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100c40-0x02100c68.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100c40[40] = "There was an error connecting a socket.";
