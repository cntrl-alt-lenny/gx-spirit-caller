/* data_020c3fa0 (8 bytes, 4-aligned): file/archive path string.
 * "/sound/" (7 chars + NUL).
 * Reader(s): func_0200a994 (relocs.txt from:0x0200a9d0 kind:load
 * to:0x020c3fa0).
 * No outgoing relocs in this span (plain text, not pointers) -- relocs.txt
 * cross-checked over 0x020c3fa0-0x020c3fa8.
 * Not const: ground truth section is .data (delinks.txt); matches this
 * wave's canonical non-const char[] convention (data_ov008_021b275c.c).
 */
char data_020c3fa0[8] = "/sound/";
