/* data_020fe8f0 (8 bytes, 4-aligned): OS_SPrintf-style format string.
 * "&%s=" (4 chars + NUL, zero-padded to 8 bytes (automatic from array size
 * > literal length)).
 * Reader(s): func_020415c8 (relocs.txt from:0x020416f4 kind:load
 * to:0x020fe8f0).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020fe8f0-0x020fe8f8.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020fe8f0[8] = "&%s=";
