/* data_02101750 (20 bytes, 4-aligned): string constant.
 * "final\\\\queryid\\1.1" (18 chars + NUL, zero-padded to 20 bytes
 * (automatic from array size > literal length)).
 * Reader(s): func_0206677c (relocs.txt from:0x020667e4 kind:load
 * to:0x02101750).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x02101750-0x02101764.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_02101750[20] = "final\\\\queryid\\1.1";
