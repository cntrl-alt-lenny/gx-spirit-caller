/* data_021002c8 (24 bytes, 4-aligned): string constant.
 * "result != GP_NO_ERROR" (21 chars + NUL, zero-padded to 24 bytes
 * (automatic from array size > literal length)).
 * Reader(s): func_020585d4 (relocs.txt from:0x020586c0 kind:load
 * to:0x021002c8).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x021002c8-0x021002e0.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_021002c8[24] = "result != GP_NO_ERROR";
