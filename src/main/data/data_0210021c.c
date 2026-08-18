/* data_0210021c (36 bytes, 4-aligned): OS_SPrintf-style format string.
 * "SENDXXXX(%s): Connection closed\n" (32 chars + NUL, zero-padded to 36
 * bytes (automatic from array size > literal length)).
 * Reader(s): func_02057f3c (relocs.txt from:0x02058034 kind:load
 * to:0x0210021c).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x0210021c-0x02100240.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_0210021c[36] = "SENDXXXX(%s): Connection closed\n";
