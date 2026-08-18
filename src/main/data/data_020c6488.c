/* data_020c6488 (8 bytes, 4-aligned): OS_SPrintf-style format string.
 * "%s -> " (6 chars + NUL, zero-padded to 8 bytes (automatic from array
 * size > literal length)).
 * Reader(s): func_0201f138 (relocs.txt from:0x0201f194 kind:load
 * to:0x020c6488).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020c6488-0x020c6490.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020c6488[8] = "%s -> ";
