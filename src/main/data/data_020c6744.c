/* data_020c6744 (24 bytes, 4-aligned): OS_SPrintf-style format string.
 * "unknown state %d, %s\n" (21 chars + NUL, zero-padded to 24 bytes
 * (automatic from array size > literal length)).
 * Reader(s): func_0201fdc4 (relocs.txt from:0x0201ff28 kind:load
 * to:0x020c6744).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020c6744-0x020c675c.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020c6744[24] = "unknown state %d, %s\n";
