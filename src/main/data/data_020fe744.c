/* data_020fe744 (8 bytes, 4-aligned): OS_SPrintf-style format string.
 * "%03u" (4 chars + NUL, zero-padded to 8 bytes (automatic from array size
 * > literal length)).
 * Reader(s): func_020409d8 (relocs.txt from:0x02040c7c kind:load
 * to:0x020fe744).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020fe744-0x020fe74c.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020fe744[8] = "%03u";
