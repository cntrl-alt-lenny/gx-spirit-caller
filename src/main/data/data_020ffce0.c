/* data_020ffce0 (16 bytes, 4-aligned): string constant.
 * "Invalid index." (14 chars + NUL, zero-padded to 16 bytes (automatic from
 * array size > literal length)).
 * Reader(s): func_020557b8 (relocs.txt from:0x020558ec kind:load
 * to:0x020ffce0).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020ffce0-0x020ffcf0.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020ffce0[16] = "Invalid index.";
