/* data_02100d94 (48 bytes, 4-aligned): string constant.
 * "Unexpected data was received from the server." (45 chars + NUL,
 * zero-padded to 48 bytes (automatic from array size > literal length)).
 * Reader(s): func_0205d7e4 (relocs.txt from:0x0205d938 kind:load
 * to:0x02100d94).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100d94-0x02100dc4.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100d94[48] = "Unexpected data was received from the server.";
