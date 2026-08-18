/* data_020fe8ec (4 bytes, 4-aligned): OS_SPrintf-style format string.
 * "%s=" (3 chars + NUL).
 * Reader(s): func_020415c8 (relocs.txt from:0x020416f0 kind:load
 * to:0x020fe8ec).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020fe8ec-0x020fe8f0.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020fe8ec[4] = "%s=";
