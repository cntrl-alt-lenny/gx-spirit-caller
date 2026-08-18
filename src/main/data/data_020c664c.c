/* data_020c664c (20 bytes, 4-aligned): string constant.
 * "not recieve entry\n" (18 chars + NUL, zero-padded to 20 bytes (automatic
 * from array size > literal length)).
 * Reader(s): func_0201f954 (relocs.txt from:0x0201fb84 kind:load
 * to:0x020c664c).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020c664c-0x020c6660.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020c664c[20] = "not recieve entry\n";
