/* data_020c6d6c (4 bytes, 4-aligned): string constant.
 * "?" (1 chars + NUL, zero-padded to 4 bytes (automatic from array size >
 * literal length)).
 * Reader(s): func_0202d9f8 (relocs.txt from:0x0202de88 kind:load
 * to:0x020c6d6c).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020c6d6c-0x020c6d70.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020c6d6c[4] = "?";
