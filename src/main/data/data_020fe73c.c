/* data_020fe73c (8 bytes, 4-aligned): OS_SPrintf-style format string.
 * "%013llu" (7 chars + NUL).
 * Reader(s): func_020409d8 (relocs.txt from:0x02040c78 kind:load
 * to:0x020fe73c).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020fe73c-0x020fe744.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020fe73c[8] = "%013llu";
