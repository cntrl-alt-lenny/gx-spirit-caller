/* data_020ffbcc (8 bytes, 4-aligned): OS_SPrintf-style format string.
 * "%02x" (4 chars + NUL, zero-padded to 8 bytes (automatic from array size
 * > literal length)).
 * Reader(s): func_020548b4 (relocs.txt from:0x020548f0 kind:load
 * to:0x020ffbcc).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020ffbcc-0x020ffbd4.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020ffbcc[8] = "%02x";
