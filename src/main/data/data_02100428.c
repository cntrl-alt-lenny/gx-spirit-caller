/* data_02100428 (48 bytes, 4-aligned): string constant.
 * "Unexepected data was received from the server." (46 chars + NUL,
 * zero-padded to 48 bytes (automatic from array size > literal length)).
 * Reader(s): func_02058a08 (relocs.txt from:0x020590b8 kind:load
 * to:0x02100428).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100428-0x02100458.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100428[48] = "Unexepected data was received from the server.";
