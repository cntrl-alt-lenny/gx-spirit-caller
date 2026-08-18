/* data_021007c8 (16 bytes, 4-aligned): string constant.
 * "Invalid info." (13 chars + NUL, zero-padded to 16 bytes (automatic from
 * array size > literal length)).
 * Reader(s): func_0205a18c (relocs.txt from:0x0205a970 kind:load
 * to:0x021007c8); func_0205a974 (relocs.txt from:0x0205ae48 kind:load
 * to:0x021007c8).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x021007c8-0x021007d8.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_021007c8[16] = "Invalid info.";
