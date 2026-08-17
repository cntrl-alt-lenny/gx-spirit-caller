/* data_020febb8 (16 bytes, 4-aligned): string constant.
 * "ALLOC DWChttp" (13 chars + NUL, zero-padded to 16 bytes (automatic from
 * array size > literal length)).
 * Reader(s): func_020433d0 (relocs.txt from:0x020434d4 kind:load
 * to:0x020febb8).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020febb8-0x020febc8.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020febb8[16] = "ALLOC DWChttp";
