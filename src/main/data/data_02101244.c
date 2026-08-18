/* data_02101244 (16 bytes, 4-aligned): string constant.
 * "gpiUtility.c" (12 chars + NUL, zero-padded to 16 bytes (automatic from
 * array size > literal length)).
 * Reader(s): func_02060000 (relocs.txt from:0x020601b0 kind:load
 * to:0x02101244); func_020602c4 (relocs.txt from:0x020603b0 kind:load
 * to:0x02101244); func_020604b0 (relocs.txt from:0x02060518 kind:load
 * to:0x02101244).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02101244-0x02101254.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02101244[16] = "gpiUtility.c";
