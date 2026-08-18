/* data_020fe74c (8 bytes, 4-aligned): OS_SPrintf-style format string.
 * "%02x" (4 chars + NUL, zero-padded to 8 bytes (automatic from array size
 * > literal length)).
 * Reader(s): func_020409d8 (relocs.txt from:0x02040c88 kind:load
 * to:0x020fe74c).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020fe74c-0x020fe754.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020fe74c[8] = "%02x";
