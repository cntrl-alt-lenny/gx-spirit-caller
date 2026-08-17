/* data_021000d0 (12 bytes, 4-aligned): string constant.
 * "gpiBuffer.c" (11 chars + NUL).
 * Reader(s): func_02057980 (relocs.txt from:0x02057ae4 kind:load
 * to:0x021000d0); func_02057b00 (relocs.txt from:0x02057d00 kind:load
 * to:0x021000d0); func_02057d5c (relocs.txt from:0x02057e58 kind:load
 * to:0x021000d0); +3 more reader(s), same relocs.txt to:0x021000d0.
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x021000d0-0x021000dc.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_021000d0[12] = "gpiBuffer.c";
