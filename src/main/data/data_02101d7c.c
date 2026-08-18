/* data_02101d7c (4 bytes, 4-aligned): OS_SPrintf-style format string.
 * "%d" (2 chars + NUL, zero-padded to 4 bytes (automatic from array size >
 * literal length)).
 * Reader(s): func_02068b1c (relocs.txt from:0x02068b50 kind:load
 * to:0x02101d7c).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02101d7c-0x02101d80.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02101d7c[4] = "%d";
