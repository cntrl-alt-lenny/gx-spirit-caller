/* data_020fe550 (12 bytes, 4-aligned): string constant.
 * "NDWCSHAP" (8 chars + NUL, zero-padded to 12 bytes (automatic from array
 * size > literal length)).
 * Reader(s): func_0203f6cc (relocs.txt from:0x0203f714 kind:load
 * to:0x020fe550); func_0203f740 (relocs.txt from:0x0203f774 kind:load
 * to:0x020fe550).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020fe550-0x020fe55c.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020fe550[12] = "NDWCSHAP";
