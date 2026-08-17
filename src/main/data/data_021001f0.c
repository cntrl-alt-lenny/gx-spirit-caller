/* data_021001f0 (4 bytes, 4-aligned): string constant.
 * "PT" (2 chars + NUL, zero-padded to 4 bytes (automatic from array size >
 * literal length)).
 * Reader(s): func_02057d5c (relocs.txt from:0x02057e5c kind:load
 * to:0x021001f0); func_02057e60 (relocs.txt from:0x02057f38 kind:load
 * to:0x021001f0).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x021001f0-0x021001f4.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_021001f0[4] = "PT";
