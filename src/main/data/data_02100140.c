/* data_02100140 (20 bytes, 4-aligned): string constant.
 * "connClosed != NULL" (18 chars + NUL, zero-padded to 20 bytes (automatic
 * from array size > literal length)).
 * Reader(s): func_02057b00 (relocs.txt from:0x02057d14 kind:load
 * to:0x02100140).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100140-0x02100154.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100140[20] = "connClosed != NULL";
