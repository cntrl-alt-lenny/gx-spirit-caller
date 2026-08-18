/* data_02100be4 (40 bytes, 4-aligned): string constant.
 * "There was an error creating a socket." (37 chars + NUL, zero-padded to
 * 40 bytes (automatic from array size > literal length)).
 * Reader(s): func_0205c54c (relocs.txt from:0x0205c6d8 kind:load
 * to:0x02100be4).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100be4-0x02100c0c.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100be4[40] = "There was an error creating a socket.";
