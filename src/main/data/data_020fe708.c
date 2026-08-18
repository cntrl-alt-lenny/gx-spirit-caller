/* data_020fe708 (24 bytes, 4-aligned): OS_SPrintf-style format string.
 * "Nitro WiFi SDK/%d.%d" (20 chars + NUL, zero-padded to 24 bytes
 * (automatic from array size > literal length)).
 * Reader(s): func_0204068c (relocs.txt from:0x020409cc kind:load
 * to:0x020fe708).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020fe708-0x020fe720.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020fe708[24] = "Nitro WiFi SDK/%d.%d";
