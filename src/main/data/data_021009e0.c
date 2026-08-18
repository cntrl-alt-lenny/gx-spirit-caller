/* data_021009e0 (48 bytes, 4-aligned): string constant.
 * "Unexpected data was received from the server." (45 chars + NUL,
 * zero-padded to 48 bytes (automatic from array size > literal length)).
 * Reader(s): func_0205af90 (relocs.txt from:0x0205b720 kind:load
 * to:0x021009e0).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x021009e0-0x02100a10.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_021009e0[48] = "Unexpected data was received from the server.";
