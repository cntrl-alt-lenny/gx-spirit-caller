/* data_02101778 (12 bytes, 4-aligned): OS_SPrintf-style format string.
 * "%08X%04X" (8 chars + NUL, zero-padded to 12 bytes (automatic from array
 * size > literal length)).
 * Reader(s): func_02066d44 (relocs.txt from:0x02066dfc kind:load
 * to:0x02101778).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02101778-0x02101784.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02101778[12] = "%08X%04X";
