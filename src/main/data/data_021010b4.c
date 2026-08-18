/* data_021010b4 (32 bytes, 4-aligned): string constant.
 * "count == arg->numSuggestedNicks" (31 chars + NUL).
 * Reader(s): func_0205dba4 (relocs.txt from:0x0205f838 kind:load
 * to:0x021010b4).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x021010b4-0x021010d4.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_021010b4[32] = "count == arg->numSuggestedNicks";
