/* data_020fe8a8 (4 bytes, 4-aligned): string constant.
 * ":" (1 chars + NUL, zero-padded to 4 bytes (automatic from array size >
 * literal length)).
 * Reader(s): func_02041248 (relocs.txt from:0x020413a8 kind:load
 * to:0x020fe8a8).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020fe8a8-0x020fe8ac.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020fe8a8[4] = ":";
