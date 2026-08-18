/* data_020fe7d4 (28 bytes, 4-aligned): string constant.
 * "FREE array_entry[i].value" (25 chars + NUL, zero-padded to 28 bytes
 * (automatic from array size > literal length)).
 * Reader(s): func_02040cc0 (relocs.txt from:0x02040d50 kind:load
 * to:0x020fe7d4).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020fe7d4-0x020fe7f0.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020fe7d4[28] = "FREE array_entry[i].value";
