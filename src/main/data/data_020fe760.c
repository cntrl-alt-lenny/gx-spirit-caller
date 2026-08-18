/* data_020fe760 (28 bytes, 4-aligned): OS_SPrintf-style format string.
 * "%02d%02d%02d%02d%02d%02d" (24 chars + NUL, zero-padded to 28 bytes
 * (automatic from array size > literal length)).
 * Reader(s): func_020409d8 (relocs.txt from:0x02040c90 kind:load
 * to:0x020fe760).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020fe760-0x020fe77c.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020fe760[28] = "%02d%02d%02d%02d%02d%02d";
