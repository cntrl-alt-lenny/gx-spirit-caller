/* data_020c685c (28 bytes, 4-aligned): OS_SPrintf-style format string.
 * "WH_Finalize, state = %d\n" (24 chars + NUL, zero-padded to 28 bytes
 * (automatic from array size > literal length)).
 * Reader(s): func_02020ba0 (relocs.txt from:0x02020c90 kind:load
 * to:0x020c685c).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020c685c-0x020c6878.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020c685c[28] = "WH_Finalize, state = %d\n";
