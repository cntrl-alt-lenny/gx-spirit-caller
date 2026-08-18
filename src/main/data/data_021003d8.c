/* data_021003d8 (48 bytes, 4-aligned): string constant.
 * "Unexpected data was received from the server." (45 chars + NUL,
 * zero-padded to 48 bytes (automatic from array size > literal length)).
 * Reader(s): func_02058a08 (relocs.txt from:0x020590a8 kind:load
 * to:0x021003d8).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x021003d8-0x02100408.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_021003d8[48] = "Unexpected data was received from the server.";
