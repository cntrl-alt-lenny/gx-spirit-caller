/* data_020ffeb0 (40 bytes, 4-aligned): OS_SPrintf-style format string.
 * "No matching operation found for id %d\n" (38 chars + NUL, zero-padded to
 * 40 bytes (automatic from array size > literal length)).
 * Reader(s): func_02056264 (relocs.txt from:0x02056580 kind:load
 * to:0x020ffeb0).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020ffeb0-0x020ffed8.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020ffeb0[40] = "No matching operation found for id %d\n";
