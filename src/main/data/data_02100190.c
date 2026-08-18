/* data_02100190 (36 bytes, 4-aligned): OS_SPrintf-style format string.
 * "RECVXXXX(%s): Connection closed\n" (32 chars + NUL, zero-padded to 36
 * bytes (automatic from array size > literal length)).
 * Reader(s): func_02057b00 (relocs.txt from:0x02057d24 kind:load
 * to:0x02100190).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100190-0x021001b4.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100190[36] = "RECVXXXX(%s): Connection closed\n";
