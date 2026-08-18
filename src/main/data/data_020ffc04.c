/* data_020ffc04 (12 bytes, 4-aligned): string constant.
 * "localhost" (9 chars + NUL, zero-padded to 12 bytes (automatic from array
 * size > literal length)).
 * Reader(s): func_02054f44 (relocs.txt from:0x02054fbc kind:load
 * to:0x020ffc04).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020ffc04-0x020ffc10.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020ffc04[12] = "localhost";
