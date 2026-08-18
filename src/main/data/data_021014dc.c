/* data_021014dc (8 bytes, 4-aligned): string constant.
 * "socket" (6 chars + NUL, zero-padded to 8 bytes (automatic from array
 * size > literal length)).
 * Reader(s): func_02061578 (relocs.txt from:0x02061664 kind:load
 * to:0x021014dc); func_02061670 (relocs.txt from:0x02061790 kind:load
 * to:0x021014dc); func_02061e88 (relocs.txt from:0x02061f18 kind:load
 * to:0x021014dc).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x021014dc-0x021014e4.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_021014dc[8] = "socket";
