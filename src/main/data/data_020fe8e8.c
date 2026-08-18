/* data_020fe8e8 (4 bytes, 4-aligned): OS_SPrintf-style format string.
 * "%s" (2 chars + NUL, zero-padded to 4 bytes (automatic from array size >
 * literal length)).
 * Reader(s): func_0204152c (relocs.txt from:0x020415c4 kind:load
 * to:0x020fe8e8).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020fe8e8-0x020fe8ec.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020fe8e8[4] = "%s";
