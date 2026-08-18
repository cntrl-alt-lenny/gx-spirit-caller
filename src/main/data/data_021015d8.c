/* data_021015d8 (8 bytes, 4-aligned): OS_SPrintf-style format string.
 * "%s.%s" (5 chars + NUL, zero-padded to 8 bytes (automatic from array size
 * > literal length)).
 * Reader(s): func_02065934 (relocs.txt from:0x0206596c kind:load
 * to:0x021015d8).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x021015d8-0x021015e0.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_021015d8[8] = "%s.%s";
