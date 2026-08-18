/* data_02100490 (8 bytes, 4-aligned): OS_SPrintf-style format string.
 * "%s@%s" (5 chars + NUL, zero-padded to 8 bytes (automatic from array size
 * > literal length)).
 * Reader(s): func_02058a08 (relocs.txt from:0x020590d8 kind:load
 * to:0x02100490); func_0205938c (relocs.txt from:0x020596f4 kind:load
 * to:0x02100490).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100490-0x02100498.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100490[8] = "%s@%s";
