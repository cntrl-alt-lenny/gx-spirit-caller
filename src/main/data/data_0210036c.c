/* data_0210036c (4 bytes, 4-aligned): string constant.
 * "CM" (2 chars + NUL, zero-padded to 4 bytes (automatic from array size >
 * literal length)).
 * Reader(s): func_020586c8 (relocs.txt from:0x02058884 kind:load
 * to:0x0210036c).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x0210036c-0x02100370.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_0210036c[4] = "CM";
