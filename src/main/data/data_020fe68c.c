/* data_020fe68c (12 bytes, 4-aligned): OS_SPrintf-style format string.
 * "%03d%03d" (8 chars + NUL, zero-padded to 12 bytes (automatic from array
 * size > literal length)).
 * Reader(s): func_0204068c (relocs.txt from:0x02040990 kind:load
 * to:0x020fe68c).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020fe68c-0x020fe698.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020fe68c[12] = "%03d%03d";
