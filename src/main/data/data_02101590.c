/* data_02101590 (4 bytes, 4-aligned): OS_SPrintf-style format string.
 * "%s" (2 chars + NUL, zero-padded to 4 bytes (automatic from array size >
 * literal length)).
 * Reader(s): func_02064f84 (relocs.txt from:0x02065044 kind:load
 * to:0x02101590).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02101590-0x02101594.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02101590[4] = "%s";
