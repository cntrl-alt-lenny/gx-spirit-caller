/* data_020ffb64 (12 bytes, 4-aligned): string constant.
 * "elemSize" (8 chars + NUL, zero-padded to 12 bytes (automatic from array
 * size > literal length)).
 * Reader(s): func_020541b8 (relocs.txt from:0x02054284 kind:load
 * to:0x020ffb64).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020ffb64-0x020ffb70.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020ffb64[12] = "elemSize";
