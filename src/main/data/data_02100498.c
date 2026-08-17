/* data_02100498 (16 bytes, 4-aligned): OS_SPrintf-style format string.
 * "%s%s%s%s%s%s" (12 chars + NUL, zero-padded to 16 bytes (automatic from
 * array size > literal length)).
 * Reader(s): func_02058a08 (relocs.txt from:0x020590dc kind:load
 * to:0x02100498); func_0205938c (relocs.txt from:0x020596f8 kind:load
 * to:0x02100498).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100498-0x021004a8.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100498[16] = "%s%s%s%s%s%s";
