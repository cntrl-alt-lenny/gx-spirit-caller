/* data_020fe5fc (8 bytes, 4-aligned): string constant.
 * "token" (5 chars + NUL, zero-padded to 8 bytes (automatic from array size
 * > literal length)).
 * Reader(s): func_0203f968 (relocs.txt from:0x0203fc44 kind:load
 * to:0x020fe5fc).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020fe5fc-0x020fe604.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020fe5fc[8] = "token";
