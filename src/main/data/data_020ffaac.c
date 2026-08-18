/* data_020ffaac (36 bytes, 4-aligned): string constant.
 * "0123456789abcdefghijklmnopqrstuv" (32 chars + NUL, zero-padded to 36
 * bytes (automatic from array size > literal length)).
 * Reader(s): func_0205340c (relocs.txt from:0x02053484 kind:load
 * to:0x020ffaac).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020ffaac-0x020ffad0.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020ffaac[36] = "0123456789abcdefghijklmnopqrstuv";
