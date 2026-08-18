/* data_02100280 (16 bytes, 4-aligned): string constant.
 * "gpiCallback.c" (13 chars + NUL, zero-padded to 16 bytes (automatic from
 * array size > literal length)).
 * Reader(s): func_02058334 (relocs.txt from:0x02058520 kind:load
 * to:0x02100280); func_020585d4 (relocs.txt from:0x020586bc kind:load
 * to:0x02100280).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02100280-0x02100290.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02100280[16] = "gpiCallback.c";
