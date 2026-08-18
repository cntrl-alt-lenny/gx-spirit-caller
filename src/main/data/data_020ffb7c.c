/* data_020ffb7c (4 bytes, 4-aligned): string constant.
 * "fn" (2 chars + NUL, zero-padded to 4 bytes (automatic from array size >
 * literal length)).
 * Reader(s): func_02054338 (relocs.txt from:0x020543b0 kind:load
 * to:0x020ffb7c); func_020543b8 (relocs.txt from:0x02054424 kind:load
 * to:0x020ffb7c).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020ffb7c-0x020ffb80.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020ffb7c[4] = "fn";
