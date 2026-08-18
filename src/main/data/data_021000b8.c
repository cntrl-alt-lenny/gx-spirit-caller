/* data_021000b8 (24 bytes, 4-aligned): string constant.
 * "outputBuffer != NULL" (20 chars + NUL, zero-padded to 24 bytes
 * (automatic from array size > literal length)).
 * Reader(s): func_02057980 (relocs.txt from:0x02057ae0 kind:load
 * to:0x021000b8); func_020580a0 (relocs.txt from:0x020581a0 kind:load
 * to:0x021000b8); func_020581a8 (relocs.txt from:0x02058238 kind:load
 * to:0x021000b8).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x021000b8-0x021000d0.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_021000b8[24] = "outputBuffer != NULL";
