/* data_020ffa9c (16 bytes, 4-aligned): OS_SPrintf-style format string.
 * "%s%c%c%c%c%s" (12 chars + NUL, zero-padded to 16 bytes (automatic from
 * array size > literal length)).
 * Reader(s): func_0205337c (relocs.txt from:0x02053408 kind:load
 * to:0x020ffa9c).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020ffa9c-0x020ffaac.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020ffa9c[16] = "%s%c%c%c%c%s";
