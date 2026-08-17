/* data_020ffe8c (12 bytes, 4-aligned): OS_SPrintf-style format string.
 * "CMD: %s\n" (8 chars + NUL, zero-padded to 12 bytes (automatic from array
 * size > literal length)).
 * Reader(s): func_02056264 (relocs.txt from:0x02056574 kind:load
 * to:0x020ffe8c).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020ffe8c-0x020ffe98.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020ffe8c[12] = "CMD: %s\n";
