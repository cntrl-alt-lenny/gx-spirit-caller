/* data_020c3f44 (4 bytes, 4-aligned): string constant.
 * ".LZ" (3 chars + NUL).
 * Reader(s): func_02006c0c (relocs.txt from:0x02006e14 kind:load
 * to:0x020c3f44); func_02006e28 (relocs.txt from:0x02006ee8 kind:load
 * to:0x020c3f44); func_02006ef0 (relocs.txt from:0x020070d4 kind:load
 * to:0x020c3f44).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020c3f44-0x020c3f48.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020c3f44[4] = ".LZ";
