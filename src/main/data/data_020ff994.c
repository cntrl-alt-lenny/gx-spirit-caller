/* data_020ff994 (12 bytes, 4-aligned): string constant.
 * "maxplayers" (10 chars + NUL, zero-padded to 12 bytes (automatic from
 * array size > literal length)).
 * Reader(s): func_0204b1a4 (relocs.txt from:0x0204b26c kind:load
 * to:0x020ff994).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020ff994-0x020ff9a0.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020ff994[12] = "maxplayers";
