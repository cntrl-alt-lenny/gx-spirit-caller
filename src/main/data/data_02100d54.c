/* data_02100d54 (32 bytes, 4-aligned): string constant.
 * "Error parsing buddy message." (28 chars + NUL, zero-padded to 32 bytes
 * (automatic from array size > literal length)).
 * Reader(s): func_0205d15c (relocs.txt from:0x0205d4b4 kind:load
 * to:0x02100d54).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100d54-0x02100d74.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100d54[32] = "Error parsing buddy message.";
