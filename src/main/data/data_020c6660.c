/* data_020c6660 (16 bytes, 4-aligned): string constant.
 * "parent find\n" (12 chars + NUL, zero-padded to 16 bytes (automatic from
 * array size > literal length)).
 * Reader(s): func_0201f954 (relocs.txt from:0x0201fb88 kind:load
 * to:0x020c6660).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020c6660-0x020c6670.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020c6660[16] = "parent find\n";
