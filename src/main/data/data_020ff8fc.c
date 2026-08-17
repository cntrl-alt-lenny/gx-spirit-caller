/* data_020ff8fc (12 bytes, 4-aligned): OS_SPrintf-style format string.
 * "%c%s%c%s" (8 chars + NUL, zero-padded to 12 bytes (automatic from array
 * size > literal length)).
 * Reader(s): func_02045c7c (relocs.txt from:0x02045cb4 kind:load
 * to:0x020ff8fc).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020ff8fc-0x020ff908.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020ff8fc[12] = "%c%s%c%s";
