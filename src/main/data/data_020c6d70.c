/* data_020c6d70 (16 bytes, 4-aligned): OS_SPrintf-style format string.
 * "%s%s%s%s\n" (9 chars + NUL, zero-padded to 16 bytes (automatic from
 * array size > literal length)).
 * Reader(s): func_0202d9f8 (relocs.txt from:0x0202de94 kind:load
 * to:0x020c6d70).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020c6d70-0x020c6d80.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020c6d70[16] = "%s%s%s%s\n";
