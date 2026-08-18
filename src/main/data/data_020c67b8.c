/* data_020c67b8 (36 bytes, 4-aligned): OS_SPrintf-style format string.
 * "WH_StateInSetMPData failed - %s\n" (32 chars + NUL, zero-padded to 36
 * bytes (automatic from array size > literal length)).
 * Reader(s): func_020202ac (relocs.txt from:0x02020354 kind:load
 * to:0x020c67b8).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020c67b8-0x020c67dc.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020c67b8[36] = "WH_StateInSetMPData failed - %s\n";
