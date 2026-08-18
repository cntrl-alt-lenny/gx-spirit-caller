/* data_020ffe48 (8 bytes, 4-aligned): string constant.
 * "gpi.c" (5 chars + NUL, zero-padded to 8 bytes (automatic from array size
 * > literal length)).
 * Reader(s): func_020560a8 (relocs.txt from:0x02056254 kind:load
 * to:0x020ffe48).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020ffe48-0x020ffe50.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020ffe48[8] = "gpi.c";
