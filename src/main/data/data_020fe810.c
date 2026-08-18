/* data_020fe810 (4 bytes, 4-aligned): string constant.
 * ": " (2 chars + NUL, zero-padded to 4 bytes (automatic from array size >
 * literal length)).
 * Reader(s): func_02040e3c (relocs.txt from:0x020410e0 kind:load
 * to:0x020fe810).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020fe810-0x020fe814.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020fe810[4] = ": ";
