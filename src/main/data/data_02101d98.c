/* data_02101d98 (24 bytes, 4-aligned): string constant.
 * "slist->inbufferlen >= 0" (23 chars + NUL).
 * Reader(s): func_02069720 (relocs.txt from:0x020698f0 kind:load
 * to:0x02101d98).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02101d98-0x02101db0.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02101d98[24] = "slist->inbufferlen >= 0";
