/* data_02100920 (16 bytes, 4-aligned): string constant.
 * "Invalid sex." (12 chars + NUL, zero-padded to 16 bytes (automatic from
 * array size > literal length)).
 * Reader(s): func_0205a974 (relocs.txt from:0x0205ae04 kind:load
 * to:0x02100920).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100920-0x02100930.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100920[16] = "Invalid sex.";
