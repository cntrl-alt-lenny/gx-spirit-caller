/* data_020c65cc (24 bytes, 4-aligned): OS_SPrintf-style format string.
 * "send buffer size = %d\n" (22 chars + NUL, zero-padded to 24 bytes
 * (automatic from array size > literal length)).
 * Reader(s): func_02020914 (relocs.txt from:0x02020a1c kind:load
 * to:0x020c65cc); func_02020a24 (relocs.txt from:0x02020b18 kind:load
 * to:0x020c65cc).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020c65cc-0x020c65e4.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020c65cc[24] = "send buffer size = %d\n";
