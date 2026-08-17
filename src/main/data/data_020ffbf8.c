/* data_020ffbf8 (12 bytes, 4-aligned): string constant.
 * "nonport.c" (9 chars + NUL, zero-padded to 12 bytes (automatic from array
 * size > literal length)).
 * Reader(s): func_02054b9c (relocs.txt from:0x02054bf0 kind:load
 * to:0x020ffbf8); func_02055330 (relocs.txt from:0x02055380 kind:load
 * to:0x020ffbf8).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020ffbf8-0x020ffc04.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020ffbf8[12] = "nonport.c";
