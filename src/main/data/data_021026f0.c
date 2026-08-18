/* data_021026f0 (4 bytes, 4-aligned): string constant.
 * "(" (1 chars + NUL, zero-padded to 4 bytes (automatic from array size >
 * literal length)).
 * Reader(s): func_020a3f48 (relocs.txt from:0x020a416c kind:load
 * to:0x021026f0); func_020a41f8 (relocs.txt from:0x020a4a78 kind:load
 * to:0x021026f0); func_020a53e4 (relocs.txt from:0x020a5450 kind:load
 * to:0x021026f0).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x021026f0-0x021026f4.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_021026f0[4] = "(";
