/* data_02101d54 (8 bytes, 4-aligned): OS_SPrintf-style format string.
 * "%s%d" (4 chars + NUL, zero-padded to 8 bytes (automatic from array size
 * > literal length)).
 * Reader(s): func_02068628 (relocs.txt from:0x02068808 kind:load
 * to:0x02101d54).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02101d54-0x02101d5c.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02101d54[8] = "%s%d";
