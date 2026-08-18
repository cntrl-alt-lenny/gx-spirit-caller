/* data_020fe754 (12 bytes, 4-aligned): OS_SPrintf-style format string.
 * "%02x%02x" (8 chars + NUL, zero-padded to 12 bytes (automatic from array
 * size > literal length)).
 * Reader(s): func_020409d8 (relocs.txt from:0x02040c8c kind:load
 * to:0x020fe754).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020fe754-0x020fe760.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020fe754[12] = "%02x%02x";
