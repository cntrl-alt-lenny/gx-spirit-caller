/* data_020c67f8 (24 bytes, 4-aligned): OS_SPrintf-style format string.
 * "decided channel = %d\n" (21 chars + NUL, zero-padded to 24 bytes
 * (automatic from array size > literal length)).
 * Reader(s): func_020206d8 (relocs.txt from:0x02020734 kind:load
 * to:0x020c67f8).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020c67f8-0x020c6810.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020c67f8[24] = "decided channel = %d\n";
