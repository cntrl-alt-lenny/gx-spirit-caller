/* data_020c6634 (24 bytes, 4-aligned): string constant.
 * "not my parent ggid \n" (20 chars + NUL, zero-padded to 24 bytes
 * (automatic from array size > literal length)).
 * Reader(s): func_0201f954 (relocs.txt from:0x0201fb80 kind:load
 * to:0x020c6634).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020c6634-0x020c664c.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020c6634[24] = "not my parent ggid \n";
