/* data_020fe77c (16 bytes, 4-aligned): OS_SPrintf-style format string.
 * "%02d:0000000-00" (15 chars + NUL).
 * Reader(s): func_020409d8 (relocs.txt from:0x02040c94 kind:load
 * to:0x020fe77c).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020fe77c-0x020fe78c.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020fe77c[16] = "%02d:0000000-00";
