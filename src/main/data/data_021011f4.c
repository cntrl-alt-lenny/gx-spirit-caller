/* data_021011f4 (48 bytes, 4-aligned): string constant.
 * "Unexpected data was received from the server." (45 chars + NUL,
 * zero-padded to 48 bytes (automatic from array size > literal length)).
 * Reader(s): func_0205febc (relocs.txt from:0x0205ffb8 kind:load
 * to:0x021011f4).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x021011f4-0x02101224.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_021011f4[48] = "Unexpected data was received from the server.";
